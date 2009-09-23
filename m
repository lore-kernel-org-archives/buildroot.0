From: Michael Roth <mroth@nessie.de>
Date: Wed, 23 Sep 2009 12:03:47 +0200
Subject: [Buildroot] [PATCH] Fix download directory in default configs
Message-ID: <1253700227-11064-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 .../ARMLTD/integrator926/integrator926_defconfig   |    2 +-
 .../integrator926_huge_defconfig                   |    2 +-
 .../Atmel/at91rm9200df/at91rm9200df_defconfig      |    2 +-
 .../at91rm9200df/at91rm9200df_ext_bare_defconfig   |    2 +-
 .../Atmel/at91rm9200df/at91rm9200df_ext_defconfig  |    2 +-
 .../Atmel/at91sam9260dfc/arm_toolchain_defconfig   |    2 +-
 .../Atmel/at91sam9260dfc/at91sam9260dfc_defconfig  |    2 +-
 .../at91sam9260dfc_ext_bare_defconfig              |    2 +-
 .../at91sam9260dfc/at91sam9260dfc_ext_defconfig    |    2 +-
 .../Atmel/at91sam9261ek/at91sam9261ek_defconfig    |    2 +-
 .../at91sam9261ek/at91sam9261ek_ext_bare_defconfig |    2 +-
 .../at91sam9261ek/at91sam9261ek_ext_defconfig      |    2 +-
 .../Atmel/at91sam9263ek/at91sam9263ek_defconfig    |    2 +-
 .../at91sam9263ek/at91sam9263ek_ext_bare_defconfig |    2 +-
 .../at91sam9263ek/at91sam9263ek_ext_defconfig      |    2 +-
 .../Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig  |    2 +-
 .../at91sam9g20dfc_ext_bare_defconfig              |    2 +-
 .../at91sam9g20dfc/at91sam9g20dfc_ext_defconfig    |    2 +-
 .../Atmel/atngw100-base/atngw100-base_defconfig    |    2 +-
 target/device/Atmel/atngw100/atngw100_defconfig    |    2 +-
 target/device/Atmel/atstk1005/atstk1005_defconfig  |    2 +-
 target/device/Atmel/atstk100x/atstk100x_defconfig  |    2 +-
 target/device/KwikByte/kb9202/kb9202_defconfig     |    2 +-
 target/device/valka/v100sc2_defconfig              |    2 +-
 target/device/x86/i686/i386_defconfig              |    2 +-
 target/device/x86/i686/i686_defconfig              |    2 +-
 26 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/target/device/ARMLTD/integrator926/integrator926_defconfig b/target/device/ARMLTD/integrator926/integrator926_defconfig
index 652b935..9531f1c 100644
--- a/target/device/ARMLTD/integrator926/integrator926_defconfig
+++ b/target/device/ARMLTD/integrator926/integrator926_defconfig
@@ -87,7 +87,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig b/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
index a7cdda7..805ac0f 100644
--- a/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
+++ b/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
@@ -87,7 +87,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig b/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
index de1db56..0f584fc 100644
--- a/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
+++ b/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
@@ -143,7 +143,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91rm9200df/at91rm9200df_ext_bare_defconfig b/target/device/Atmel/at91rm9200df/at91rm9200df_ext_bare_defconfig
index ee7a2e5..48b7eb5 100644
--- a/target/device/Atmel/at91rm9200df/at91rm9200df_ext_bare_defconfig
+++ b/target/device/Atmel/at91rm9200df/at91rm9200df_ext_bare_defconfig
@@ -138,7 +138,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91rm9200df/at91rm9200df_ext_defconfig b/target/device/Atmel/at91rm9200df/at91rm9200df_ext_defconfig
index b70fcbd..33174ae 100644
--- a/target/device/Atmel/at91rm9200df/at91rm9200df_ext_defconfig
+++ b/target/device/Atmel/at91rm9200df/at91rm9200df_ext_defconfig
@@ -149,7 +149,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig b/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig
index 3113aae..1c59ae5 100644
--- a/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig
+++ b/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig
@@ -138,7 +138,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
index c50b25d..1d7e10f 100644
--- a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
+++ b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
@@ -156,7 +156,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_bare_defconfig b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_bare_defconfig
index cfb45b1..6620faf 100644
--- a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_bare_defconfig
+++ b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_bare_defconfig
@@ -138,7 +138,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_defconfig b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_defconfig
index 98f2303..4579b46 100644
--- a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_defconfig
+++ b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_defconfig
@@ -157,7 +157,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig b/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
index d7e86aa..ef1e44d 100644
--- a/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
+++ b/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
@@ -159,7 +159,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_bare_defconfig b/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_bare_defconfig
index f261d9a..03c2acb 100644
--- a/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_bare_defconfig
+++ b/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_bare_defconfig
@@ -141,7 +141,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_defconfig b/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_defconfig
index 61d4ff8..1bd143c 100644
--- a/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_defconfig
+++ b/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_defconfig
@@ -160,7 +160,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig b/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
index 93ff2f5..7ea6a99 100644
--- a/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
+++ b/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
@@ -157,7 +157,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_bare_defconfig b/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_bare_defconfig
index cc31254..7ba1eed 100644
--- a/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_bare_defconfig
+++ b/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_bare_defconfig
@@ -140,7 +140,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_defconfig b/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_defconfig
index c42bf14..3fd7a36 100644
--- a/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_defconfig
+++ b/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_defconfig
@@ -159,7 +159,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
index a7a5c8c..30a2e4c 100644
--- a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
+++ b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
@@ -157,7 +157,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_bare_defconfig b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_bare_defconfig
index 48fe7ff..63e166d 100644
--- a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_bare_defconfig
+++ b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_bare_defconfig
@@ -138,7 +138,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_defconfig b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_defconfig
index c19a0d9..19ab324 100644
--- a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_defconfig
+++ b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_defconfig
@@ -157,7 +157,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/atngw100-base/atngw100-base_defconfig b/target/device/Atmel/atngw100-base/atngw100-base_defconfig
index 716cb19..0e0b78d 100644
--- a/target/device/Atmel/atngw100-base/atngw100-base_defconfig
+++ b/target/device/Atmel/atngw100-base/atngw100-base_defconfig
@@ -91,7 +91,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/atngw100/atngw100_defconfig b/target/device/Atmel/atngw100/atngw100_defconfig
index 8dfb872..ba30c13 100644
--- a/target/device/Atmel/atngw100/atngw100_defconfig
+++ b/target/device/Atmel/atngw100/atngw100_defconfig
@@ -91,7 +91,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/atstk1005/atstk1005_defconfig b/target/device/Atmel/atstk1005/atstk1005_defconfig
index 41f2c12..99b740a 100644
--- a/target/device/Atmel/atstk1005/atstk1005_defconfig
+++ b/target/device/Atmel/atstk1005/atstk1005_defconfig
@@ -89,7 +89,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/Atmel/atstk100x/atstk100x_defconfig b/target/device/Atmel/atstk100x/atstk100x_defconfig
index 89f392f..7b6d426 100644
--- a/target/device/Atmel/atstk100x/atstk100x_defconfig
+++ b/target/device/Atmel/atstk100x/atstk100x_defconfig
@@ -90,7 +90,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/KwikByte/kb9202/kb9202_defconfig b/target/device/KwikByte/kb9202/kb9202_defconfig
index 78af5f4..ce50f2c 100644
--- a/target/device/KwikByte/kb9202/kb9202_defconfig
+++ b/target/device/KwikByte/kb9202/kb9202_defconfig
@@ -98,7 +98,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 
 #
 # Mirrors and Download locations
diff --git a/target/device/valka/v100sc2_defconfig b/target/device/valka/v100sc2_defconfig
index 81f5081..f444951 100644
--- a/target/device/valka/v100sc2_defconfig
+++ b/target/device/valka/v100sc2_defconfig
@@ -69,7 +69,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 
 #
 # Mirrors and Download locations
diff --git a/target/device/x86/i686/i386_defconfig b/target/device/x86/i686/i386_defconfig
index 74de3e0..2df16ef 100644
--- a/target/device/x86/i686/i386_defconfig
+++ b/target/device/x86/i686/i386_defconfig
@@ -91,7 +91,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
diff --git a/target/device/x86/i686/i686_defconfig b/target/device/x86/i686/i686_defconfig
index 441b7a6..af0cc15 100644
--- a/target/device/x86/i686/i686_defconfig
+++ b/target/device/x86/i686/i686_defconfig
@@ -91,7 +91,7 @@ BR2_GIT="git clone"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
 
 #
-- 
1.6.3.3
