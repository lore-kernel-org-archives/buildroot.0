From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Dec 2008 10:55:52 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils:
	ext_source/Atmel/avr32
In-Reply-To: <20081220223102.7E1D376CEB@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sat\, 20 Dec 2008 22\:31\:02 +0000 \(UTC\)")
References: <20081220223102.7E1D376CEB@busybox.osuosl.org>
Message-ID: <87y6y76wrb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

Hi,

 ulf> Author: ulf
 ulf> Date: 2008-12-20 22:31:02 +0000 (Sat, 20 Dec 2008)
 ulf> New Revision: 24474

 ulf> Log:
 ulf> Add updated binutils-2.18 prepatched toolchain for AVR32

 ulf> Changeset:
 ulf> Modified: trunk/buildroot/toolchain/binutils/Config.in
 ulf> ===================================================================
 ulf> --- trunk/buildroot/toolchain/binutils/Config.in	2008-12-20 22:27:56 UTC (rev 24473)
 ulf> +++ trunk/buildroot/toolchain/binutils/Config.in	2008-12-20 22:31:02 UTC (rev 24474)
 ulf> @@ -10,7 +10,7 @@
 
 ulf>  	config BR2_BINUTILS_VERSION_2_17
 ulf>  		depends on BR2_avr32 || !BR2_nios2
 ulf> -		depends on BR2_DEPRECATED
 ulf> +		depends on BR2_DEPRECATED && !BR2_avr32

depends on BR2_avr32  + depends on !BR2_avr32?

-- 
Bye, Peter Korsgaard
