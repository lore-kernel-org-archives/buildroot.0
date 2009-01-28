From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 08:51:18 +0100
Subject: [Buildroot] svn commit: trunk/buildroot:  toolchain/elf2flt
In-Reply-To: <20090128074825.3ae94d3b@hcegtvedt> (Hans-Christian Egtvedt's
	message of "Wed\, 28 Jan 2009 07\:48\:25 +0100")
References: <20090128063240.3211E769CC@busybox.osuosl.org>
	<20090128074825.3ae94d3b@hcegtvedt>
Message-ID: <87k58fx409.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

 Hans-Christian> <snipp>

 >> --- trunk/buildroot/Config.in	2009-01-28 06:32:33 UTC (rev
 >> 25085) +++ trunk/buildroot/Config.in	2009-01-28 06:32:39 UTC
 >> (rev 25086) @@ -243,14 +243,14 @@
 >> 
 >> config BR2_STRIP_strip
 >> bool "strip"
 >> -	depends on !BR2_ENABLE_DEBUG
 >> +	depends on !BR2_ENABLE_DEBUG &&  !BR2_ELF2FLT

 Hans-Christian>                       extra whitespace ^^

True, I just git-am'ed the patch and didn't notice - Will fix.

-- 
Bye, Peter Korsgaard
