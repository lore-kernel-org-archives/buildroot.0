From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 10:21:07 +0100
Subject: [Buildroot] svn commit: trunk/buildroot:
	target/device/Atmel/arch-avr32/kernel-pa etc...
In-Reply-To: <20090130100919.5b8c93ba@hcegtvedt> (Hans-Christian Egtvedt's
	message of "Fri\, 30 Jan 2009 10\:09\:19 +0100")
References: <20090130085310.9730F765E9@busybox.osuosl.org>
	<87zlh9np10.fsf@macbook.be.48ers.dk>
	<20090130100919.5b8c93ba@hcegtvedt>
Message-ID: <87r62lno8s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

Hi,

 ulf> trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-100-avr32.patch
 >> 
 >> What does this do to the headers?

 Hans-Christian> I think this might have some fixes in
 Hans-Christian> arch/avr32/include which uClibc needs.

Ok, but those should get seperated out of this monster patch
(at32ap700 stuff).

 ulf> trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-201-avr32-atmel_mpopfb-disable-debug.patch
 >> 
 >> That seems completely unrelated to kernel headers.

 Hans-Christian> Yes it is.

 ulf> trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-202-avr32-atmel_mpopfb-add-signal-to-disable-line-caching.patch
 >> 
 >> This one as well.

 Hans-Christian> Yes it is.

 ulf> trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-203-avr32-fix-arch-header-byteorder.patch
 >> OK.

 Hans-Christian> Vital for uClibc to build.

 ulf> trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-204-avr32-ap700x-fix-det_pin-for-nand-flash.patch

 >> That also seems unrelated.

 Hans-Christian> Yes it is.

Ok - Ulf, please clean it up.

-- 
Bye, Peter Korsgaard
