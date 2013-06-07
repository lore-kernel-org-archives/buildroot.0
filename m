From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Jun 2013 10:58:06 +0200
Subject: [Buildroot] [PATCH 4/4] Normalize separator size to 80
In-Reply-To: <51B19FFE.8040703@free-electrons.com> (Alexandre Belloni's
 message of "Fri, 07 Jun 2013 10:55:26 +0200")
References: <1370591655-19855-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <1370591655-19855-4-git-send-email-jerzy.grzegorek@trzebnica.net>
 <51B19FFE.8040703@free-electrons.com>
Message-ID: <87sj0ucn6p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandre" == Alexandre Belloni <alexandre.belloni@free-electrons.com> writes:

 Alexandre> Hi,
 Alexandre> Thanks for pointing out that I forgot everything that wasn't in packages ;)

 Alexandre> You actually forgot some separators in:
 Alexandre> fs/iso9660/iso9660.mk
 Alexandre> toolchain/gcc/gcc-uclibc-4.x.mk
 Alexandre> toolchain/uClibc/uclibc.mk

 Alexandre> Please fix that and resubmit !

I've already applied the patches, please send a followup patch fixing
the remaining issues - Thanks.

-- 
Bye, Peter Korsgaard
