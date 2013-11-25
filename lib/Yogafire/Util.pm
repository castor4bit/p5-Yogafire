package Yogafire::Util;
use strict;
use warnings;
use base 'Exporter';
our @EXPORT_OK = qw/progress_dot/;

sub progress_dot {
    my ($header, $sub) = @_;
    $| = 1;

    print $header;

    while ($sub->()) {
        print ".";
        sleep 3;
    }

    print "\n";
}

sub key_eq_value_to_hash {
    my ($keyvalue ) = @_;
    return {} unless $keyvalue;

    my %hash;
    for my $keyvs (@$keyvalue) {
        my ($key, $value) = split /=/, $keyvs;
        $hash{$key} = $value;
    }
    return \%hash;
}


sub get_target_host {
    my ($instance, $private) = @_;
    return '' unless $instance;

    if($private) {
        return $instance->privateDnsName || $instance->privateIpAddress;
    } else {
        return $instance->dnsName || $instance->ipAddress || $instance->privateIpAddress;
    }
}

1;
