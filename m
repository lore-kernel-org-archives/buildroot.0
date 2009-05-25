From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 25 May 2009 13:37:23 +0200
Subject: [Buildroot] [git commit] xserver: mark as broken on avr32
In-Reply-To: <87skitefc5.fsf@macbook.be.48ers.dk>
References: <20090519183052.C8CC77787B@busybox.osuosl.org>
	<20090525100303.6e1597aa@hcegtvedt.norway.atmel.com>
	<87ws85egn9.fsf@macbook.be.48ers.dk>
	<20090525104434.4f6245f4@hcegtvedt.norway.atmel.com>
	<87skitefc5.fsf@macbook.be.48ers.dk>
Message-ID: <20090525133723.7ac19817@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 May 2009 10:50:34 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Hans-Christian" == Hans-Christian Egtvedt
> >>>>> <hans-christian.egtvedt@atmel.com> writes:
> 
> Hi,
> 
>  Hans-Christian> Ah, so xserver needs some AVR32 stuff in the
>  Hans-Christian> compiler.h file, thanks.
> 
> Indeed. Is that something you can look into this week? I would like to
> get 2009.05 out while we're still in .05, and it would be good to have
> X support for avr32.
> 

This is from the hip, but could somebody try the attached patch? I
think adding AVR32 support to xserver again should be quite strait
forward.

-- 
Best regards,
Hans-Christian Egtvedt
-------------- next part --------------
A non-text attachment was scrubbed...
Name: xorg-server-1.5.2-avr32-add-inx-outx.patch
Type: text/x-patch
Size: 2759 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090525/2e8d112a/attachment.bin>
