From: Anders Darander <anders.darander@gmail.com>
Date: Thu,  9 May 2013 22:31:30 +0200
Subject: [Buildroot] [PATCH 4/5] beaglebone: add am33x-cm3
In-Reply-To: <1368131491-14115-1-git-send-email-anders.darander@gmail.com>
References: <1368131491-14115-1-git-send-email-anders.darander@gmail.com>
Message-ID: <1368131491-14115-5-git-send-email-anders.darander@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Anders Darander <anders@chargestorm.se>

Add the FW needed for the Cortex M3 on the beaglebone. This is required for
a working power management.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 configs/beaglebone_defconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index f80dd79..a6df39b 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -7,6 +7,7 @@ BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+BR2_PACKAGE_AM33X_CM3=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
-- 
1.7.10.4
