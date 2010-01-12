From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jan 2010 00:27:24 +0100
Subject: [Buildroot] [PATCH 5/6] Update defconfigs after
	BR2_TARGET_OPTIMIZATION rename
In-Reply-To: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
References: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
Message-ID: <aac922d49c2f3cf2a5b70aaf038e532bf0123a53.1263338839.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_toolchain_defconfig           |    2 +-
 configs/at91rm9200df_defconfig            |    2 +-
 configs/at91rm9200df_ext_bare_defconfig   |    2 +-
 configs/at91rm9200df_ext_defconfig        |    2 +-
 configs/at91sam9260dfc_defconfig          |    2 +-
 configs/at91sam9260dfc_ext_bare_defconfig |    2 +-
 configs/at91sam9260dfc_ext_defconfig      |    2 +-
 configs/at91sam9260pf_defconfig           |    2 +-
 configs/at91sam9261ek_defconfig           |    2 +-
 configs/at91sam9261ek_ext_bare_defconfig  |    2 +-
 configs/at91sam9261ek_ext_defconfig       |    2 +-
 configs/at91sam9263ek_defconfig           |    2 +-
 configs/at91sam9263ek_ext_bare_defconfig  |    2 +-
 configs/at91sam9263ek_ext_defconfig       |    2 +-
 configs/at91sam9g20dfc_defconfig          |    2 +-
 configs/at91sam9g20dfc_ext_bare_defconfig |    2 +-
 configs/at91sam9g20dfc_ext_defconfig      |    2 +-
 configs/atngw100-base_defconfig           |    2 +-
 configs/atngw100_defconfig                |    2 +-
 configs/atstk1005_defconfig               |    2 +-
 configs/atstk100x_defconfig               |    2 +-
 configs/i386_defconfig                    |    2 +-
 configs/i686_defconfig                    |    2 +-
 configs/integrator926_defconfig           |    2 +-
 configs/integrator926_huge_defconfig      |    2 +-
 configs/kb9202_defconfig                  |    2 +-
 configs/v100sc2_defconfig                 |    2 +-
 27 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index f044e51..136b0d7 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -291,7 +291,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 # BR2_ELF2FLT is not set
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 3d98b0f..c8786a9 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -306,7 +306,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 # BR2_ELF2FLT is not set
 # BR2_MKLIBS is not set
 BR2_PACKAGE_SSTRIP_TARGET=y
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 84f6b7e..12666a3 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -218,7 +218,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 
 #
 # Package Selection for the target
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 1dea062..386777a 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -238,7 +238,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 
 #
 # Package Selection for the target
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 1b4094e..3ab9f0c 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -324,7 +324,7 @@ BR2_INET_RPC=y
 BR2_USE_WCHAR=y
 # BR2_SOFT_FLOAT is not set
 # BR2_VFP_FLOAT is not set
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index d99cfa2..835ee14 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -216,7 +216,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 BR2_TOOLCHAIN_EXTERNAL_PATH="$(GCCROOT)"
 BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
 
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 14bdc7a..c4f1343 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -246,7 +246,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 
 #
 # Package Selection for the target
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index c668e03..305b349 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -216,7 +216,7 @@ BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_USE_WCHAR=y
 # BR2_SOFT_FLOAT is not set
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 9598085..413f185 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -318,7 +318,7 @@ BR2_INET_RPC=y
 BR2_USE_WCHAR=y
 # BR2_SOFT_FLOAT is not set
 # BR2_VFP_FLOAT is not set
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 4c534a7..aa0904b 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -221,7 +221,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 
 #
 # Package Selection for the target
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index e7da95a..a5a7600 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -277,7 +277,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 
 #
 # Package Selection for the target
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 145700d..5b232c2 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -311,7 +311,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 # BR2_ELF2FLT is not set
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 185372c..6035573 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -220,7 +220,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 
 #
 # Package Selection for the target
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 15b4d3b..ae16d78 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -239,7 +239,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 
 #
 # Package Selection for the target
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index a6ef10c..c84684e 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -311,7 +311,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 # BR2_ELF2FLT is not set
 # BR2_MKLIBS is not set
 BR2_PACKAGE_SSTRIP_TARGET=y
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 3feef30..d6f077b 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -218,7 +218,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 
 #
 # Package Selection for the target
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 96d9793..0d17dee 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -246,7 +246,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 
 #
 # Package Selection for the target
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 6fbc0de..4ea3ecd 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -236,7 +236,7 @@ BR2_SOFT_FLOAT=y
 BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 # BR2_INSTALL_LIBSTDCPP is not set
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 7a6cba4..5e75f3a 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -247,7 +247,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 309ac08..75442bc 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -252,7 +252,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index b4abff9..16c25cb 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -248,7 +248,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 97067c4..b1f22a8 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -246,7 +246,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index a3a2683..d2ba8f0 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -246,7 +246,7 @@ BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 2d2579b..434e87a 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -242,7 +242,7 @@ BR2_GCC_SHARED_LIBGCC=y
 # BR2_INET_RPC is not set
 # BR2_USE_WCHAR is not set
 BR2_SOFT_FLOAT=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe -fwrapv"
+BR2_EXTRA_TARGET_CFLAGS="-pipe -fwrapv"
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 380e2e1..7533259 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -243,7 +243,7 @@ BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_USE_WCHAR=y
 BR2_SOFT_FLOAT=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe -fwrapv"
+BR2_EXTRA_TARGET_CFLAGS="-pipe -fwrapv"
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 608eb86..a5708ce 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -244,7 +244,7 @@ BR2_GCC_SHARED_LIBGCC=y
 # BR2_INET_RPC is not set
 # BR2_USE_WCHAR is not set
 BR2_SOFT_FLOAT=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 336953e..448debc 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -217,7 +217,7 @@ BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_USE_WCHAR=y
 BR2_SOFT_FLOAT=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_EXTRA_TARGET_CFLAGS="-pipe"
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
-- 
1.6.3.3
