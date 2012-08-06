From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 14:56:08 +0200
Subject: [Buildroot] [git commit] package/crosstool-ng: update to 1.16.0
Message-ID: <20120806125631.480A597020@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69bd4566611f2fa2b3cde86b121a3b846a5ab1a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/crosstool-ng/crosstool-ng.mk               |    2 +-
 .../crosstool-ng.config-eglibc                     |   29 +++++++++------
 .../crosstool-ng.config-glibc                      |   28 +++++++++------
 .../crosstool-ng.config-uClibc                     |   39 +++++++++++---------
 4 files changed, 58 insertions(+), 40 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 379d400..5bc65e1 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,4 +1,4 @@
-CROSSTOOL_NG_VERSION           = 1.15.3
+CROSSTOOL_NG_VERSION           = 1.16.0
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_TARGET    = NO
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index 58cdff2..6c55921 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG 1.15.0 Configuration
-# Mon May  7 18:54:54 2012
+# crosstool-NG 1.16.0 Configuration
+# Sun Aug  5 20:02:42 2012
 #
 CT_CONFIGURE_has_xz=y
 CT_CONFIGURE_has_cvs=y
@@ -178,17 +178,15 @@ CT_BUILD_SUFFIX=""
 #
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="3.3.4"
+CT_KERNEL_VERSION="3.5"
 CT_KERNEL_linux=y
 CT_KERNEL_linux_AVAILABLE=y
-CT_KERNEL_V_3_3_4=y
-# CT_KERNEL_V_3_3_3 is not set
-# CT_KERNEL_V_3_3_2 is not set
-# CT_KERNEL_V_3_3_1 is not set
-# CT_KERNEL_V_3_3 is not set
-# CT_KERNEL_V_3_2_16 is not set
+CT_KERNEL_V_3_5=y
+# CT_KERNEL_V_3_4_7 is not set
+# CT_KERNEL_V_3_3_8 is not set
+# CT_KERNEL_V_3_2_25 is not set
 # CT_KERNEL_V_3_1_10 is not set
-# CT_KERNEL_V_3_0_30 is not set
+# CT_KERNEL_V_3_0_39 is not set
 # CT_KERNEL_V_2_6_39_4 is not set
 # CT_KERNEL_V_2_6_38_8 is not set
 # CT_KERNEL_V_2_6_37_6 is not set
@@ -326,6 +324,7 @@ CT_LIBC="eglibc"
 CT_LIBC_VERSION="2_12"
 CT_LIBC_eglibc=y
 CT_LIBC_eglibc_AVAILABLE=y
+# CT_LIBC_EGLIBC_V_2_16 is not set
 # CT_LIBC_EGLIBC_V_2_15 is not set
 # CT_LIBC_EGLIBC_V_2_14 is not set
 # CT_LIBC_EGLIBC_V_2_13 is not set
@@ -394,7 +393,7 @@ CT_LIBC_ADDONS_LIST=""
 # CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
 CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
 # CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
-CT_LIBC_GLIBC_MIN_KERNEL="3.3.4"
+CT_LIBC_GLIBC_MIN_KERNEL="3.5"
 
 #
 # Debug facilities
@@ -414,17 +413,25 @@ CT_GMP=y
 CT_MPFR=y
 CT_PPL=y
 CT_CLOOG=y
+# CT_GMP_V_5_0_2 is not set
+# CT_GMP_V_5_0_1 is not set
 CT_GMP_V_4_3_2=y
 # CT_GMP_V_4_3_1 is not set
 # CT_GMP_V_4_3_0 is not set
 CT_GMP_VERSION="4.3.2"
+# CT_MPFR_V_3_1_0 is not set
+# CT_MPFR_V_3_0_1 is not set
 # CT_MPFR_V_3_0_0 is not set
 CT_MPFR_V_2_4_2=y
 # CT_MPFR_V_2_4_1 is not set
 # CT_MPFR_V_2_4_0 is not set
 CT_MPFR_VERSION="2.4.2"
+# CT_PPL_V_0_11_2 is not set
+# CT_PPL_V_0_11_1 is not set
+# CT_PPL_V_0_11 is not set
 CT_PPL_V_0_10_2=y
 CT_PPL_VERSION="0.10.2"
+# CT_CLOOG_V_0_15_11 is not set
 # CT_CLOOG_V_0_15_10 is not set
 CT_CLOOG_V_0_15_9=y
 # CT_CLOOG_V_0_15_8 is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index db724ab..3910bdb 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG 1.15.0 Configuration
-# Mon May  7 18:58:51 2012
+# crosstool-NG 1.16.0 Configuration
+# Sun Aug  5 21:39:12 2012
 #
 CT_CONFIGURE_has_xz=y
 CT_CONFIGURE_has_cvs=y
@@ -178,17 +178,15 @@ CT_BUILD_SUFFIX=""
 #
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="3.3.4"
+CT_KERNEL_VERSION="3.5"
 CT_KERNEL_linux=y
 CT_KERNEL_linux_AVAILABLE=y
-CT_KERNEL_V_3_3_4=y
-# CT_KERNEL_V_3_3_3 is not set
-# CT_KERNEL_V_3_3_2 is not set
-# CT_KERNEL_V_3_3_1 is not set
-# CT_KERNEL_V_3_3 is not set
-# CT_KERNEL_V_3_2_16 is not set
+CT_KERNEL_V_3_5=y
+# CT_KERNEL_V_3_4_7 is not set
+# CT_KERNEL_V_3_3_8 is not set
+# CT_KERNEL_V_3_2_25 is not set
 # CT_KERNEL_V_3_1_10 is not set
-# CT_KERNEL_V_3_0_30 is not set
+# CT_KERNEL_V_3_0_39 is not set
 # CT_KERNEL_V_2_6_39_4 is not set
 # CT_KERNEL_V_2_6_38_8 is not set
 # CT_KERNEL_V_2_6_37_6 is not set
@@ -361,7 +359,7 @@ CT_LIBC_ADDONS_LIST=""
 # CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
 CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
 # CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
-CT_LIBC_GLIBC_MIN_KERNEL="3.3.4"
+CT_LIBC_GLIBC_MIN_KERNEL="3.5"
 
 #
 # glibc other options
@@ -405,17 +403,25 @@ CT_GMP=y
 CT_MPFR=y
 CT_PPL=y
 CT_CLOOG=y
+# CT_GMP_V_5_0_2 is not set
+# CT_GMP_V_5_0_1 is not set
 CT_GMP_V_4_3_2=y
 # CT_GMP_V_4_3_1 is not set
 # CT_GMP_V_4_3_0 is not set
 CT_GMP_VERSION="4.3.2"
+# CT_MPFR_V_3_1_0 is not set
+# CT_MPFR_V_3_0_1 is not set
 # CT_MPFR_V_3_0_0 is not set
 CT_MPFR_V_2_4_2=y
 # CT_MPFR_V_2_4_1 is not set
 # CT_MPFR_V_2_4_0 is not set
 CT_MPFR_VERSION="2.4.2"
+# CT_PPL_V_0_11_2 is not set
+# CT_PPL_V_0_11_1 is not set
+# CT_PPL_V_0_11 is not set
 CT_PPL_V_0_10_2=y
 CT_PPL_VERSION="0.10.2"
+# CT_CLOOG_V_0_15_11 is not set
 # CT_CLOOG_V_0_15_10 is not set
 CT_CLOOG_V_0_15_9=y
 # CT_CLOOG_V_0_15_8 is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index 5f1ee7e..5155e6c 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG 1.15.0 Configuration
-# Mon May  7 18:49:59 2012
+# crosstool-NG 1.16.0 Configuration
+# Sun Aug  5 17:33:46 2012
 #
 CT_CONFIGURE_has_xz=y
 CT_CONFIGURE_has_cvs=y
@@ -178,17 +178,15 @@ CT_BUILD_SUFFIX=""
 #
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="3.3.4"
+CT_KERNEL_VERSION="3.5"
 CT_KERNEL_linux=y
 CT_KERNEL_linux_AVAILABLE=y
-CT_KERNEL_V_3_3_4=y
-# CT_KERNEL_V_3_3_3 is not set
-# CT_KERNEL_V_3_3_2 is not set
-# CT_KERNEL_V_3_3_1 is not set
-# CT_KERNEL_V_3_3 is not set
-# CT_KERNEL_V_3_2_16 is not set
+CT_KERNEL_V_3_5=y
+# CT_KERNEL_V_3_4_7 is not set
+# CT_KERNEL_V_3_3_8 is not set
+# CT_KERNEL_V_3_2_25 is not set
 # CT_KERNEL_V_3_1_10 is not set
-# CT_KERNEL_V_3_0_30 is not set
+# CT_KERNEL_V_3_0_39 is not set
 # CT_KERNEL_V_2_6_39_4 is not set
 # CT_KERNEL_V_2_6_38_8 is not set
 # CT_KERNEL_V_2_6_37_6 is not set
@@ -322,10 +320,11 @@ CT_CC_GCC_LDBL_128=m
 # C-library
 #
 CT_LIBC="uClibc"
-CT_LIBC_VERSION="0.9.33.1"
+CT_LIBC_VERSION="0.9.33.2"
 CT_LIBC_uClibc=y
 CT_LIBC_uClibc_AVAILABLE=y
-# CT_LIBC_UCLIBC_V_0_9_33_1=y
+CT_LIBC_UCLIBC_V_0_9_33_2=y
+# CT_LIBC_UCLIBC_V_0_9_33_1 is not set
 # CT_LIBC_UCLIBC_V_0_9_33 is not set
 # CT_LIBC_UCLIBC_V_0_9_32_1 is not set
 # CT_LIBC_UCLIBC_V_0_9_32 is not set
@@ -350,7 +349,7 @@ CT_LIBC_SUPPORT_THREADS_ANY=y
 CT_LIBC_SUPPORT_NPTL=y
 CT_LIBC_SUPPORT_LINUXTHREADS=y
 CT_LIBC_SUPPORT_THREADS_NONE=y
-CT_THREADS="linuxthreads"
+CT_THREADS="nptl"
 
 #
 # Common C library options
@@ -363,11 +362,9 @@ CT_LIBC_XLDD=y
 #
 # uClibc other options
 #
-CT_LIBC_UCLIBC_LNXTHRD_OLD=y
-# CT_LIBC_UCLIBC_LNXTHRD_NEW is not set
-CT_LIBC_UCLIBC_LNXTHRD="old"
+CT_LIBC_UCLIBC_LNXTHRD=""
 # CT_LIBC_UCLIBC_LOCALES is not set
-# CT_LIBC_UCLIBC_WCHAR is not set
+CT_LIBC_UCLIBC_WCHAR=y
 
 #
 # Debug facilities
@@ -387,17 +384,25 @@ CT_GMP=y
 CT_MPFR=y
 CT_PPL=y
 CT_CLOOG=y
+# CT_GMP_V_5_0_2 is not set
+# CT_GMP_V_5_0_1 is not set
 CT_GMP_V_4_3_2=y
 # CT_GMP_V_4_3_1 is not set
 # CT_GMP_V_4_3_0 is not set
 CT_GMP_VERSION="4.3.2"
+# CT_MPFR_V_3_1_0 is not set
+# CT_MPFR_V_3_0_1 is not set
 # CT_MPFR_V_3_0_0 is not set
 CT_MPFR_V_2_4_2=y
 # CT_MPFR_V_2_4_1 is not set
 # CT_MPFR_V_2_4_0 is not set
 CT_MPFR_VERSION="2.4.2"
+# CT_PPL_V_0_11_2 is not set
+# CT_PPL_V_0_11_1 is not set
+# CT_PPL_V_0_11 is not set
 CT_PPL_V_0_10_2=y
 CT_PPL_VERSION="0.10.2"
+# CT_CLOOG_V_0_15_11 is not set
 # CT_CLOOG_V_0_15_10 is not set
 CT_CLOOG_V_0_15_9=y
 # CT_CLOOG_V_0_15_8 is not set
