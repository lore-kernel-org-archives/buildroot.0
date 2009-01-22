From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 22 Jan 2009 19:37:38 +0100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/target/u-boot/2009.01-rc3
In-Reply-To: <87zlhjogcu.fsf@macbook.be.48ers.dk>
References: <20090122073913.5C9CE765E9@busybox.osuosl.org>
	<87zlhjogcu.fsf@macbook.be.48ers.dk>
Message-ID: <1232649458.5311.6.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-01-22 klockan 10:11 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-22 07:39:12 +0000 (Thu, 22 Jan 2009)
>  ulf> New Revision: 24950
> 
>  ulf> Log:
>  ulf> Fix AVR32 u.boot build bug
> 
>  ulf> Added:
>  ulf>    trunk/buildroot/target/u-boot/2009.01-rc3/u-boot-2009.01-rc3-include_asm-avr32_io.h.patch.avr32
> 
> I don't see this either in U-Boot git or as a patch to the mailing
> list.
> 

It is in the u-boot-avr32 git.
I pointed it out to Haavard, so he has asked Wolfgang
to pull this patch, but it is too late for 2009.01


> 2009.01 is furthermore released, so -rcX should imho go.
> 

I am testing this very thing right now, so
2009.01-rc3 will go, and 2009.01
will be enabled, and the patch will be moved 
to the correct directory.

BR
Ulf Samuelsson
