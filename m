From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 May 2012 23:52:18 +0200
Subject: [Buildroot] [PATCH 3/3 v4] configs: add support for PandaBoard
	and PandaBoard ES
In-Reply-To: <1332108292-28094-4-git-send-email-n-dechesne@ti.com> (Nicolas
 Dechesne's message of "Sun, 18 Mar 2012 23:04:52 +0100")
References: <1332108292-28094-1-git-send-email-n-dechesne@ti.com>
 <1332108292-28094-4-git-send-email-n-dechesne@ti.com>
Message-ID: <87k40qb8j1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Dechesne <n-dechesne@ti.com> writes:

 Nicolas> This is a default configuration for Panda and PandaES, tested on both
 Nicolas> platforms.

 Nicolas> DEVTMPFS is enabled, to use static dev configuration one would need
 Nicolas> to update the generic dev table for ttyO driver.

 Nicolas> Panda is well supported in mainline kernel with omap2plus_defconfig,
 Nicolas> so this should be safe.

 Nicolas> U-boot SPL support is enabled by default as x-loader is now
 Nicolas> deprecated.

 Nicolas> With OMAP platforms u-boot,img format is prefered now, so it's enabled
 Nicolas> by default as well. Also, on PandaBoard, the name of SPL target file
 Nicolas> is MLO.

Committed, thanks.

-- 
Bye, Peter Korsgaard
