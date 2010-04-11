From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:17 +0200
Subject: [Buildroot] [PATCH 21/25] Update defconfigs after
	BR2_ENABLE_LOCALE_PREGENERATED removal
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <dbd368aac5b27cef77cca9a3e43ee3096c161818.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
index b13bccd..529a363 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -276,7 +276,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 BR2_USE_WCHAR=y
 # BR2_SOFT_FLOAT is not set
 # BR2_PTHREADS_NONE is not set
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 8a643c2..e4c0b0e 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -291,7 +291,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 BR2_USE_WCHAR=y
 # BR2_SOFT_FLOAT is not set
 # BR2_PTHREADS_NONE is not set
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 776fcac..8fb7f0e 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -232,7 +232,6 @@ BR2_UCLIBC_VERSION_0_9_30=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_PTHREADS_NONE is not set
 # BR2_PTHREADS is not set
 BR2_PTHREADS_OLD=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index a6b38f8..73fc09c 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -235,7 +235,6 @@ BR2_UCLIBC_VERSION_0_9_30=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_PTHREADS_NONE is not set
 # BR2_PTHREADS is not set
 BR2_PTHREADS_OLD=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index cd6bcd2..cdbeaa3 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -296,7 +296,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 BR2_USE_WCHAR=y
 # BR2_SOFT_FLOAT is not set
 # BR2_PTHREADS_NONE is not set
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 0b7da36..710639b 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -296,7 +296,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 BR2_USE_WCHAR=y
 # BR2_SOFT_FLOAT is not set
 # BR2_PTHREADS_NONE is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 36c6745..367bcdc 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -230,7 +230,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_ENABLE_LOCALE_PURGE is not set
 BR2_USE_WCHAR=y
 BR2_SOFT_FLOAT=y
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index ee147a4..50e013e 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -237,7 +237,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 BR2_USE_WCHAR=y
 BR2_SOFT_FLOAT=y
 # BR2_PTHREADS_NONE is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 36fcc75..df30b05 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -231,7 +231,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_ENABLE_LOCALE_PURGE is not set
 BR2_USE_WCHAR=y
 BR2_SOFT_FLOAT=y
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 38cfb17..284afc6 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -230,7 +230,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_ENABLE_LOCALE_PURGE is not set
 BR2_USE_WCHAR=y
 # BR2_USE_SSP is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 361b181..87c3512 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -230,7 +230,6 @@ BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_ENABLE_LOCALE_PURGE is not set
 BR2_USE_WCHAR=y
 # BR2_USE_SSP is not set
-- 
1.6.3.3
