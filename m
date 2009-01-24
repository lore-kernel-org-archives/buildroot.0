From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 24 Jan 2009 11:55:01 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <874ozpi078.fsf@macbook.be.48ers.dk>
References: <20090111213956.5713C76736@busybox.osuosl.org>
	<874ozpi078.fsf@macbook.be.48ers.dk>
Message-ID: <1232794501.5311.126.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2009-01-24 klockan 09:21 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-11 21:39:54 +0000 (Sun, 11 Jan 2009)
>  ulf> New Revision: 24770
> 
>  ulf> Log:
>  ulf> Remove premature deprecation of u-boot-1.2.0-atmel
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/target/u-boot/Config.in
> 
> Why? Isn't 2009.01 working for you?

I have not tested on all boards yets,
and there are still problems with 2009.01
I have boards which compiles OK,
but U-Boot does not boot correctly, 

They compile and work if I enter $(UBOOT_DIR) 
and do a manual make using an external toolchain,
but I have not yet had the time to dig in.

I do not know if it ths build script or
the toolchain, but until this has been 
investigated, it is premature
to deprecate u-boot-1.2.0-atmel.



BR
Ulf Samuelsson
