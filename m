From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:04:58 +0200
Subject: [Buildroot] [PATCH 02/25] Update defconfig after BR2_PREFER_IMA
	removal
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0a63c06319a792a3d59f1f6a3ce181c9e43d5f0f.1270958653.git.thomas.petazzoni@free-electrons.com>
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
index f044e51..d827dda 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -165,7 +165,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 BR2_CONFIG_CACHE=y
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 1fe6e3f..b231dbe 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -170,7 +170,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 84f6b7e..b5dd71e 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -165,7 +165,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 32843ba..8817ae0 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -176,7 +176,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 46166e0..052b78e 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -183,7 +183,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index d99cfa2..90f6f60 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -165,7 +165,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 7f12884..b01b457 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -184,7 +184,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index b9e8a28..9e463c5 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -76,7 +76,6 @@ BR2_TOPDIR_SUFFIX="wchar"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 1073e78..4b9cac0 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -186,7 +186,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 BR2_CONFIG_CACHE=y
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 4c534a7..19661eb 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -168,7 +168,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index d7f9f4a..1bf11ad 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -187,7 +187,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 BR2_CONFIG_CACHE=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 74dbfcd..dac5ec5 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -184,7 +184,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 BR2_CONFIG_CACHE=y
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 185372c..2ede9a8 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -167,7 +167,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 44c30e2..b6b7f53 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -186,7 +186,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 BR2_CONFIG_CACHE=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 9b3af76..c02efe8 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -184,7 +184,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 3feef30..1401133 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -165,7 +165,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 5bf6ea7..aab8f43 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -184,7 +184,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index fe34989..13457d8 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -116,7 +116,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 4a702a5..3a32f8d 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -116,7 +116,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=3
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 BR2_CONFIG_CACHE=y
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index c829495..4b894d7 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -116,7 +116,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index c1398d4..86a351b 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -115,7 +115,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 4c2d092..82b09e4 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -116,7 +116,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index dcf35d7..85ddffe 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -116,7 +116,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index e537b40..f907053 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -114,7 +114,6 @@ BR2_ROOTFS_SUFFIX=""
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
 BR2_JLEVEL=1
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 276d69a..fa4e55f 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -114,7 +114,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
 BR2_JLEVEL=1
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 67e6d68..9b313a8 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -122,7 +122,6 @@ BR2_ROOTFS_SUFFIX=""
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_ENABLE_DEBUG is not set
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 836321a..672c5e0 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -93,7 +93,6 @@ BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
-# BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
 # BR2_ENABLE_DEBUG is not set
-- 
1.6.3.3
