From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 May 2020 22:59:39 +0200
Subject: [Buildroot] [PATCH 1/2] package/rpi-firmware: select
 BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT when needed
In-Reply-To: <20200516140221.1464063-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 16 May 2020 16:02:20 +0200")
References: <20200516140221.1464063-1-thomas.petazzoni@bootlin.com>
Message-ID: <87sgfimp8k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is enabled, and the
 > DTBs are built by Linux (i.e BR2_LINUX_KERNEL_DTS_SUPPORT is enabled),
 > these DTBs should be built with the -@ Device Tree compiler option, so
 > that they can be used together with DTB overlays. So let's select
 > BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT in this situation.

 > Fixes:

 >   https://bugs.busybox.net/show_bug.cgi?id=12831

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
