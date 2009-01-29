From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 29 Jan 2009 10:43:41 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
 atstk100x
In-Reply-To: <87skn2tptl.fsf@macbook.be.48ers.dk>
References: <20090129093327.BD8B17741D@busybox.osuosl.org>
	<87skn2tptl.fsf@macbook.be.48ers.dk>
Message-ID: <20090129104341.2d34aa8e@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Jan 2009 10:38:14 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

<snipp>

>  ulf>    trunk/buildroot/target/device/Atmel/atstk100x/atstk100x-linux-2.6.27.12.config
>  ulf>    trunk/buildroot/target/device/Atmel/atstk100x/atstk100x-linux-2.6.27.3.config
> 
> Too configs for practically the same kernel version? That doesn't
> sound right.
> 

You can do "make atstk1005_defconfig" and similar for most of the AVR32
boards. The defconfig in the kernel is quite sane.

-- 
Best regards,
Hans-Christian Egtvedt
