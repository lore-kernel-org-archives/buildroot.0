From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:06 +0200
Subject: [Buildroot] [PATCH 10/25] Update defconfigs after
	BR2_HAVE_{INFOPAGES, MANPAGES} removal
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7500d6d75354df676ec3538653cbb07c03ab6ff1.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_toolchain_defconfig           |    2 --
 configs/at91rm9200df_defconfig            |    2 --
 configs/at91rm9200df_ext_bare_defconfig   |    2 --
 configs/at91rm9200df_ext_defconfig        |    2 --
 configs/at91sam9260dfc_defconfig          |    2 --
 configs/at91sam9260dfc_ext_bare_defconfig |    2 --
 configs/at91sam9260dfc_ext_defconfig      |    2 --
 configs/at91sam9261ek_defconfig           |    2 --
 configs/at91sam9261ek_ext_bare_defconfig  |    2 --
 configs/at91sam9261ek_ext_defconfig       |    2 --
 configs/at91sam9263ek_defconfig           |    2 --
 configs/at91sam9263ek_ext_bare_defconfig  |    2 --
 configs/at91sam9263ek_ext_defconfig       |    2 --
 configs/at91sam9g20dfc_defconfig          |    2 --
 configs/at91sam9g20dfc_ext_bare_defconfig |    2 --
 configs/at91sam9g20dfc_ext_defconfig      |    2 --
 configs/atngw100-base_defconfig           |    2 --
 configs/atngw100_defconfig                |    2 --
 configs/atstk1005_defconfig               |    2 --
 configs/atstk100x_defconfig               |    2 --
 configs/i386_defconfig                    |    2 --
 configs/i686_defconfig                    |    2 --
 configs/integrator926_defconfig           |    2 --
 configs/integrator926_huge_defconfig      |    2 --
 configs/kb9202_defconfig                  |    2 --
 configs/v100sc2_defconfig                 |    2 --
 26 files changed, 0 insertions(+), 52 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 76ba81e..325c3f7 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -178,8 +178,6 @@ BR2_OPTIMIZE_2=y
 # BR2_OPTIMIZE_3 is not set
 # BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index a1946b7..b592e7b 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -183,8 +183,6 @@ BR2_OPTIMIZE_2=y
 # BR2_OPTIMIZE_3 is not set
 # BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index e874ffa..2ec58fa 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -178,8 +178,6 @@ BR2_OPTIMIZE_2=y
 # BR2_OPTIMIZE_3 is not set
 # BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index e94a730..d9ef5e4 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -189,8 +189,6 @@ BR2_OPTIMIZE_2=y
 # BR2_OPTIMIZE_3 is not set
 # BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index ae67079..22c61da 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -196,8 +196,6 @@ BR2_OPTIMIZE_2=y
 # BR2_OPTIMIZE_3 is not set
 # BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index a5aa0b3..e5584f6 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -178,8 +178,6 @@ BR2_OPTIMIZE_2=y
 # BR2_OPTIMIZE_3 is not set
 # BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 1a8aba4..e1cba70 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -197,8 +197,6 @@ BR2_OPTIMIZE_2=y
 # BR2_OPTIMIZE_3 is not set
 # BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index b07117e..43711f5 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -199,8 +199,6 @@ BR2_STRIP_strip=y
 # BR2_OPTIMIZE_3 is not set
 BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 68c67ae..265f2a2 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -181,8 +181,6 @@ BR2_OPTIMIZE_2=y
 # BR2_OPTIMIZE_3 is not set
 # BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index e777292..da2e8b1 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -200,8 +200,6 @@ BR2_STRIP_strip=y
 # BR2_OPTIMIZE_3 is not set
 BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 4c9cce3..f9979a0 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -197,8 +197,6 @@ BR2_STRIP_strip=y
 # BR2_OPTIMIZE_3 is not set
 BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 7d01b98..8c15e3c 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -180,8 +180,6 @@ BR2_OPTIMIZE_2=y
 # BR2_OPTIMIZE_3 is not set
 # BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index f2d432c..e6e12bb 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -199,8 +199,6 @@ BR2_STRIP_strip=y
 # BR2_OPTIMIZE_3 is not set
 BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 0eb0026..376f1da 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -197,8 +197,6 @@ BR2_OPTIMIZE_2=y
 # BR2_OPTIMIZE_3 is not set
 # BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index ca7f4fd..6adcded 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -178,8 +178,6 @@ BR2_OPTIMIZE_2=y
 # BR2_OPTIMIZE_3 is not set
 # BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 9626136..588aa4a 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -197,8 +197,6 @@ BR2_OPTIMIZE_2=y
 # BR2_OPTIMIZE_3 is not set
 # BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 012d78e..24606ed 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -129,8 +129,6 @@ BR2_STRIP_strip=y
 # BR2_OPTIMIZE_3 is not set
 BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index e66365f..d8f03f9 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -129,8 +129,6 @@ BR2_STRIP_strip=y
 # BR2_OPTIMIZE_3 is not set
 BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 3a8d71c..f7de236 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -129,8 +129,6 @@ BR2_STRIP_strip=y
 # BR2_OPTIMIZE_3 is not set
 BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index b2c5850..7f0ef5a 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -128,8 +128,6 @@ BR2_OPTIMIZE_2=y
 # BR2_OPTIMIZE_3 is not set
 # BR2_OPTIMIZE_S is not set
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 783ddcc..b4c0312 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -129,8 +129,6 @@ BR2_STRIP_strip=y
 # BR2_OPTIMIZE_3 is not set
 BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 436a7f8..85e2a47 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -129,8 +129,6 @@ BR2_STRIP_strip=y
 # BR2_OPTIMIZE_3 is not set
 BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index cd3cf74..a9d4629 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -127,8 +127,6 @@ BR2_STRIP_strip=y
 # BR2_OPTIMIZE_3 is not set
 BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index dc261ec..65b1c42 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -127,8 +127,6 @@ BR2_STRIP_strip=y
 # BR2_OPTIMIZE_3 is not set
 BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index ae7c702..70aa1f9 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -134,8 +134,6 @@ BR2_STRIP_strip=y
 # BR2_OPTIMIZE_3 is not set
 BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DEVFILES is not set
 
 #
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index f90d8a7..28b9da1 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -105,8 +105,6 @@ BR2_STRIP_strip=y
 # BR2_OPTIMIZE_3 is not set
 BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
-# BR2_HAVE_MANPAGES is not set
-# BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 
-- 
1.6.3.3
