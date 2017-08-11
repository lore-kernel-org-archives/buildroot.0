From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Aug 2017 15:29:58 +0200
Subject: [Buildroot] [git commit] nanopi_m1{,
	_plus}_defconfig: U-Boot needs pylibfdt
Message-ID: <20170811132343.4A7AB7F885@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a579514314265dbc7c1fbf4ecb50e2abd9eb0b12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nanopi_m1 and nanopi_m1_plus are sunxi boards that need pylibfdt in
U-Boot.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873655
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873656

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Chakra Divi <2chakrass@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/nanopi_m1_defconfig      | 1 +
 configs/nanopi_m1_plus_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/nanopi_m1_defconfig b/configs/nanopi_m1_defconfig
index 23a5e60..323015e 100644
--- a/configs/nanopi_m1_defconfig
+++ b/configs/nanopi_m1_defconfig
@@ -17,6 +17,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 
diff --git a/configs/nanopi_m1_plus_defconfig b/configs/nanopi_m1_plus_defconfig
index a1ae00e..da707fd 100644
--- a/configs/nanopi_m1_plus_defconfig
+++ b/configs/nanopi_m1_plus_defconfig
@@ -17,6 +17,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 
