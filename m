From: David Lechner <david@lechnology.com>
Date: Tue, 23 May 2017 13:04:06 -0500
Subject: [Buildroot] [PATCH 3/3] lego: ev3: Use ext4 file system
In-Reply-To: <1495562646-4410-1-git-send-email-david@lechnology.com>
References: <1495562646-4410-1-git-send-email-david@lechnology.com>
Message-ID: <1495562646-4410-4-git-send-email-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change from using ext3 to ext4.

Signed-off-by: David Lechner <david@lechnology.com>
---
 configs/lego_ev3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 0c1ab01..dea84d9 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -27,7 +27,7 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/lego/ev3/busybox.fragment"
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_3=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_SQUASHFS=y
 BR2_TARGET_ROOTFS_SQUASHFS4_XZ=y
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.7.4
