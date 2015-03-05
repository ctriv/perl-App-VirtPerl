package App::VirtPerl::Setup;

use strict;
use Config;
use lib ();

sub import {
	return unless $ENV{PERL_VIRTPERL_ROOT} && $ENV{PERL_VIRTPERL_CURRENT_ENV};
	
	my $current = "$ENV{PERL_VIRTPERL_ROOT}/$ENV{PERL_VIRTPERL_CURRENT_ENV}/lib/perl5";
	
	if (-e $current) {
		@INC = grep {
				   !m/^$Config{sitelibexp}/o
				&& !m/^$Config{vendorlibexp}/o
				&& !m/^$Config{updateslib}/o
				&& !m/^$Config{extraslib}/o
			} @INC;
	
		lib->import($current);
	}
}

1;
__END__