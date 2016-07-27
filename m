From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jul 2016 21:26:39 +0200
Subject: [Buildroot] [git commit] configs: nitrogen*: bump u-boot version to
	v2016.03
Message-ID: <20160727192743.3106180789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8e42c636936c3bc67ad9f7bb8dd77d47aaf23a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using the latest commit of our 2016.03 U-Boot branch:
https://github.com/boundarydevices/u-boot-imx6/tree/boundary-v2016.03

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nitrogen6sx_defconfig | 4 ++--
 configs/nitrogen6x_defconfig  | 4 ++--
 configs/nitrogen7_defconfig   | 3 ++-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 883f2e1..d776566 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -22,8 +22,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="nitrogen6sx"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Last version of branch boundary-v2015.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/a4070a8/u-boot-a4070a8.tar.gz"
+# Last version of branch boundary-v2016.03
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/ed95621f.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 532223d..5b2b56a 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -22,8 +22,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Last version of branch boundary-v2015.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/a4070a8/u-boot-a4070a8.tar.gz"
+# Last version of branch boundary-v2016.03
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/ed95621f.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index a144f48..a01f533 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -23,7 +23,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="nitrogen7"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/b2e1315/u-boot-b2e1315.tar.gz"
+# Last version of branch boundary-v2016.03
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/ed95621f.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
