From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 00:00:10 +0200
Subject: [Buildroot] [git commit master] Update defconfigs after
	BR2_GNU_TARGET_SUFFIX removal
Message-ID: <20100502220952.A24448ABA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=86f0c602dee621ffd8298a4f0e4519b276e7a5be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/arm_toolchain_defconfig           |    1 -
 configs/at91rm9200df_defconfig            |    1 -
 configs/at91rm9200df_ext_bare_defconfig   |    1 -
 configs/at91rm9200df_ext_defconfig        |    1 -
 configs/at91sam9260dfc_defconfig          |    1 -
 configs/at91sam9260dfc_ext_bare_defconfig |    1 -
 configs/at91sam9260dfc_ext_defconfig      |    1 -
 configs/at91sam9260pf_defconfig           |    1 -
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
 27 files changed, 0 insertions(+), 27 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 2ad9e63..460fe95 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -161,7 +161,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 BR2_CONFIG_CACHE=y
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index e07ef84..7d2bcfd 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -166,7 +166,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 2198cb2..436c8ff 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -161,7 +161,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91rm9200df-rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 5957a68..79e55fc 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -172,7 +172,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91rm9200df-rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index daa1c82..087067f 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -179,7 +179,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc-rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index d53b294..92704d9 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -161,7 +161,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc-rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index cab9a4c..e52cd2d 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -180,7 +180,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc-rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index a2b8695..b45271c 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -72,7 +72,6 @@ BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX="wchar"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 7d79611..cd7483b 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -182,7 +182,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9261ek-NAND"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 BR2_CONFIG_CACHE=y
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 346b9b6..b687190 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -164,7 +164,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9261ek-rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 1819442..5ab47ad 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -183,7 +183,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9261ek-NAND"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 BR2_CONFIG_CACHE=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 87db7a0..bc95b6b 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -180,7 +180,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9263ek-NAND"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 BR2_CONFIG_CACHE=y
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 58ce35d..4ec46b3 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -163,7 +163,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9263ek-rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 49466fc..9771c83 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -182,7 +182,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9263ek-NAND"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 BR2_CONFIG_CACHE=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 7eac58c..30cc4e1 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -180,7 +180,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam92g20ek-rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 0feba79..75f65ea 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -161,7 +161,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9g20dfc-rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index a9fa530..e18754e 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -180,7 +180,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9g20dfc-rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index cc6ccf9..d3092df 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -113,7 +113,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 7c5be16..995aee1 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -113,7 +113,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=3
 # BR2_DEPRECATED is not set
 BR2_CONFIG_CACHE=y
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 0a7a7d8..a1fe0b7 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -112,7 +112,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 8be238e..0fbbf14 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -112,7 +112,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 09a960e..2481412 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -113,7 +113,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index eb7b180..066842f 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -113,7 +113,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 7270bcb..3879272 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -110,7 +110,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 77f9548..86443db 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -110,7 +110,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="$(BOARD_NAME)-rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 3c865ea..4c84b9e 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -118,7 +118,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
 # BR2_ENABLE_DEBUG is not set
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index c47e0e1..0ad7ab0 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -89,7 +89,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
-BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
 # BR2_ENABLE_DEBUG is not set
-- 
1.6.3.3
