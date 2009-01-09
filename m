From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Jan 2009 11:54:29 +0100
Subject: [Buildroot] [PATCH] u-boot: add config option to disable
	general patches
In-Reply-To: <200901081917.16406.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Thu\, 8 Jan 2009 19\:17\:16 +0100")
References: <200811140854.58814.markus.heidelberg@web.de>
	<200901081510.39837.markus.heidelberg@web.de>
	<878wplsw9q.fsf@macbook.be.48ers.dk>
	<200901081917.16406.markus.heidelberg@web.de>
Message-ID: <87y6xkpx5m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

Hi,

 Markus> It's the same as with the Linux kernel: you wouldn't like
 Markus> patches lying around in Buildroot, which you can't disable
 Markus> and always get applied.

I've been pondering about adding a bit of flexibility to the packages
that often need platform specific handling
(E.G. Linux/U-Boot). Building upstream versions of those rarely make
sense for custom boards, so having the option to apply custom patches
or grabbing the entire tree from other version control system seems
sensible.

Grant Likely once sent a patch series adding support for using other
git trees to the kernel build, that I still need to look into.

 >> The number of configuration options we have in target/u-boot nowadays
 >> is getty silly.

 Markus> That's right, but this option is not one to be passed to
 Markus> U-Boot like all this board specific stuff currently in
 Markus> Config.in.

True.

-- 
Bye, Peter Korsgaard
