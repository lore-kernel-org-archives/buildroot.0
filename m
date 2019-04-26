From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 15:02:15 +0200
Subject: [Buildroot] [PATCH 3/5] configs/qemu_nios2_10m50: kernel build
 needs mkimage
In-Reply-To: <20190422200830.2831-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 22 Apr 2019 22:08:27 +0200")
References: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
 <20190422200830.2831-4-thomas.petazzoni@bootlin.com>
Message-ID: <878svwyl60.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Following ffbe46a5295ce4e0442728f2ad3e19afa7eaa8ed ("linux: simplify
 > LINUX_BUILD_CMDS"), the Linux kernel build for
 > qemu_nios2_10m50_defconfig builds an image format that needs mkimage.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/199339537

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
