From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  4 Mar 2018 22:31:27 +0100
Subject: [Buildroot] [PATCH 13/23] configs/solidrun_macchiatobin_mainline:
 needs host-openssl for the Linux kernel build
In-Reply-To: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
References: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180304213137.24681-14-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306948

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/solidrun_macchiatobin_mainline_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/solidrun_macchiatobin_mainline_defconfig b/configs/solidrun_macchiatobin_mainline_defconfig
index 526c021fe7..dd797d709c 100644
--- a/configs/solidrun_macchiatobin_mainline_defconfig
+++ b/configs/solidrun_macchiatobin_mainline_defconfig
@@ -31,6 +31,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/macchiatobin/linux-extras.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # rootfs
 BR2_TARGET_ROOTFS_TAR=y
-- 
2.14.3
