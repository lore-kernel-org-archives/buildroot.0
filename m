From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 13 Aug 2017 19:10:39 +0200
Subject: [Buildroot] [PATCH] ci20: update kernel and u-boot
Message-ID: <20170813171039.GA7676@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unbreak failing defconfig.
Resulting kernel and rootfs booted on ci20 device.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 configs/ci20_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index ecf3007..75687ae 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fbf929bc733b82b15f6996d4262a45870f19d214"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7dff33297116643485ca37141d804eddd793e834"
 BR2_LINUX_KERNEL_DEFCONFIG="ci20"
 
 # u-boot
@@ -22,8 +22,8 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y
 BR2_TARGET_UBOOT_BOARDNAME="ci20_mmc"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_u-boot"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="a4f583551d0025eb957ee5c9cb68657a429e4914"
-BR2_TARGET_UBOOT_VERSION="a4f583551d0025eb957ee5c9cb68657a429e4914"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa"
+BR2_TARGET_UBOOT_VERSION="dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
-- 
2.1.4
