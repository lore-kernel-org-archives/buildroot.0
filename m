From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 23:37:42 +0200
Subject: [Buildroot] [git commit] configs/nitrogen*: bump u-boot revision
Message-ID: <20200423212311.71BD48FE00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d401d7cbd0cc1a648d8ffbd203f35e4718fb50ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Latest bump introduced a regression for Nitrogen8MM, now fixed.

Changelog:
- Fix Nitrogen8MM SPL regression
- Add multi-rank lpddr4 training support
- Improve fastboot support
- Add Android AVB / BCB support

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/517918160

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/nitrogen6sx_defconfig | 2 +-
 configs/nitrogen6x_defconfig  | 2 +-
 configs/nitrogen7_defconfig   | 2 +-
 configs/nitrogen8m_defconfig  | 2 +-
 configs/nitrogen8mm_defconfig | 2 +-
 configs/nitrogen8mn_defconfig | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index c9fe0f46b1..dc65ccf9f6 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -25,7 +25,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Last version of branch boundary-v2018.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/bd4e3154.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e5abcffa.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6sx"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_BOOT_SCRIPT=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 00b28d2ab1..6ecac6e8b0 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -25,7 +25,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Last version of branch boundary-v2018.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/bd4e3154.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e5abcffa.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_BOOT_SCRIPT=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index d9a216d491..c1d4f5a9a0 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -24,7 +24,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Last version of branch boundary-v2018.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/bd4e3154.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e5abcffa.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen7"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_BOOT_SCRIPT=y
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 26b9d768e3..e0b1850f02 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -39,7 +39,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8m"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Latest revision of branch boundary-imx_v2018.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/bd4e3154.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e5abcffa.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index 96ab0d044e..082f9e355a 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -39,7 +39,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8mm_2g"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Latest revision of branch boundary-imx_v2018.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/bd4e3154.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e5abcffa.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index b78eba1422..e7a0151e8c 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -39,7 +39,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8_nano_8mn1gr0"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Latest revision of branch boundary-imx_v2018.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/bd4e3154.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e5abcffa.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
