From: cmchao <cmchao@gmail.com>
Date: Sat, 22 May 2010 22:11:19 +0200
Subject: [Buildroot] [git commit master] fix device_table.txt path in
	arm_toolchain_defconfig
Message-ID: <20100522201357.E16967FDB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=288d76be8a6ee075247d388a494db0d768fc748f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/arm_toolchain_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 460fe95..e4c181e 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -712,7 +712,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 # filesystem for target device
 #
-BR2_ROOTFS_DEVICE_TABLE="target/device/generic/device_table.txt"
+BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
-- 
1.6.3.3
