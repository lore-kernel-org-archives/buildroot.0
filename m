From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:31 +0200
Subject: [Buildroot] [PATCH 45/46] defconfigs: remove references to old
	U-Boot versions
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <026cdb2c78323dcbf9afd0049e42f33d2e2fccdd.1275343448.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/at91rm9200df_defconfig       |    2 --
 configs/at91rm9200df_ext_defconfig   |    2 --
 configs/at91sam9260dfc_defconfig     |    2 --
 configs/at91sam9260dfc_ext_defconfig |    2 --
 configs/at91sam9261ek_defconfig      |    2 --
 configs/at91sam9261ek_ext_defconfig  |    2 --
 configs/at91sam9263ek_defconfig      |    2 --
 configs/at91sam9263ek_ext_defconfig  |    2 --
 configs/at91sam9g20dfc_defconfig     |    2 --
 configs/at91sam9g20dfc_ext_defconfig |    2 --
 configs/atngw100-base_defconfig      |    2 --
 configs/atngw100_defconfig           |    5 -----
 configs/atstk1005_defconfig          |    2 --
 configs/atstk100x_defconfig          |    2 --
 configs/integrator926_defconfig      |    2 --
 configs/integrator926_huge_defconfig |    2 --
 16 files changed, 0 insertions(+), 35 deletions(-)

diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 7d2bcfd..be8ddfe 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -883,8 +883,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 79e55fc..083fc68 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -809,8 +809,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 087067f..e0898df 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -897,8 +897,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index e52cd2d..469c3c4 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -817,8 +817,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index cd7483b..97c151d 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -949,8 +949,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 5ab47ad..c12fa67 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -906,8 +906,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index bc95b6b..8a95a4a 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -946,8 +946,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 9771c83..24db6a1 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -868,8 +868,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 30cc4e1..cd4c643 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -813,8 +813,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="at91sam9g20ek"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index e18754e..b3143cd 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -817,8 +817,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index d3092df..a9b017b 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -739,8 +739,6 @@ BR2_TARGET_UBOOT_BOARDNAME="atngw100"
 # BR2_TARGET_UBOOT_2009_03 is not set
 # BR2_TARGET_UBOOT_2009_01 is not set
 BR2_TARGET_UBOOT_2008_10=y
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2008.10"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index d7c9c15..248a8fb 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -740,11 +740,6 @@ BR2_TARGET_UBOOT_BOARDNAME="atngw100"
 # BR2_TARGET_UBOOT_2010_03 is not set
 # BR2_TARGET_UBOOT_2009_11 is not set
 BR2_TARGET_UBOOT_2009_08=y
-# BR2_TARGET_UBOOT_2009_06 is not set
-# BR2_TARGET_UBOOT_2009_03 is not set
-# BR2_TARGET_UBOOT_2009_01 is not set
-# BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.08"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index a1fe0b7..e2d7f4f 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -771,8 +771,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="atngw100"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 0fbbf14..ae77138 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -868,8 +868,6 @@ BR2_TARGET_UBOOT_BOARDNAME="atstk1002"
 # BR2_TARGET_UBOOT_2009_03 is not set
 # BR2_TARGET_UBOOT_2009_01 is not set
 BR2_TARGET_UBOOT_2008_10=y
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2008.10"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 3879272..78c5b08 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -706,8 +706,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="cp926ejs"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 86443db..4d8fa6f 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -682,8 +682,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="cp926ejs"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
-- 
1.7.0.4
