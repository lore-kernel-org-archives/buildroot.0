From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 29 Jan 2009 10:59:48 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
 atstk100x
In-Reply-To: <87iqnytp51.fsf@macbook.be.48ers.dk>
References: <20090129093327.BD8B17741D@busybox.osuosl.org>
	<87skn2tptl.fsf@macbook.be.48ers.dk>
	<20090129104341.2d34aa8e@hcegtvedt>
	<87iqnytp51.fsf@macbook.be.48ers.dk>
Message-ID: <20090129105948.4b229be3@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Jan 2009 10:52:58 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Hans-Christian" == Hans-Christian Egtvedt
> >>>>> <hans-christian.egtvedt@atmel.com> writes:
> 
>  >> Too configs for practically the same kernel version? That doesn't
>  >> sound right.
>  >> 
> 
>  Hans-Christian> You can do "make atstk1005_defconfig" and similar for
>  Hans-Christian> most of the AVR32 boards. The defconfig in the kernel
>  Hans-Christian> is quite sane.
> 
> So in other words these files should go away?
> 

A kernel config is only needed for the ngw100-base board, if that is
present in the upstream BR. I use the advanced Linux make stuff to grab
the kernel config from the already included defconfigs.

-- 
Best regards,
Hans-Christian Egtvedt
