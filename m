From: Mark Jackson <mpfj@mimc.co.uk>
Date: Tue, 07 Oct 2008 10:07:25 +0100
Subject: [Buildroot] [BR-AVR32] [PATCH] Support for new MIMC200 board
In-Reply-To: <20081007104345.59bacec2@hcegtvedt>
References: <48EA05EB.7020807@mimc.co.uk>	<20081007074128.12613e2c@hcegtvedt>	<48EB1EDF.6070209@mimc.co.uk>
	<20081007104345.59bacec2@hcegtvedt>
Message-ID: <48EB26CD.4010003@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hans-Christian Egtvedt wrote:

<snip>

> You must split up your patch, it contains far more than just a new
> board. Each patch should only add/change one feature in Buildroot.
> 
> I would also recommend that you get all the kernel and U-Boot stuff
> upstream first, and then go for the Buildroot stuff.

Ho, hum.  I was kinda hoping to put that off ... too lazy, too many other things to do !!.
But I guess I just need to buckle down and get it sorted.

In fact the u-boot stuff *is* already upstream ... the u-boot patch is a bit of a hang over.  Oops.

the linux stuff was a bit of a sticking point ... Atmel's AVR32 patches are all based on 2.6.25.10.
But I'm guessing that if I submit my new RTC support code won't it only be added to the latest kernels ?

How can I submit my RTC code *and* still use 2.6.25.10 ?

I know I could use Haavard's latest linux (2.6.27.??), but then that's moving further away from
the buildroot "all-in-one" principal !?!

Any ideas ?

>>> Is the patch based on the latest uclibc.org repo or Buildroot for
>>> AVR32 release (v2.2.0)?
>> The latest svn (actually r23594).
> 
> Then it is better if you post it to uclibc.org mailing list, I import
> stuff from uclibc.org, so eventually it will end up in my fork() as
> well.

Okay ... will do.

Thanks for the feedback.
Mark
