From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 22:22:28 +0100
Subject: [Buildroot] [PATCH] configs/freescale_p1025twr_defconfig: new
 board
In-Reply-To: <1520562998-51817-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Thu, 8 Mar 2018 20:36:38 -0600")
References: <1520562998-51817-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <874llm71ez.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Replacing the p1010rdb, this board is based on the tower development
 > system still available by NXP. The board is setup to track upstream
 > Linux and has been bumped from 4.1 to 4.15 (compared to p1010).

 > The target does not build uboot and assumes the user still uses the NXP
 > suggested prebuilts in the SDK2.0 (last release for PowerPC). If a
 > uboot is required, the source for SDK2.0 can be found in the following
 > repo.
 > http://git.freescale.com/git/cgit.cgi/ppc/sdk/u-boot.git/tag/?id=fsl-sdk-v2.0-1703

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
