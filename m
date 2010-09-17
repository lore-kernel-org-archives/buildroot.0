From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Fri, 17 Sep 2010 14:09:48 +0200
Subject: [Buildroot] [git commit master 1/1] Update defconfigs with new VCS
	config options
Message-ID: <20100917121159.A3A428B3CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9eddd31df3ae821e8ff39e31e2ee1b39ca3891c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_toolchain_defconfig           |    5 ++---
 configs/at91rm9200df_defconfig            |    5 ++---
 configs/at91rm9200df_ext_bare_defconfig   |    5 ++---
 configs/at91rm9200df_ext_defconfig        |    5 ++---
 configs/at91sam9260dfc_defconfig          |    5 ++---
 configs/at91sam9260dfc_ext_bare_defconfig |    5 ++---
 configs/at91sam9260dfc_ext_defconfig      |    5 ++---
 configs/at91sam9261ek_defconfig           |    5 ++---
 configs/at91sam9261ek_ext_bare_defconfig  |    5 ++---
 configs/at91sam9261ek_ext_defconfig       |    5 ++---
 configs/at91sam9263ek_defconfig           |    5 ++---
 configs/at91sam9263ek_ext_bare_defconfig  |    5 ++---
 configs/at91sam9263ek_ext_defconfig       |    5 ++---
 configs/at91sam9g20dfc_defconfig          |    5 ++---
 configs/at91sam9g20dfc_ext_bare_defconfig |    5 ++---
 configs/at91sam9g20dfc_ext_defconfig      |    5 ++---
 configs/atngw100-base_defconfig           |    5 ++---
 configs/atngw100_defconfig                |    5 ++---
 configs/atstk1005_defconfig               |    5 ++---
 configs/atstk100x_defconfig               |    5 ++---
 configs/i386_defconfig                    |    5 ++---
 configs/i686_defconfig                    |    5 ++---
 configs/integrator926_defconfig           |    5 ++---
 configs/integrator926_huge_defconfig      |    5 ++---
 configs/kb9202_defconfig                  |    5 ++---
 configs/v100sc2_defconfig                 |    5 ++---
 26 files changed, 52 insertions(+), 78 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index bd6f3e2..632906b 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -131,9 +131,8 @@ BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
 # Build options
 #
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 727a6ea..b7e1260 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -136,9 +136,8 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 # Build options
 #
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index fec2c04..20eb6a7 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -131,9 +131,8 @@ BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
 # Build options
 #
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index c73e372..7383a53 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -142,9 +142,8 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 # Build options
 #
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index de002c4..715f070 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -149,9 +149,8 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 # Build options
 #
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index 540eef6..f3c17ed 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -131,9 +131,8 @@ BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
 # Build options
 #
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 91cdedd..6dc741a 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -150,9 +150,8 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 # Build options
 #
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 0a1fc51..64b50c8 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -152,9 +152,8 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 # Build options
 #
 BR2_WGET="wget --passive-ftp"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index ab8851f..b83e0a7 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -134,9 +134,8 @@ BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
 # Build options
 #
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 6ebe9fd..de01e49 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -153,9 +153,8 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 # Build options
 #
 BR2_WGET="wget --passive-ftp"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index d293108..41795d0 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -150,9 +150,8 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 # Build options
 #
 BR2_WGET="wget --passive-ftp"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 2578b95..40f0fe5 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -133,9 +133,8 @@ BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
 # Build options
 #
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 843b0fb..f537e9f 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -152,9 +152,8 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 # Build options
 #
 BR2_WGET="wget --passive-ftp"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index a9347a8..0bae9ba 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -150,9 +150,8 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 # Build options
 #
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 49a5124..ab0b725 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -131,9 +131,8 @@ BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
 # Build options
 #
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index bd96723..aeb8973 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -150,9 +150,8 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 # Build options
 #
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 116f671..0c85ea8 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -84,9 +84,8 @@ BR2_TARGET_AVR32_ATNGW100_BASE=y
 # Build options
 #
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 50c376b..d1c43ba 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -69,11 +69,10 @@ BR2_TARGET_AVR32_ATNGW100=y
 # Commands
 #
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
+BR2_SVN="svn"
 BR2_BZR_CO="bzr co"
 BR2_BZR_UP="bzr up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index d95b666..16af8ba 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -82,9 +82,8 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-avr32/kernel-patches-$(BR2_K
 # Build options
 #
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 3069f6a..8bb771d 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -83,9 +83,8 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-avr32/kernel-patches-$(BR2_K
 # Build options
 #
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index e30ec3f..fb03076 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -85,9 +85,8 @@ BR2_TARGET_I686=y
 # Build options
 #
 BR2_WGET="wget --passive-ftp"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 916454d..1a657db 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -85,9 +85,8 @@ BR2_TARGET_I686=y
 # Build options
 #
 BR2_WGET="wget --passive-ftp"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 3d82ba2..0b4c219 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -81,9 +81,8 @@ BR2_BOARD_PATH="target/device/ARMLTD/$(BR2_BOARD_NAME)"
 # Build options
 #
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index ca13339..2d5c352 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -81,9 +81,8 @@ BR2_BOARD_PATH="target/device/ARMLTD/$(BR2_BOARD_NAME)"
 # Build options
 #
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 4f392ab..1e1fcc8 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -92,9 +92,8 @@ BR2_TARGET_ARM=y
 #
 BR2_PRIMARY_SITE=""
 BR2_WGET="wget --passive-ftp -nd"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index c82e7d7..8e9f96e 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -63,9 +63,8 @@ BR2_TARGET_VALKA_V100SC2=y
 #
 BR2_PRIMARY_SITE=""
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
-BR2_SVN_CO="svn co"
-BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_SVN="svn"
+BR2_GIT="git"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-- 
1.7.1
