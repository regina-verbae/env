#!/usr/bin/env perl
#####################################################################
## AUTHOR: Mary Ehlers, regina.verbae@gmail.com
## ABSTRACT: Return the path to the given module or open for editing
#####################################################################

use v5.16;
use warnings;

use Getopt::Long;
use Path::Tiny;

my $opts = {};
GetOptions($opts,
    'path|p',
    'editor|e=s',
    'help|h',
    'version|v',
) or usage();
usage() if $opts->{help};

my $module = shift;
usage() unless $module;

$opts->{editor} //= $ENV{EDITOR} // "gvim";

#####################################################################

if ($opts->{version}) {
    my $cmd = "perl -M$module -e 'print \$$module\::VERSION;'";
    chomp(my $version = `$cmd`);
    $version ||= '<unknown>';
    say "VERSION for $module: $version";
    exit unless $opts->{path};
}

my $cmd = "perldoc -l -m $module";
chomp(my $perldoc = `$cmd`);
chomp($perldoc);

my $path = path($perldoc);

say $perldoc and exit 1 if !$path->exists;

say $path and exit if $opts->{path};

exec "$opts->{editor} $path";

die "Unable to exec '$opts->{editor} $path'\n";

#####################################################################

sub usage {
    my $message = shift;

    my $OUT = defined $message ? \*STDERR : \*STDOUT;

    say $OUT "\n$message\n" if $message;

    my $usage = "Usage: ".path($0)->basename." [options] <module>\n";
    $usage .= << "USAGEEND";
  Attempts to locate the path for the given module and
    opens the file
Options:
  [-path|p]             Print the path to the module*
  [-version|v]          Print the version of the module*
      Note: If either --path or --version requested,
        the file will not be opened
  [-editor|e <editor>]  Editor used for editing
    Default is \$ENV{EDITOR} // gvim
USAGEEND

    say $OUT $usage;
    exit;
}
