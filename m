From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Jul 2013 23:55:56 +0200
Subject: [Buildroot] [git commit] snowball: fix download URL
Message-ID: <20130707221712.B7A219A2E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cb3d08194942aad04ab9a07d85762a726ad1956
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/calao_snowball_defconfig                   |    4 ++--
 .../snowball-hdmiservice/snowball-hdmiservice.mk   |    2 +-
 package/snowball-init/snowball-init.mk             |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/calao_snowball_defconfig b/configs/calao_snowball_defconfig
index 360ed51..0631b52 100644
--- a/configs/calao_snowball_defconfig
+++ b/configs/calao_snowball_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_GCC_VERSION_4_7_X=y
+BR2_KERNEL_HEADERS_3_4=y
 # BR2_SOFT_FLOAT is not set
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
@@ -17,7 +17,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="snowball"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://igloocommunity.org/git/kernel/igloo-kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="https://github.com/igloocommunity/igloo-kernel"
 BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="stable-linux-ux500-3.4"
 BR2_LINUX_KERNEL_PATCH="board/calao/snowball/"
 BR2_LINUX_KERNEL_DEFCONFIG="u8500"
diff --git a/package/snowball-hdmiservice/snowball-hdmiservice.mk b/package/snowball-hdmiservice/snowball-hdmiservice.mk
index d7bfd5a..bbe673b 100644
--- a/package/snowball-hdmiservice/snowball-hdmiservice.mk
+++ b/package/snowball-hdmiservice/snowball-hdmiservice.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SNOWBALL_HDMISERVICE_VERSION = f75c99d1c52707240a78b4ba78e41d20d3aa3b08
-SNOWBALL_HDMISERVICE_SITE = git://igloocommunity.org/git/bsp/hdmiservice.git
+SNOWBALL_HDMISERVICE_SITE = https://github.com/igloocommunity/hdmiservice
 SNOWBALL_HDMISERVICE_LICENSE = MIT
 SNOWBALL_HDMISERVICE_LICENSE_FILES = debian/copyright
 SNOWBALL_HDMISERVICE_INSTALL_STAGING = YES
diff --git a/package/snowball-init/snowball-init.mk b/package/snowball-init/snowball-init.mk
index 7cc2048..d71f347 100644
--- a/package/snowball-init/snowball-init.mk
+++ b/package/snowball-init/snowball-init.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SNOWBALL_INIT_VERSION = b064be21de25729039e5e54037bbdd2e25cfd5b7
-SNOWBALL_INIT_SITE = git://igloocommunity.org/git/bsp/snowball-init.git
+SNOWBALL_INIT_SITE = https://github.com/igloocommunity/snowball-init
 SNOWBALL_INIT_LICENSE = BSD-4c
 SNOWBALL_INIT_LICENSE_FILES = debian/copyright
 
