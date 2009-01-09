From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Jan 2009 16:15:46 +0100
Subject: [Buildroot] [PATCH] u-boot: add config option to disable
	general patches
In-Reply-To: <200901091608.17923.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Fri\, 9 Jan 2009 16\:08\:17 +0100")
References: <200811140854.58814.markus.heidelberg@web.de>
	<200901081917.16406.markus.heidelberg@web.de>
	<87y6xkpx5m.fsf@macbook.be.48ers.dk>
	<200901091608.17923.markus.heidelberg@web.de>
Message-ID: <87hc48o6hp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 >> (E.G. Linux/U-Boot). Building upstream versions of those rarely make
 >> sense for custom boards, so having the option to apply custom patches

 Markus> Which is available, but only in addition to the general patches lying
 Markus> around.

Exactly, it should ofcourse be INSTEAD.

 >> Grant Likely once sent a patch series adding support for using other
 >> git trees to the kernel build, that I still need to look into.

 Markus> I just had a look at it. Some sort of checking for newer commits and
 Markus> then updating the cloned tree would be nice.

Yes, indeed.

-- 
Bye, Peter Korsgaard
