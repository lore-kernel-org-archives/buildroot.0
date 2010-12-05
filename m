From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:52:38 +0100
Subject: [Buildroot] [PATCH 07/55] Use the new BR2_ROOTFS_SKELETON_CUSTOM
	options
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <98eb815f8ca69c8d2f4f3aa2c9662c168c0b9725.1291582351.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/at91rm9200df_defconfig   |    2 ++
 configs/at91sam9260dfc_defconfig |    2 ++
 configs/at91sam9260pf_defconfig  |    2 ++
 configs/at91sam9261ek_defconfig  |    2 ++
 configs/at91sam9263ek_defconfig  |    2 ++
 configs/at91sam9g20dfc_defconfig |    2 ++
 configs/atngw100_defconfig       |    2 ++
 configs/atstk1005_defconfig      |    2 ++
 configs/atstk100x_defconfig      |    2 ++
 configs/kb9202_defconfig         |    2 ++
 configs/v100sc2_defconfig        |    2 ++
 11 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 01849b0..d2d1500 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -826,6 +826,8 @@ BR2_PACKAGE_LIBXML2=y
 # filesystem for target device
 #
 BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
+BR2_ROOTFS_SKELETON_CUSTOM=y
+BR2_ROOTFS_SKELETON_CUSTOM_PATH="target/device/Atmel/root/target_skeleton"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index ec8d44c..e1eac51 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -840,6 +840,8 @@ BR2_PACKAGE_LIBXML2=y
 # filesystem for target device
 #
 BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
+BR2_ROOTFS_SKELETON_CUSTOM=y
+BR2_ROOTFS_SKELETON_CUSTOM_PATH="target/device/Atmel/root/target_skeleton"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index 7b3f890..db716a0 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -540,6 +540,8 @@ BR2_SCRIPTING_SUPPORT=y
 # filesystem for target device
 #
 BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
+BR2_ROOTFS_SKELETON_CUSTOM=y
+BR2_ROOTFS_SKELETON_CUSTOM_PATH="target/device/Atmel/root/target_skeleton"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 5c2d15b..2c0b8af 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -891,6 +891,8 @@ BR2_PACKAGE_LIBXSLT=y
 # filesystem for target device
 #
 BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
+BR2_ROOTFS_SKELETON_CUSTOM=y
+BR2_ROOTFS_SKELETON_CUSTOM_PATH="target/device/Atmel/root/target_skeleton"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index a2e6181..d75c6fd 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -888,6 +888,8 @@ BR2_PACKAGE_LIBXSLT=y
 # filesystem for target device
 #
 BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
+BR2_ROOTFS_SKELETON_CUSTOM=y
+BR2_ROOTFS_SKELETON_CUSTOM_PATH="target/device/Atmel/root/target_skeleton"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index cb82c2d..f761e72 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -756,6 +756,8 @@ BR2_PACKAGE_EXPAT=y
 # filesystem for target device
 #
 BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/root/device_table.txt"
+BR2_ROOTFS_SKELETON_CUSTOM=y
+BR2_ROOTFS_SKELETON_CUSTOM_PATH="target/device/Atmel/root/target_skeleton"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index d2bdb68..08d111e 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -689,6 +689,8 @@ BR2_PACKAGE_WIRELESS_TOOLS=y
 #
 BR2_ROOTFS_POST_BUILD_SCRIPT=""
 BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/atngw100/device_table.txt"
+BR2_ROOTFS_SKELETON_CUSTOM=y
+BR2_ROOTFS_SKELETON_CUSTOM_PATH="target/device/Atmel/atngw100/target_skeleton"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 4531fd2..d87e103 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -718,6 +718,8 @@ BR2_PACKAGE_ZLIB=y
 # filesystem for target device
 #
 BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/atstk1005/device_table.txt"
+BR2_ROOTFS_SKELETON_CUSTOM=y
+BR2_ROOTFS_SKELETON_CUSTOM_PATH="target/device/Atmel/atstk1005/target_skeleton"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index e120de8..b4e7f06 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -821,6 +821,8 @@ BR2_ROOTFS_PREFIX="atstk1002-rootfs"
 # filesystem for target device
 #
 BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/atstk100x/device_table.txt"
+BR2_ROOTFS_SKELETON_CUSTOM=y
+BR2_ROOTFS_SKELETON_CUSTOM_PATH="target/device/Atmel/atstk100x/target_skeleton"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index fa5fa60..c13c30f 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -643,6 +643,8 @@ BR2_GAMES=y
 # filesystem for target device
 #
 BR2_ROOTFS_DEVICE_TABLE="target/device/KwikByte/kb9202/device_table.txt"
+BR2_ROOTFS_SKELETON_CUSTOM=y
+BR2_ROOTFS_SKELETON_CUSTOM_PATH="target/device/KwikByte/kb9202/target_skeleton"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 03d036f..b32fa21 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -675,6 +675,8 @@ BR2_PACKAGE_LIBXSLT=y
 # filesystem for target device
 #
 BR2_ROOTFS_DEVICE_TABLE="target/device/valka/device_table.txt"
+BR2_ROOTFS_SKELETON_CUSTOM=y
+BR2_ROOTFS_SKELETON_CUSTOM_PATH="target/device/target/device/valka/target_skeleton"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
 # BR2_TARGET_ROOTFS_EXT2 is not set
-- 
1.7.0.4
