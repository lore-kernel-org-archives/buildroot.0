From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 10:10:02 +0100
Subject: [Buildroot] [git commit] configs/nitrogen6x_defconfig: remove
 duplicate BR2_PACKAGE_HOST_UBOOT_TOOLS=y
Message-ID: <20201223085641.2881582203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=667a68c4a6a51287330f56c235d7f3a28c00da3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit [1] added this option a second time.
Remove the first occurence.

Fixes:
configs/nitrogen6x_defconfig:31:warning: override: reassigning to symbol BR2_PACKAGE_HOST_UBOOT_TOOLS

[1] 6ea9f662a03e0f4b4a9000a25095b8e6293b07b6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nitrogen6x_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 5353b38fd5..13c14e6d2a 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -11,7 +11,6 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
