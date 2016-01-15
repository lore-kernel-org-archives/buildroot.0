From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jan 2016 19:01:47 +0100
Subject: [Buildroot] [PATCH] uboot-tools: fix for linux 4.4
In-Reply-To: <1452856397-21566-1-git-send-email-Gerhard@Heift.Name> (Gerhard
 Heift's message of "Fri, 15 Jan 2016 12:13:17 +0100")
References: <1452856397-21566-1-git-send-email-Gerhard@Heift.Name>
Message-ID: <87pox2yb5g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gerhard" == Gerhard Heift <gerhard@heift.name> writes:

 > Since linux 4.4 <mtd/mtd-user.h> does not include <stdint.h> any more, so it
 > had to be included explicitly.

 > See commit 137d36af4a53858b8db7ca83c8480247118b8bdf of the linux kernel.

 > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=137d36af4a53858b8db7ca83c8480247118b8bdf

Has this been fixed upstream? U-Boot 2016.01 is out, so if it is fixed
upstream then I would prefer to change the version instead.

If it isn't upstream, please send the fix to the u-boot list first.

Thanks!

-- 
Bye, Peter Korsgaard
