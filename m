From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:09 +0200
Subject: [Buildroot] [PATCH 13/25] Update defconfigs after BR2_RECENT removal
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5ebed9ddcd21bc46a4bb118986220a6d7cf58fe8.1270958653.git.thomas.petazzoni@free-electrons.com>
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
index 325c3f7..79193e1 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -166,7 +166,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 BR2_CONFIG_CACHE=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index b592e7b..308aec0 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -171,7 +171,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 2ec58fa..53ebc37 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -166,7 +166,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index d9ef5e4..4beb1e4 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -177,7 +177,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 22c61da..c9777e2 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -184,7 +184,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index e5584f6..e36a905 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -166,7 +166,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index e1cba70..b927dc4 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -185,7 +185,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 43711f5..324b7bc 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -187,7 +187,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 BR2_CONFIG_CACHE=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 265f2a2..56a2912 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -169,7 +169,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index da2e8b1..365b36f 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -188,7 +188,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 BR2_CONFIG_CACHE=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index f9979a0..90090e9 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -185,7 +185,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 BR2_CONFIG_CACHE=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 8c15e3c..53e8b0b 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -168,7 +168,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index e6e12bb..265e2ed 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -187,7 +187,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 BR2_CONFIG_CACHE=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 376f1da..5709cbb 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -185,7 +185,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 6adcded..43905f9 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -166,7 +166,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 588aa4a..1d76e30 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -185,7 +185,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 24606ed..ae3a735 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -117,7 +117,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index d8f03f9..c701bab 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -117,7 +117,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=3
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 BR2_CONFIG_CACHE=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index f7de236..8d8ec6a 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -117,7 +117,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 7f0ef5a..fa4caa1 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -116,7 +116,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index b4c0312..a225b29 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -117,7 +117,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 85e2a47..c653cc4 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -117,7 +117,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index a9d4629..767e370 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -115,7 +115,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 65b1c42..9f18d8c 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -115,7 +115,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 70aa1f9..a7e2cc3 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -123,7 +123,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 28b9da1..51017ca 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -94,7 +94,6 @@ BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_RECENT=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
-- 
1.6.3.3
