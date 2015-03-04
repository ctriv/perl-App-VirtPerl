#!perl

use strict;
use warnings;
use Config;
use Data::Dumper;

my @inc = grep {
	!m/^$Config{sitelibexp}/o && !m/^$Config{vendorlibexp}/o
				  && !m/^$Config{updateslib}/o
				  && !m/^$Config{extraslib}/o
	} @INC;


print Dumper({
	'@INC' => \@INC,
	'@inc' => \@inc,
	map { $_ => $Config{$_} } qw/privlibexp sitelibexp vendorlibexp archlibexp/
});


# @Config{qw(privlibexp archlibexp)}