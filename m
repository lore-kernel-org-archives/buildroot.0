From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:04:53 +0100
Subject: [Buildroot] [PATCH 21/23] Update non-AVR32 defconfigs
In-Reply-To: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
Message-ID: <da0ee7e4bc82c4c0965383f0dc31e2cf99bd8495.1260831891.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_toolchain_defconfig           |   11 -----------
 configs/at91rm9200df_defconfig            |   11 -----------
 configs/at91rm9200df_ext_bare_defconfig   |   11 -----------
 configs/at91rm9200df_ext_defconfig        |   11 -----------
 configs/at91sam9260dfc_defconfig          |   11 -----------
 configs/at91sam9260dfc_ext_bare_defconfig |   11 -----------
 configs/at91sam9260dfc_ext_defconfig      |   11 -----------
 configs/at91sam9261ek_defconfig           |   11 -----------
 configs/at91sam9261ek_ext_bare_defconfig  |   11 -----------
 configs/at91sam9261ek_ext_defconfig       |   11 -----------
 configs/at91sam9263ek_defconfig           |   11 -----------
 configs/at91sam9263ek_ext_bare_defconfig  |   11 -----------
 configs/at91sam9263ek_ext_defconfig       |   11 -----------
 configs/at91sam9g20dfc_defconfig          |   11 -----------
 configs/at91sam9g20dfc_ext_bare_defconfig |   11 -----------
 configs/at91sam9g20dfc_ext_defconfig      |   11 -----------
 configs/i386_defconfig                    |   12 ------------
 configs/i686_defconfig                    |   12 ------------
 configs/integrator926_defconfig           |   11 -----------
 configs/integrator926_huge_defconfig      |   11 -----------
 target/xtensa/defconfig                   |    3 +--
 21 files changed, 1 insertions(+), 224 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 6c903d0..58d0174 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -190,17 +190,6 @@ BR2_UPDATE_CONFIG=y
 #
 BR2_TOOLCHAIN_BUILDROOT=y
 # BR2_TOOLCHAIN_EXTERNAL is not set
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-BR2_TOOLCHAIN_SOURCE=y
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 
 #
 # Kernel Header Options
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index aba4d0d..a500d21 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -195,17 +195,6 @@ BR2_UPDATE_CONFIG=y
 #
 BR2_TOOLCHAIN_BUILDROOT=y
 # BR2_TOOLCHAIN_EXTERNAL is not set
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-BR2_TOOLCHAIN_SOURCE=y
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 
 #
 # Kernel Header Options
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 463f556..07412aa 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -190,19 +190,8 @@ BR2_UPDATE_CONFIG=y
 #
 # BR2_TOOLCHAIN_BUILDROOT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-# BR2_TOOLCHAIN_SOURCE is not set
 BR2_TOOLCHAIN_EXTERNAL_PATH="$(GCCROOT)"
 BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 BR2_TOOLCHAIN_EXTERNAL_LIB_C="libc.so.0"
 BR2_TOOLCHAIN_EXTERNAL_LIBS="ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0"
 BR2_TOOLCHAIN_EXTERNAL_STRIP=y
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 4c8d50d..e16b375 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -201,19 +201,8 @@ BR2_UPDATE_CONFIG=y
 #
 # BR2_TOOLCHAIN_BUILDROOT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-# BR2_TOOLCHAIN_SOURCE is not set
 BR2_TOOLCHAIN_EXTERNAL_PATH="$(GCCROOT)"
 BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 BR2_TOOLCHAIN_EXTERNAL_LIB_C="libc.so.0"
 BR2_TOOLCHAIN_EXTERNAL_LIBS="ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0"
 BR2_TOOLCHAIN_EXTERNAL_STRIP=y
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 056a661..35eebb5 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -208,17 +208,6 @@ BR2_UPDATE_CONFIG=y
 #
 BR2_TOOLCHAIN_BUILDROOT=y
 # BR2_TOOLCHAIN_EXTERNAL is not set
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-BR2_TOOLCHAIN_SOURCE=y
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 
 #
 # Kernel Header Options
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index 1048d9c..fbd444b 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -190,17 +190,6 @@ BR2_UPDATE_CONFIG=y
 #
 # BR2_TOOLCHAIN_BUILDROOT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-# BR2_TOOLCHAIN_SOURCE is not set
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 BR2_TOOLCHAIN_EXTERNAL_LIB_C="libc.so.0"
 BR2_TOOLCHAIN_EXTERNAL_LIBS="ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0"
 BR2_TOOLCHAIN_EXTERNAL_STRIP=y
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 3436849..ab63f1e 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -209,19 +209,8 @@ BR2_UPDATE_CONFIG=y
 #
 # BR2_TOOLCHAIN_BUILDROOT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-# BR2_TOOLCHAIN_SOURCE is not set
 BR2_TOOLCHAIN_EXTERNAL_PATH="$(GCCROOT)"
 BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 BR2_TOOLCHAIN_EXTERNAL_LIB_C="libc.so.0"
 BR2_TOOLCHAIN_EXTERNAL_LIBS="ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0"
 BR2_TOOLCHAIN_EXTERNAL_STRIP=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 2af89ac..72718a5 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -211,17 +211,6 @@ BR2_UPDATE_CONFIG=y
 #
 BR2_TOOLCHAIN_BUILDROOT=y
 # BR2_TOOLCHAIN_EXTERNAL is not set
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-BR2_TOOLCHAIN_SOURCE=y
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 
 #
 # Kernel Header Options
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 7c11189..c147e54 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -193,19 +193,8 @@ BR2_UPDATE_CONFIG=y
 #
 # BR2_TOOLCHAIN_BUILDROOT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-# BR2_TOOLCHAIN_SOURCE is not set
 BR2_TOOLCHAIN_EXTERNAL_PATH="$(GCCROOT)"
 BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 BR2_TOOLCHAIN_EXTERNAL_LIB_C="libc.so.0"
 BR2_TOOLCHAIN_EXTERNAL_LIBS="ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0"
 BR2_TOOLCHAIN_EXTERNAL_STRIP=y
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index e233b94..86595e5 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -212,19 +212,8 @@ BR2_UPDATE_CONFIG=y
 #
 # BR2_TOOLCHAIN_BUILDROOT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-# BR2_TOOLCHAIN_SOURCE is not set
 BR2_TOOLCHAIN_EXTERNAL_PATH="$(GCCROOT)"
 BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 # BR2_KERNEL_HEADERS_2_4_31 is not set
 # BR2_KERNEL_HEADERS_2_6_20_4 is not set
 # BR2_KERNEL_HEADERS_2_6_20 is not set
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index d7645d9..4b08df3 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -209,17 +209,6 @@ BR2_UPDATE_CONFIG=y
 #
 BR2_TOOLCHAIN_BUILDROOT=y
 # BR2_TOOLCHAIN_EXTERNAL is not set
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-BR2_TOOLCHAIN_SOURCE=y
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 
 #
 # Kernel Header Options
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index d31b8de..4d3821f 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -192,19 +192,8 @@ BR2_UPDATE_CONFIG=y
 #
 # BR2_TOOLCHAIN_BUILDROOT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-# BR2_TOOLCHAIN_SOURCE is not set
 BR2_TOOLCHAIN_EXTERNAL_PATH="$(GCCROOT)"
 BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 BR2_TOOLCHAIN_EXTERNAL_LIB_C="libc.so.0"
 BR2_TOOLCHAIN_EXTERNAL_LIBS="ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0"
 BR2_TOOLCHAIN_EXTERNAL_STRIP=y
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index bda2149..a929c44 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -211,19 +211,8 @@ BR2_UPDATE_CONFIG=y
 #
 # BR2_TOOLCHAIN_BUILDROOT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-# BR2_TOOLCHAIN_SOURCE is not set
 BR2_TOOLCHAIN_EXTERNAL_PATH="$(GCCROOT)"
 BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 BR2_TOOLCHAIN_EXTERNAL_LIB_C="libc.so.0"
 BR2_TOOLCHAIN_EXTERNAL_LIBS="ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0"
 BR2_TOOLCHAIN_EXTERNAL_STRIP=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index ed271d8..d8fb95e 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -209,17 +209,6 @@ BR2_UPDATE_CONFIG=y
 #
 BR2_TOOLCHAIN_BUILDROOT=y
 # BR2_TOOLCHAIN_EXTERNAL is not set
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-BR2_TOOLCHAIN_SOURCE=y
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 
 #
 # Kernel Header Options
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 0b778eb..6145d7a 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -190,19 +190,8 @@ BR2_UPDATE_CONFIG=y
 #
 # BR2_TOOLCHAIN_BUILDROOT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-# BR2_TOOLCHAIN_SOURCE is not set
 BR2_TOOLCHAIN_EXTERNAL_PATH="$(GCCROOT)"
 BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 BR2_TOOLCHAIN_EXTERNAL_LIB_C="libc.so.0"
 BR2_TOOLCHAIN_EXTERNAL_LIBS="ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0"
 BR2_TOOLCHAIN_EXTERNAL_STRIP=y
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 5f5dbe2..ffd28d0 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -209,19 +209,8 @@ BR2_UPDATE_CONFIG=y
 #
 # BR2_TOOLCHAIN_BUILDROOT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-# BR2_TOOLCHAIN_SOURCE is not set
 BR2_TOOLCHAIN_EXTERNAL_PATH="$(GCCROOT)"
 BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 BR2_TOOLCHAIN_EXTERNAL_LIB_C="libc.so.0"
 BR2_TOOLCHAIN_EXTERNAL_LIBS="ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0"
 BR2_TOOLCHAIN_EXTERNAL_STRIP=y
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 0dec12e..16d8f79 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -141,18 +141,6 @@ BR2_UPDATE_CONFIG=y
 #
 BR2_TOOLCHAIN_BUILDROOT=y
 # BR2_TOOLCHAIN_EXTERNAL is not set
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-BR2_TOOLCHAIN_SOURCE=y
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
-BR2_EXT_UCLIBC_VERSION_0_9_30_1=y
 
 #
 # Kernel Header Options
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 90dce72..17b39c3 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -141,18 +141,6 @@ BR2_UPDATE_CONFIG=y
 #
 BR2_TOOLCHAIN_BUILDROOT=y
 # BR2_TOOLCHAIN_EXTERNAL is not set
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-BR2_TOOLCHAIN_SOURCE=y
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
-BR2_EXT_UCLIBC_VERSION_0_9_30_1=y
 
 #
 # Kernel Header Options
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 68b0ff6..57a81d2 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -139,17 +139,6 @@ BR2_UPDATE_CONFIG=y
 #
 BR2_TOOLCHAIN_BUILDROOT=y
 # BR2_TOOLCHAIN_EXTERNAL is not set
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-BR2_TOOLCHAIN_SOURCE=y
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 
 #
 # Kernel Header Options
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 69f16de..b676f54 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -139,17 +139,6 @@ BR2_UPDATE_CONFIG=y
 #
 BR2_TOOLCHAIN_BUILDROOT=y
 # BR2_TOOLCHAIN_EXTERNAL is not set
-# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
-BR2_TOOLCHAIN_SOURCE=y
-BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
-BR2_EXT_GCC_VERSION_4_2_2=y
-BR2_EXT_GCC_VERSION_4_2_3=y
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_BINUTILS_VERSION_2_18=y
-BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
-BR2_EXT_UCLIBC_VERSION_0_9_30=y
 
 #
 # Kernel Header Options
diff --git a/target/xtensa/defconfig b/target/xtensa/defconfig
index f7a5741..07ab10b 100644
--- a/target/xtensa/defconfig
+++ b/target/xtensa/defconfig
@@ -85,9 +85,8 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 
-## These two added by Maxim
+## Added by Maxim
 BR2_TOOLCHAIN_BUILDROOT=y
-BR2_TOOLCHAIN_SOURCE=y
 
 
 # BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
-- 
1.6.3.3
