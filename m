From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:52:34 +0100
Subject: [Buildroot] [PATCH 03/55] Update defconfigs after Atmel mirror
	related options removal
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8e993e75b828cbab097c727000fbe5a690b4b976.1291582350.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_toolchain_defconfig      |    2 --
 configs/at91rm9200df_defconfig       |    2 --
 configs/at91sam9260dfc_defconfig     |    2 --
 configs/at91sam9260pf_defconfig      |    2 --
 configs/at91sam9261ek_defconfig      |    2 --
 configs/at91sam9263ek_defconfig      |    2 --
 configs/at91sam9g20dfc_defconfig     |    2 --
 configs/atngw100-base_defconfig      |    2 --
 configs/atngw100_defconfig           |    2 --
 configs/atstk1005_defconfig          |    2 --
 configs/atstk100x_defconfig          |    2 --
 configs/i386_defconfig               |    2 --
 configs/i686_defconfig               |    2 --
 configs/integrator926_defconfig      |    2 --
 configs/integrator926_huge_defconfig |    2 --
 configs/kb9202_defconfig             |    2 --
 configs/v100sc2_defconfig            |    2 --
 17 files changed, 0 insertions(+), 34 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index d4642d9..a25ece5 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -151,8 +151,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index de061ac..01849b0 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -156,8 +156,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 1740e13..ec8d44c 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -169,8 +169,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index a2a7fef..7b3f890 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -67,8 +67,6 @@ BR2_SOURCEFORGE_MIRROR="easynews"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX="wchar"
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index f4c0755..5c2d15b 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -172,8 +172,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index cfa8742..a2e6181 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -170,8 +170,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index dc9b600..cb82c2d 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -170,8 +170,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 2b79015..72bd2cc 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -104,8 +104,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index ec87a09..d2bdb68 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -88,8 +88,6 @@ BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
 BR2_DEBIAN_MIRROR="http://ftp.debian.org"
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_ENABLE_DEBUG is not set
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 6212e2b..4531fd2 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -102,8 +102,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index ce50944..e120de8 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -103,8 +103,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 80100d6..6bd7934 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -105,8 +105,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 4a128e8..167eee2 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -105,8 +105,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index fc2dccf..992e1f4 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -101,8 +101,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index c56b628..238dc26 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -101,8 +101,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 727b3c2..fa5fa60 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -110,8 +110,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index a7d0f34..03d036f 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -81,8 +81,6 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
-BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
-- 
1.7.0.4
