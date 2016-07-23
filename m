From: Dagg Stompler <daggs@gmx.com>
Date: Sat, 23 Jul 2016 21:54:59 +0300
Subject: [Buildroot] [PATCH 1/3] odroidc2: bump uboot to rev
	1ec799cec97574a9838bc25b286484e579a41652
Message-ID: <20160723185501.12148-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 configs/odroidc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 1945983..30fa2d5 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -26,7 +26,7 @@ BR2_LINUX_KERNEL_IMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/hardkernel/u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="f416a769454b89c39d5b217d28bd3c9f5d1594df"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1ec799cec97574a9838bc25b286484e579a41652"
 BR2_TARGET_UBOOT_BOARDNAME="odroidc2"
 
 # Required tools to create the SD image
-- 
2.9.2
