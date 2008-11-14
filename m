From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Nov 2008 14:37:04 +0100
Subject: [Buildroot] [PATCH] u-boot: add config option to disable
	patching
In-Reply-To: <200811140854.58814.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Fri\, 14 Nov 2008 08\:54\:58 +0100")
References: <200811140854.58814.markus.heidelberg@web.de>
Message-ID: <87od0ijunz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> The patches in target/u-boot/ can conflict with custom board specific
 Markus> patches, so this option is necessary.

But there aren't any patches under target/u-boot?

-- 
Bye, Peter Korsgaard
