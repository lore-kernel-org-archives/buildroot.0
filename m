From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 30 Jan 2009 10:09:19 +0100
Subject: [Buildroot] svn commit: trunk/buildroot:
 target/device/Atmel/arch-avr32/kernel-pa etc...
In-Reply-To: <87zlh9np10.fsf@macbook.be.48ers.dk>
References: <20090130085310.9730F765E9@busybox.osuosl.org>
	<87zlh9np10.fsf@macbook.be.48ers.dk>
Message-ID: <20090130100919.5b8c93ba@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 30 Jan 2009 10:04:11 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 

<snipp>

>  ulf> Added:
>  ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-100-avr32.patch
> 
> What does this do to the headers?
> 

I think this might have some fixes in arch/avr32/include which uClibc
needs.

>  ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-201-avr32-atmel_mpopfb-disable-debug.patch
> 
> That seems completely unrelated to kernel headers.
> 

Yes it is.

>  ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-202-avr32-atmel_mpopfb-add-signal-to-disable-line-caching.patch
> 
> This one as well.
> 

Yes it is.

>  ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-203-avr32-fix-arch-header-byteorder.patch
> 
> OK.
> 

Vital for uClibc to build.

>  ulf>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-204-avr32-ap700x-fix-det_pin-for-nand-flash.patch
> 
> That also seems unrelated.
> 

Yes it is.

-- 
Best regards,
Hans-Christian Egtvedt
