#!/usr/bin/env perl
#####################################################################
## AUTHOR: Mary Ehlers, regina.verbae@gmail.com
## ABSTRACT: Return the path to the given module or open for editing
#####################################################################

use v5.16;
use warnings;

use Getopt::Long;
use Path::Tiny;
use Syntax::Keyword::Try;

my $opts = {};
GetOptions($opts,
    'path|p',
    'share|s',
    'editor|e=s',
    'help|h',
    'version|v',
) or usage();
usage() if $opts->{help};

my $module = shift;
usage() unless $module;

$opts->{editor} //= $ENV{EDITOR} // "gvim";

#####################################################################

my $mod_path = ($module =~ s{::}{/}gr) . '.pm';

eval "require $module";

my $error = $@;

my $path = $INC{$mod_path} // $INC{$mod_path.'c'};

die "Perl could not load the given module: $error" if !$path and $error;

die "Perl cannot find the given module\n" unless $path;

if ($opts->{version}) {
    my $version = eval "\$$module\::VERSION";
    say "VERSION of $module: " . ($version ? $version : '<unknown>');
}

die "Path $path does not exist" unless -e $path;

say $path if $opts->{path};

if ($opts->{share}) {
    require File::ShareDir;
    my $dist = $module =~ s{::}{-}gr;
    try {
        my $mod_dir = File::ShareDir::module_dir($module);
        say for "File::ShareDir::module_dir('$module'):", $mod_dir;
    }
    catch {
        try {
            my $dist_dir = File::ShareDir::dist_dir($dist);
            say for "File::ShareDir::dist_dir('$dist'):", $dist_dir;
        }
        catch {
            warn "Both File::ShareDir's module_dir($module) and dist_dir($dist) failed\n";
        }
    }
}

exit if $opts->{path} or $opts->{version} or $opts->{share};

exec "$opts->{editor} $path";

die "Unable to exec '$opts->{editor} $path'\n";

#####################################################################

sub usage {
    my $message = shift;

    my $OUT = defined $message ? \*STDERR : \*STDOUT;

    say $OUT "\n$message\n" if $message;

    my $usage = "Usage: ".path($0)->basename." [options] <module>\n";
    $usage .= << "USAGEEND";
  Attempts to locate and open the given Perl module
    or prints information about it
Options:
  --path|p             Print the path to the module*
  --version|v          Print the version of the module*
  --share|s            Print the File::ShareDir path for the module*
  --editor|e=<editor>  Editor used for editing
      Default is \$ENV{EDITOR} // gvim
  --help|h
    
    * Module will not be opened for editing
USAGEEND

    say $OUT $usage;
    exit;
}
