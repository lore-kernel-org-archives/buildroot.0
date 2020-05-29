From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 May 2020 22:59:44 +0200
Subject: [Buildroot] [PATCH 2/2] configs/raspberrypi{3,
 4}_64: enabling BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT no longer
 needed
In-Reply-To: <20200516140221.1464063-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 16 May 2020 16:02:21 +0200")
References: <20200516140221.1464063-1-thomas.petazzoni@bootlin.com>
 <20200516140221.1464063-2-thomas.petazzoni@bootlin.com>
Message-ID: <87o8q6mp8f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT is now forcefully selected by
 > BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS when the kernel is in
 > charge of building DTBs (BR2_LINUX_KERNEL_DTS_SUPPORT=y). So enabling
 > BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT is no longer needed in the 64-bit
 > defconfigs for Raspberry Pi 3 and 4.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
