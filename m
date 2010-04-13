From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:47 +0200
Subject: [Buildroot] [PATCH 35/35] defconfigs: remove references to old
	U-Boot versions
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e65097f3bd6a1e21b389860e2ad7a9e21812631c.1271170913.git.thomas.petazzoni@free-electrons.com>
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
 configs/atngw100_defconfig           |    2 --
 configs/atstk1005_defconfig          |    2 --
 configs/atstk100x_defconfig          |    2 --
 configs/integrator926_defconfig      |    2 --
 configs/integrator926_huge_defconfig |    2 --
 16 files changed, 0 insertions(+), 32 deletions(-)

diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index fe4f44b..c253372 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -885,8 +885,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index a98bcd3..726a65c 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -811,8 +811,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 900f283..15f4c70 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -899,8 +899,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 637b937..8024478 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -819,8 +819,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 091a72e..a70bf53 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -951,8 +951,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 2b048d3..fe8e6f3 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -908,8 +908,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 7252473..f6006c5 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -948,8 +948,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 8f22d68..ec8ef38 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -870,8 +870,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index d03cfb5..5424957 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -815,8 +815,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="at91sam9g20ek"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 5d6cf3b..00b44d2 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -819,8 +819,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_U_BOOT_ARCH_PATCH=y
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 3a62434..ff9d8eb 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -741,8 +741,6 @@ BR2_TARGET_UBOOT_BOARDNAME="atngw100"
 # BR2_TARGET_UBOOT_2009_03 is not set
 # BR2_TARGET_UBOOT_2009_01 is not set
 BR2_TARGET_UBOOT_2008_10=y
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2008.10"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 7655bc6..6930ec6 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -730,8 +730,6 @@ BR2_TARGET_UBOOT_BOARDNAME="atngw100"
 # BR2_TARGET_UBOOT_2009_03 is not set
 # BR2_TARGET_UBOOT_2009_01 is not set
 BR2_TARGET_UBOOT_2008_10=y
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2008.10"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 92b5911..910deec 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -773,8 +773,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="atngw100"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index e969073..4338ff3 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -870,8 +870,6 @@ BR2_TARGET_UBOOT_BOARDNAME="atstk1002"
 # BR2_TARGET_UBOOT_2009_03 is not set
 # BR2_TARGET_UBOOT_2009_01 is not set
 BR2_TARGET_UBOOT_2008_10=y
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2008.10"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 8897cd1..f908525 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -709,8 +709,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="cp926ejs"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 56e3fce..74c5ee5 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -685,8 +685,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="cp926ejs"
 BR2_TARGET_UBOOT_2009_01=y
 # BR2_TARGET_UBOOT_2008_10 is not set
-# BR2_TARGET_UBOOT_1_3_4 is not set
-# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
 BR2_UBOOT_VERSION="2009.01"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
-- 
1.6.3.3
