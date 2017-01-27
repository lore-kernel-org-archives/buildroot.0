From: Dagg Stompler <daggs@gmx.com>
Date: Fri, 27 Jan 2017 11:01:10 +0200
Subject: [Buildroot] [PATCH] odroidc2: bump uboot version to
	eb5d2d16fd45f52ec49e9b4ff9d562630c08e61c
Message-ID: <20170127090110.6937-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this version bump allows usage of hardkernel's secure signatures when
booting a system

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 configs/odroidc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 95a916944..ecee2ad1e 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -28,7 +28,7 @@ BR2_LINUX_KERNEL_IMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/hardkernel/u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1ec799cec97574a9838bc25b286484e579a41652"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="eb5d2d16fd45f52ec49e9b4ff9d562630c08e61c"
 BR2_TARGET_UBOOT_BOARDNAME="odroidc2"
 
 # Required tools to create the SD image
-- 
2.11.0
