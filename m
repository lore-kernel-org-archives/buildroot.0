From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Apr 2010 21:10:35 +0200
Subject: [Buildroot] [git commit master] Update defconfigs after
	BR2_ENABLE_LOCALE_PREGENERATED removal
Message-ID: <20100411195037.F331520B98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4ca8e41a7665c5260052cb1789eac63b981525d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_toolchain_defconfig  |    1 -
 configs/at91rm9200df_defconfig   |    1 -
 configs/at91sam9260dfc_defconfig |    1 -
 configs/at91sam9261ek_defconfig  |    1 -
 configs/at91sam9263ek_defconfig  |    1 -
 configs/at91sam9g20dfc_defconfig |    1 -
 configs/atngw100_defconfig       |    1 -
 configs/atstk1005_defconfig      |    1 -
 configs/atstk100x_defconfig      |    1 -
 configs/i386_defconfig           |    1 -
 configs/i686_defconfig           |    1 -
 11 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index eabc094..fa1a442 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -277,7 +277,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 BR2_USE_WCHAR=y
 # BR2_SOFT_FLOAT is not set
 # BR2_PTHREADS_NONE is not set
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 0d34dc7..fe4f44b 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -292,7 +292,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 BR2_USE_WCHAR=y
 # BR2_SOFT_FLOAT is not set
 # BR2_PTHREADS_NONE is not set
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index cd03fed..900f283 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -233,7 +233,6 @@ BR2_UCLIBC_VERSION_0_9_30=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_PTHREADS_NONE is not set
 # BR2_PTHREADS is not set
 BR2_PTHREADS_OLD=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 191f141..091a72e 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -236,7 +236,6 @@ BR2_UCLIBC_VERSION_0_9_30=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_PTHREADS_NONE is not set
 # BR2_PTHREADS is not set
 BR2_PTHREADS_OLD=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 2e8147b..7252473 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -297,7 +297,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 BR2_USE_WCHAR=y
 # BR2_SOFT_FLOAT is not set
 # BR2_PTHREADS_NONE is not set
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 4b00d49..d03cfb5 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -297,7 +297,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 BR2_USE_WCHAR=y
 # BR2_SOFT_FLOAT is not set
 # BR2_PTHREADS_NONE is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index cb456f6..7655bc6 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -231,7 +231,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_ENABLE_LOCALE_PURGE is not set
 BR2_USE_WCHAR=y
 BR2_SOFT_FLOAT=y
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 998f2f9..92b5911 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -238,7 +238,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 BR2_USE_WCHAR=y
 BR2_SOFT_FLOAT=y
 # BR2_PTHREADS_NONE is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 87d2f01..e969073 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -232,7 +232,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_ENABLE_LOCALE_PURGE is not set
 BR2_USE_WCHAR=y
 BR2_SOFT_FLOAT=y
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index c65aa99..d3ba527 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -231,7 +231,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_ENABLE_LOCALE_PURGE is not set
 BR2_USE_WCHAR=y
 # BR2_USE_SSP is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 7634b26..dc24c99 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -231,7 +231,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_ENABLE_LOCALE_PURGE is not set
 BR2_USE_WCHAR=y
 # BR2_USE_SSP is not set
-- 
1.6.3.3
