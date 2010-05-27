#!/usr/bin/perl

use common::sense;
use Data::Dump qw(ddx);

my %todo = map {$_ => 1} qw(a b c d e f g h i j);
my %doing = map {$_ => 1} qw(a b);

sub shiftNext {
	return (grep {!$doing{$_}} keys %todo)[0];
}

while (my $item = shiftNext()) {
	$doing{$item} = 1;
	delete $todo{$item};
	ddx($item, \%todo, \%doing);
}
