From: David du Colombier <0intro@gmail.com>
Date: Tue, 15 Sep 2015 17:06:55 +0200
Subject: [Buildroot] [PATCH 2/2] configs/ci20: add u-boot version 2013.10
	(2015-09-15)
In-Reply-To: <1442329615-17465-1-git-send-email-0intro@gmail.com>
References: <1442329615-17465-1-git-send-email-0intro@gmail.com>
Message-ID: <1442329615-17465-2-git-send-email-0intro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David du Colombier <0intro@gmail.com>
---
 configs/ci20_defconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index ec814ba..e87181a 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -15,3 +15,15 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="93b4df0786f07643eb61daee8934a3f3a05fd280"
 BR2_LINUX_KERNEL_DEFCONFIG="ci20"
+
+# u-boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y
+BR2_TARGET_UBOOT_BOARDNAME="ci20_mmc"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_u-boot"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="a4f583551d0025eb957ee5c9cb68657a429e4914"
+BR2_TARGET_UBOOT_VERSION="a4f583551d0025eb957ee5c9cb68657a429e4914"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
-- 
1.8.3.1
