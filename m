From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 18:31:10 +0100
Subject: [Buildroot] [git commit] configs/freescale_p1025twr: needs
 host-openssl for the Linux kernel build
Message-ID: <20180324173233.BD458839E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f3bb11f33de2d508900da6bffa99b50a5cf9de1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/59015355

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/freescale_p1025twr_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_p1025twr_defconfig b/configs/freescale_p1025twr_defconfig
index f7cc50f093..13ec517fbd 100644
--- a/configs/freescale_p1025twr_defconfig
+++ b/configs/freescale_p1025twr_defconfig
@@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx_smp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="fsl/p1025twr"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_CPIO=y
