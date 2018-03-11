From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 22:22:44 +0100
Subject: [Buildroot] [PATCH] configs/freescale_t1040d4rdb_defconfig: new
 board
In-Reply-To: <1520565006-48698-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Thu, 8 Mar 2018 21:10:06 -0600")
References: <1520565006-48698-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87zi3e5mu3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > The T1 QoriQ from NXP has had a few varients of RDB dev boards.
 > This target is against the latest D4RDB version.  Any of the
 > other versions before D4RDB (plain RDB), may require backing off
 > the uboot version to SDK 1.6 and/or adjusting the kernel dtb used.

 > This board configuration provides an upstream kernel build which
 > has been verified to boot on target.

 > The target assumes the user still uses the NXP suggested prebuilts
 > in the SDK2.0 (last release for PowerPC). If a uboot rebuild is
 > required, the source for SDK2.0 can be found in the following repo.

 > http://git.freescale.com/git/cgit.cgi/ppc/sdk/u-boot.git/tag/?id=fsl-sdk-v2.0-1703

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
