From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 10:04:11 +0100
Subject: [Buildroot] svn commit: trunk/buildroot:
	target/device/Atmel/arch-avr32/kernel-pa etc...
In-Reply-To: <20090130085310.9730F765E9@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Fri\, 30 Jan 2009 08\:53\:10 +0000 \(UTC\)")
References: <20090130085310.9730F765E9@busybox.osuosl.org>
Message-ID: <87zlh9np10.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-30 08:53:08 +0000 (Fri, 30 Jan 2009)
 ulf> New Revision: 25157

 ulf> Log:
 ulf> Move AVR32 patch to kernel header to unbreak several applications

What does these do and what applications are unbroken by them? Could
you please write more detailed commit messages?

 ulf> Added:
 ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-100-avr32.patch

What does this do to the headers?

 ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-201-avr32-atmel_mpopfb-disable-debug.patch

That seems completely unrelated to kernel headers.

 ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-202-avr32-atmel_mpopfb-add-signal-to-disable-line-caching.patch

This one as well.

 ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-203-avr32-fix-arch-header-byteorder.patch

OK.

 ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-204-avr32-ap700x-fix-det_pin-for-nand-flash.patch

That also seems unrelated.

-- 
Bye, Peter Korsgaard
