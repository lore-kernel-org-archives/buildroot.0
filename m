From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 26 Jan 2009 20:28:59 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <877i4i6ni7.fsf@macbook.be.48ers.dk>
References: <20090125214834.783FA76D28@busybox.osuosl.org>
	<877i4i6ni7.fsf@macbook.be.48ers.dk>
Message-ID: <1232998139.2298.102.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-26 klockan 17:27 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-25 21:48:33 +0000 (Sun, 25 Jan 2009)
>  ulf> New Revision: 25024
> 
>  ulf> Log:
> 
>  ulf> Use new SHELL variable BUILDROOT_KERNEL_CONFIG_METHOD
>  ulf> which will override selection between xconfig and menuconfig
> 

It needs to be documented, that is for sure.

> Let's not add any more undocumented command line options for such
> special cases like this.

I agree that is it too specific.

A more generic thing would be to use "BUILDROOT_USE_XWIN"
This might only be used for the config method,
but it is easier to understand.

BR
Ulf Samuelsson
