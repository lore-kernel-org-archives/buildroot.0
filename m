From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Apr 2010 21:10:35 +0200
Subject: [Buildroot] [git commit master] Update defconfigs after
	BR2_UPDATE_CONFIG removal
Message-ID: <20100411195033.109AF20B81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0f5a2ea7765c0d429607998647f8db1197b25a24
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
 target/xtensa/defconfig                   |    1 -
 28 files changed, 0 insertions(+), 28 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index d827dda..76ba81e 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -182,7 +182,6 @@ BR2_OPTIMIZE_2=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index b231dbe..a1946b7 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -187,7 +187,6 @@ BR2_OPTIMIZE_2=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index b5dd71e..e874ffa 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -182,7 +182,6 @@ BR2_OPTIMIZE_2=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 8817ae0..e94a730 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -193,7 +193,6 @@ BR2_OPTIMIZE_2=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 052b78e..ae67079 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -200,7 +200,6 @@ BR2_OPTIMIZE_2=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index 90f6f60..a5aa0b3 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -182,7 +182,6 @@ BR2_OPTIMIZE_2=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index b01b457..1a8aba4 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -201,7 +201,6 @@ BR2_OPTIMIZE_2=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index 9e463c5..d8e1edf 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -52,7 +52,6 @@ BR2_ENDIAN="LITTLE"
 #
 # Build options
 #
-# BR2_UPDATE_CONFIG is not set
 BR2_WGET="wget --passive-ftp"
 BR2_SVN="svn co"
 BR2_ZCAT="gzip -d -c"
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 4b9cac0..b07117e 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -203,7 +203,6 @@ BR2_OPTIMIZE_S=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 19661eb..68c67ae 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -185,7 +185,6 @@ BR2_OPTIMIZE_2=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 1bf11ad..e777292 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -204,7 +204,6 @@ BR2_OPTIMIZE_S=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index dac5ec5..4c9cce3 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -201,7 +201,6 @@ BR2_OPTIMIZE_S=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 2ede9a8..7d01b98 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -184,7 +184,6 @@ BR2_OPTIMIZE_2=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index b6b7f53..f2d432c 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -203,7 +203,6 @@ BR2_OPTIMIZE_S=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index c02efe8..0eb0026 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -201,7 +201,6 @@ BR2_OPTIMIZE_2=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 1401133..ca7f4fd 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -182,7 +182,6 @@ BR2_OPTIMIZE_2=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index aab8f43..9626136 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -201,7 +201,6 @@ BR2_OPTIMIZE_2=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 13457d8..012d78e 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -133,7 +133,6 @@ BR2_OPTIMIZE_S=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 3a32f8d..e66365f 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -133,7 +133,6 @@ BR2_OPTIMIZE_S=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 4b894d7..3a8d71c 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -133,7 +133,6 @@ BR2_OPTIMIZE_S=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 86a351b..b2c5850 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -132,7 +132,6 @@ BR2_OPTIMIZE_2=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 82b09e4..783ddcc 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -133,7 +133,6 @@ BR2_OPTIMIZE_S=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 85ddffe..436a7f8 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -133,7 +133,6 @@ BR2_OPTIMIZE_S=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index f907053..cd3cf74 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -131,7 +131,6 @@ BR2_OPTIMIZE_S=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index fa4e55f..dc261ec 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -131,7 +131,6 @@ BR2_OPTIMIZE_S=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 9b313a8..ae7c702 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -137,7 +137,6 @@ BR2_OPTIMIZE_S=y
 # BR2_HAVE_MANPAGES is not set
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 672c5e0..f90d8a7 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -109,7 +109,6 @@ BR2_OPTIMIZE_S=y
 # BR2_HAVE_INFOPAGES is not set
 # BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
-BR2_UPDATE_CONFIG=y
 
 #
 # Toolchain
diff --git a/target/xtensa/defconfig b/target/xtensa/defconfig
index f9b53a3..f03f7a6 100644
--- a/target/xtensa/defconfig
+++ b/target/xtensa/defconfig
@@ -19,7 +19,6 @@ BR2_WGET="wget --passive-ftp"
 # BR2_STRIP_none=y
 
 ## Added by Maxim
-BR2_UPDATE_CONFIG=y
 
 #
 # Kernel Header Options
-- 
1.6.3.3
