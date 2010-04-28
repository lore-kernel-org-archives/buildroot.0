From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:40:56 +0200
Subject: [Buildroot] [PATCH 15/19] Update defconfigs after BR2_ROOTFS_SUFFIX
	removal
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <059eda899dc6e4c4502828896fee31fa5262b40d.1272490771.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_toolchain_defconfig           |    1 -
 configs/at91rm9200df_defconfig            |    1 -
 configs/at91rm9200df_ext_bare_defconfig   |    1 -
 configs/at91rm9200df_ext_defconfig        |    1 -
 configs/at91sam9260dfc_defconfig          |    1 -
 configs/at91sam9260dfc_ext_bare_defconfig |    1 -
 configs/at91sam9260dfc_ext_defconfig      |    1 -
 configs/at91sam9261ek_defconfig           |    1 -
 configs/at91sam9261ek_ext_bare_defconfig  |    1 -
 configs/at91sam9261ek_ext_defconfig       |    1 -
 configs/at91sam9263ek_defconfig           |    1 -
 configs/at91sam9263ek_ext_bare_defconfig  |    1 -
 configs/at91sam9263ek_ext_defconfig       |    1 -
 configs/at91sam9g20dfc_defconfig          |    1 -
 configs/at91sam9g20dfc_ext_bare_defconfig |    1 -
 configs/at91sam9g20dfc_ext_defconfig      |    1 -
 configs/atngw100-base_defconfig           |    1 -
 configs/atngw100_defconfig                |    1 -
 configs/atstk1005_defconfig               |    1 -
 configs/atstk100x_defconfig               |    1 -
 configs/i386_defconfig                    |    1 -
 configs/i686_defconfig                    |    1 -
 configs/integrator926_defconfig           |    1 -
 configs/integrator926_huge_defconfig      |    1 -
 configs/kb9202_defconfig                  |    1 -
 configs/v100sc2_defconfig                 |    1 -
 26 files changed, 0 insertions(+), 26 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 8e89107..2ad9e63 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -161,7 +161,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index e004b21..e07ef84 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -166,7 +166,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 032064a..2198cb2 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -161,7 +161,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91rm9200df-rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 35251a3..5957a68 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -172,7 +172,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91rm9200df-rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index b571c80..daa1c82 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -179,7 +179,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc-rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index e1ace69..d53b294 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -161,7 +161,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc-rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index c430d3d..cab9a4c 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -180,7 +180,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc-rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 1cfc2e7..7d79611 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -182,7 +182,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9261ek-NAND"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 5e5e22d..346b9b6 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -164,7 +164,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9261ek-rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 362680b..1819442 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -183,7 +183,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9261ek-NAND"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index a670b41..87db7a0 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -180,7 +180,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9263ek-NAND"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index bc6f626..58ce35d 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -163,7 +163,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9263ek-rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 4a59ea6..49466fc 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -182,7 +182,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9263ek-NAND"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index a57dcff..7eac58c 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -180,7 +180,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam92g20ek-rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 3977dc9..0feba79 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -161,7 +161,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9g20dfc-rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 632f2d1..a9fa530 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -180,7 +180,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9g20dfc-rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 15d779a..cc6ccf9 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -693,7 +693,6 @@ BR2_PACKAGE_ZLIB=y
 # Target filesystem options
 #
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 
 #
 # filesystem for target device
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index ecaf774..7c5be16 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -683,7 +683,6 @@ BR2_PACKAGE_ZLIB=y
 # Target filesystem options
 #
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 
 #
 # filesystem for target device
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 6b7a7b6..0a7a7d8 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -112,7 +112,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 1a27f1a..8be238e 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -829,7 +829,6 @@ BR2_PACKAGE_ZLIB=y
 # Target filesystem options
 #
 BR2_ROOTFS_PREFIX="atstk1002-rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 
 #
 # filesystem for target device
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 284afc6..09a960e 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -671,7 +671,6 @@ BR2_PACKAGE_ZLIB=y
 # Target filesystem options
 #
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_ROOTFS_SUFFIX=""
 
 #
 # filesystem for target device
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 87c3512..eb7b180 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -671,7 +671,6 @@ BR2_PACKAGE_ZLIB=y
 # Target filesystem options
 #
 BR2_ROOTFS_PREFIX="i686-rootfs"
-BR2_ROOTFS_SUFFIX=""
 
 #
 # filesystem for target device
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 4e2de89..7270bcb 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -110,7 +110,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_ROOTFS_SUFFIX=""
 BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 06814c1..77f9548 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -110,7 +110,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="$(BOARD_NAME)-rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index e66348b..3c865ea 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -118,7 +118,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_ROOTFS_SUFFIX=""
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index b139c27..c47e0e1 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -89,7 +89,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-- 
1.6.3.3
