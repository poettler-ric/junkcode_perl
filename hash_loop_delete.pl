#!/usr/bin/perl

use common::sense;
use Data::Dump qw(ddx);

my %hash = map { $_ => 1 } qw(a b c d e f g);
ddx(\%hash);
while (my ($key, $value) = each %hash) {
	delete $hash{$key};
	ddx($key, \%hash);
}
