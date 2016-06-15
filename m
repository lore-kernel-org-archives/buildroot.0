From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:48:40 +0200
Subject: [Buildroot] [git commit] nxp defconfigs: bump u-boot version to
	4.1.15_1.1.0_ga
Message-ID: <20160615204846.BDE5F81EAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4386ce0bcd80f9a3bf0a8ade60e107ebfdeab323
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andrew Webster <awebster@arcx.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/freescale_imx6dlsabreauto_defconfig | 2 +-
 configs/freescale_imx6dlsabresd_defconfig   | 2 +-
 configs/freescale_imx6qsabreauto_defconfig  | 2 +-
 configs/freescale_imx6qsabresd_defconfig    | 2 +-
 configs/freescale_imx6sololiteevk_defconfig | 2 +-
 configs/freescale_imx6sxsabresd_defconfig   | 2 +-
 configs/freescale_imx6ulevk_defconfig       | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index 699e684..f55d4fa 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -31,4 +31,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_1.1.0_ga"
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index b6d31e0..bec80b5 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -31,4 +31,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_1.1.0_ga"
diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 23ca2dc..2b89541 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -31,4 +31,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_1.1.0_ga"
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index bf446a3..ec8f265 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -31,4 +31,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_1.1.0_ga"
diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
index 72a1e2d..db68d79 100644
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -28,4 +28,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6slevk"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_1.1.0_ga"
diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
index 943528b..7437b63 100644
--- a/configs/freescale_imx6sxsabresd_defconfig
+++ b/configs/freescale_imx6sxsabresd_defconfig
@@ -28,5 +28,5 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_1.1.0_ga"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
diff --git a/configs/freescale_imx6ulevk_defconfig b/configs/freescale_imx6ulevk_defconfig
index fbb420e..cd27335 100644
--- a/configs/freescale_imx6ulevk_defconfig
+++ b/configs/freescale_imx6ulevk_defconfig
@@ -22,7 +22,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ul_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_1.1.0_ga"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # required tools to create the microSD image
