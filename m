From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Fri, 9 Jan 2009 16:08:17 +0100
Subject: [Buildroot] [PATCH] u-boot: add config option to disable
	general patches
In-Reply-To: <87y6xkpx5m.fsf@macbook.be.48ers.dk>
References: <200811140854.58814.markus.heidelberg@web.de>
	<200901081917.16406.markus.heidelberg@web.de>
	<87y6xkpx5m.fsf@macbook.be.48ers.dk>
Message-ID: <200901091608.17923.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard, 09.01.2009:
> >>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:
> 
> Hi,
> 
>  Markus> It's the same as with the Linux kernel: you wouldn't like
>  Markus> patches lying around in Buildroot, which you can't disable
>  Markus> and always get applied.
> 
> I've been pondering about adding a bit of flexibility to the packages
> that often need platform specific handling
> (E.G. Linux/U-Boot). Building upstream versions of those rarely make
> sense for custom boards, so having the option to apply custom patches

Which is available, but only in addition to the general patches lying
around.

> or grabbing the entire tree from other version control system seems
> sensible.

Yes, that would be a possible alternative.

> Grant Likely once sent a patch series adding support for using other
> git trees to the kernel build, that I still need to look into.

I just had a look at it. Some sort of checking for newer commits and
then updating the cloned tree would be nice.

Markus
