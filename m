From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Jan 2009 15:33:05 +0100
Subject: [Buildroot] [PATCH] u-boot: add config option to disable
	general patches
In-Reply-To: <200901081510.39837.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Thu\, 8 Jan 2009 15\:10\:39 +0100")
References: <200811140854.58814.markus.heidelberg@web.de>
	<87od0ijunz.fsf@macbook.be.48ers.dk>
	<200811151156.02393.markus.heidelberg@web.de>
	<200901081510.39837.markus.heidelberg@web.de>
Message-ID: <878wplsw9q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> The patches in target/u-boot/$(U_BOOT_VERSION)/ can conflict with custom
 Markus> board specific patches, so this option is necessary.

I would rather get rid of any patches that are not strictly needed. We
should only have patches for criticial bugfixes or build issues.

The number of configuration options we have in target/u-boot nowadays
is getty silly.

Ulf, let me know what you think.

-- 
Bye, Peter Korsgaard
