#!/usr/bin/env perl

use v5.10;
use warnings;

use Getopt::Long;
use Path::Tiny;

my %TYPES = map { $_ => 1 } qw(script package object test);

my $opts = {};
GetOptions($opts,
    'type|t=s',
    'package|p=s',
    'outfile|o=s',
    'help|h',
);
usage() if $opts->{help};
$opts->{type} //= 'script';

usage("Type '$opts->{type}' not valid") unless $TYPES{$opts->{type}};

usage("Must provide -p package name")
    if !$opts->{package}
        and grep { $opts->{type} eq $_ } qw(package object test);

usage("Must provide -o output file for scripts and tests")
    if !$opts->{outfile}
        and ($opts->{type} eq 'script' or $opts->{type} eq 'test');

my %ATTR;
$ATTR{$opts->{type}}++;
$ATTR{script}++ if $ATTR{test};

my $output = $ATTR{script} ? "#!/usr/bin/env perl\n" : "";
$output .= << "THEEND";
#####################################################################
## AUTHOR: Mary Ehlers, regina.verbae\@gmail.com
THEEND

$output .= $ATTR{test} ? << "THEEND"
## ABSTRACT: Test the $opts->{package} module
THEEND
: << "THEEND";
## ABSTRACT: 
THEEND

$output .= << "THEEND";
#####################################################################

THEEND

$output .= ($ATTR{package} or $ATTR{object}) ? "package $opts->{package};\n\n" : "";

$output .= << "THEEND";
use v5.10;
use strict;
use warnings;

THEEND

$output .= $ATTR{package} ? <<"THEEND"
use Path::Tiny;

use parent qw(Exporter);
our \@EXPORT_OK = qw(

);

=pod

=head1 SYNOPSIS



=cut

THEEND
: "";

$output .= $ATTR{object} ? << "THEEND"
use Moo;

#####################################################################

=head1 CONSTRUCTOR

=cut



#####################################################################

=head1 METHODS

=cut



THEEND
: "";

$output .= $ATTR{package} ? << "THEEND"
#####################################################################

=head1 SUBROUTINES AVAILABLE FOR EXPORT

=cut



#####################################################################

THEEND
: '';

$output .= ($ATTR{package} or $ATTR{object}) ? << "THEEND"
1;

__END__

=head1 SEE ALSO



=cut
THEEND
: "";

my ($short_package_name) = $opts->{package} =~ /([^:]+)$/
    if $opts->{package};
$output .= $ATTR{test} ? << "THEEND"
use Data::Printer;
use Path::Tiny;
use Test::Most;

my \$APP = "$opts->{package}";

use $opts->{package};

my \$TEST_DIR = path(\$0)->sibling('$short_package_name');

#####################################################################

# Test 
{
    subtest "\$APP - " => sub {

    };
}

#####################################################################

done_testing();
THEEND
: "";

$output .= $opts->{type} eq 'script' ? << "THEEND"
use Getopt::Long;
use Path::Tiny;

my \$opts = {};
GetOptions(\$opts,
    'help|h',
    'version',
) or usage();

#####################################################################



#####################################################################

sub usage {
    my \$message = shift;

    my \$OUT = defined \$message ? \\*STDERR : \\*STDOUT;

    say \$OUT "\\n\$message\\n" if \$message;

    my \$usage = 'Usage: '.path(\$0)->basename."[options] <arg>\\n";
    \$usage .= <<"USAGEEND";
  
Options:
  --thing=<thing>
      Default: 
  --version
  --help|h
USAGEEND

    say \$OUT \$usage;
    exit;
}
THEEND
: "";

if ($opts->{outfile}) {
    $opts->{outfile} = path($opts->{outfile});
    $opts->{outfile}->parent->mkpath;
    $opts->{outfile}->spew($output);
    $opts->{outfile}->chmod(0770) if $ATTR{script};

    exec "gvim $opts->{outfile}";
}
else {
    print $output;
}

sub usage {
    my $message = shift;

    my $OUT = defined $message ? \*STDERR : \*STDOUT;

    say $OUT "\n$message\n" if $message;

    my $usage = "Usage: ".path($0)->basename." [options]\n";
    $usage .= <<"USAGEEND";
  Create new perl script, package, object, or test quickly
Options:
  --type|t=<type>        Type to create
      Available: script, package, object, or test
      Default: script
  --package|p=<package>  Package name
      * required for all types except script
  --outfile|o=<outfile>  Path to output file
      * required for scripts and tests for chmod
      When provided, opens the file for editing.
USAGEEND

    print $OUT $usage;
    exit;
}
