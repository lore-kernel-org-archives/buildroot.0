From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Jun 2017 10:50:00 +0200
Subject: [Buildroot] [PATCH] pandaboard_defconfig: bump u-boot to
	2017.05 to fix build with gcc 6
In-Reply-To: <20170616212404.18424-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 16 Jun 2017 23:24:04 +0200")
References: <20170616212404.18424-1-peter@korsgaard.com>
Message-ID: <87fuezgfrb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The recent change to default to gcc 6 for the internal toolchain broke this
 > defconfig as the u-boot doesn't contain commit 9b2c282b34 (compiler*.h: sync
 > include/linux/compiler*.h with Linux 4.5-rc6) which was added during the
 > 2016.03 cycle.

 > Fix the build by bumping u-boot to 2017.05.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
