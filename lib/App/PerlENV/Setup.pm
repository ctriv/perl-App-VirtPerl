package App::PerlENV::Setup;

use strict;
use Config;
use lib ();

sub import {
	my $current = "$ENV{PERLENV_ROOT}/current/lib/perl5";
	
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