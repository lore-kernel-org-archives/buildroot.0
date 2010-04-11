From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Apr 2010 21:10:35 +0200
Subject: [Buildroot] [git commit master] Update defconfigs after
	BR2_GNU_BUILD_SUFFIX removal
Message-ID: <20100411195036.E983220B98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ec66816ad5e277ecf0833d986a0f0a372d835536
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
index 325c3f7..eabc094 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -162,7 +162,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index b592e7b..0d34dc7 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -167,7 +167,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 2ec58fa..71108b8 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -162,7 +162,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91rm9200df-rootfs"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index d9ef5e4..a98bcd3 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -173,7 +173,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91rm9200df-rootfs"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 22c61da..cd03fed 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -180,7 +180,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc-rootfs"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index e5584f6..943a839 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -162,7 +162,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc-rootfs"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index e1cba70..637b937 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -181,7 +181,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc-rootfs"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index d8e1edf..396adee 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -72,7 +72,6 @@ BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX="wchar"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 43711f5..191f141 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -183,7 +183,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9261ek-NAND"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 265f2a2..f6cd006 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -165,7 +165,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9261ek-rootfs"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index da2e8b1..2b048d3 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -184,7 +184,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9261ek-NAND"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index f9979a0..2e8147b 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -181,7 +181,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9263ek-NAND"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 8c15e3c..1652fef 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -164,7 +164,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9263ek-rootfs"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index e6e12bb..8f22d68 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -183,7 +183,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9263ek-NAND"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 376f1da..4b00d49 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -181,7 +181,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam92g20ek-rootfs"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 6adcded..86b8075 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -162,7 +162,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9g20dfc-rootfs"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 588aa4a..5d6cf3b 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -181,7 +181,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9g20dfc-rootfs"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 24606ed..3a62434 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -113,7 +113,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index d8f03f9..cb456f6 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -113,7 +113,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=3
 # BR2_DEPRECATED is not set
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index f7de236..998f2f9 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -113,7 +113,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 7f0ef5a..87d2f01 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -112,7 +112,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index b4c0312..c65aa99 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -113,7 +113,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 85e2a47..7634b26 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -113,7 +113,6 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index a9d4629..8897cd1 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -111,7 +111,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
 BR2_ROOTFS_SUFFIX=""
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 65b1c42..56e3fce 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -111,7 +111,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="$(BOARD_NAME)-rootfs"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 70aa1f9..126acea 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -119,7 +119,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
 BR2_ROOTFS_SUFFIX=""
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 28b9da1..199d11e 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -90,7 +90,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
 BR2_ROOTFS_SUFFIX="$(DATE)"
-BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-- 
1.6.3.3
