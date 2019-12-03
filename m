From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 08:14:24 +0100
Subject: [Buildroot] [git commit] configs/nanopi_neo: update kernel to 5.3
 and u-boot to 2019.10
Message-ID: <20191203070650.BD2E183B2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b376b91a36fbdbca49f96a6cf3c824655beb86c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nanopi_neo_defconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/configs/nanopi_neo_defconfig b/configs/nanopi_neo_defconfig
index 4696b445da..be98918c62 100644
--- a/configs/nanopi_neo_defconfig
+++ b/configs/nanopi_neo_defconfig
@@ -5,13 +5,13 @@ BR2_ARM_FPU_VFPV4=y
 BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
 
-# Linux headers same as kernel, a 4.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
+# Linux headers same as kernel, a 5.3 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
 
 # Use a -rc kernel to get the DTS
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.13"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-neo"
@@ -20,9 +20,10 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-neo"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 
