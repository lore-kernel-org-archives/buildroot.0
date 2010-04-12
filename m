From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:31:39 +0200
Subject: [Buildroot] [PATCH 3/3] Update defconfigs after BR2_RECENT removal
In-Reply-To: <cover.1271078939.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271078939.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9554403ad0b81f29dd4ee1404de755aa5b72cac5.1271078939.git.thomas.petazzoni@free-electrons.com>
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
index fa1a442..529a363 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -165,7 +165,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 BR2_CONFIG_CACHE=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index fe4f44b..e4c0b0e 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -170,7 +170,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 71108b8..65a640b 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -165,7 +165,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index a98bcd3..6a39002 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -176,7 +176,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 900f283..8fb7f0e 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -183,7 +183,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index 943a839..6e4d478 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -165,7 +165,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 637b937..22287ba 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -184,7 +184,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 091a72e..73fc09c 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -186,7 +186,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 BR2_CONFIG_CACHE=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index f6cd006..316c15e 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -168,7 +168,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 2b048d3..4bb96f1 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -187,7 +187,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 BR2_CONFIG_CACHE=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 7252473..cdbeaa3 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -184,7 +184,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 BR2_CONFIG_CACHE=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 1652fef..3e57789 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -167,7 +167,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 8f22d68..944811f 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -186,7 +186,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 BR2_CONFIG_CACHE=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index d03cfb5..710639b 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -184,7 +184,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 86b8075..4db69f3 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -165,7 +165,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 5d6cf3b..a2f34a2 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -184,7 +184,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 3a62434..cd5a676 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -116,7 +116,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 7655bc6..367bcdc 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -116,7 +116,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=3
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 BR2_CONFIG_CACHE=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 92b5911..50e013e 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -116,7 +116,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index e969073..df30b05 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -115,7 +115,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index d3ba527..284afc6 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -116,7 +116,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index dc24c99..87c3512 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -116,7 +116,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 8897cd1..4e2de89 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -114,7 +114,6 @@ BR2_ROOTFS_SUFFIX=""
 BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 56e3fce..06814c1 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -114,7 +114,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 126acea..b1ec323 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -122,7 +122,6 @@ BR2_ROOTFS_SUFFIX=""
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 199d11e..309b80e 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -93,7 +93,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
-- 
1.6.3.3
