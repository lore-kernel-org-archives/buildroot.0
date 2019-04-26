From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 15:02:10 +0200
Subject: [Buildroot] [PATCH 2/5] configs/beaglebone: kernel build needs
 mkimage
In-Reply-To: <20190422200830.2831-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 22 Apr 2019 22:08:26 +0200")
References: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
 <20190422200830.2831-3-thomas.petazzoni@bootlin.com>
Message-ID: <87d0l8yl65.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Following ffbe46a5295ce4e0442728f2ad3e19afa7eaa8ed ("linux: simplify
 > LINUX_BUILD_CMDS"), the Linux kernel build for beaglebone_defconfig
 > builds more things, including some .itb files, which require mkimage
 > with FIT support.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/199339433

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
