#
# (c) adjust GmbH
#
# vim: set ts=2 sw=2 tw=0:
# vim: set expandtab:

package Rex::Interface::Shell::Idrac4;

# ABSTRACT: Rex module to support iDRAC 4.00.00.00

use strict;
use warnings;

our $VERSION = '9999';

use Rex::Interface::Shell::Default;
use base qw(Rex::Interface::Shell::Default);

sub new {
    my $class = shift;
    my $proto = ref($class) || $class;
    my $self  = $proto->SUPER::new(@_);

    bless $self, $class;

    return $self;
}

sub detect {
    my ( $self, $con ) = @_;

    my ($output);
    eval {
        ($output) = $con->direct_exec('racadm getversion');
        1;
    } or do {
        return 0;
    };
    if ( $output && $output =~ m/iDRAC Version/ ) {
        return 1;
    }

    return 0;
}

sub exec {
    my ( $self, $cmd, $option ) = @_;
    return $cmd;
}

1;
