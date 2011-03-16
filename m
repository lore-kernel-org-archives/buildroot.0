From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Mar 2011 22:28:13 +0100
Subject: [Buildroot] [git commit master 1/1] uClibc: bump 0.9.32-rc version
Message-ID: <20110316212905.62F07909B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b922f6404dfc64259077f1ef7b7f545b99397413
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To -rc3 and update defconfig to match.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/Config.in            |    4 ++--
 toolchain/uClibc/uClibc-0.9.32.config |    2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 3b31900..c264ba2 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -21,7 +21,7 @@ choice
 		bool "uClibc 0.9.31.x"
 
 	config BR2_UCLIBC_VERSION_0_9_32
-		bool "uClibc 0.9.32-rc2"
+		bool "uClibc 0.9.32-rc3"
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
@@ -40,7 +40,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.29		if BR2_UCLIBC_VERSION_0_9_29
 	default 0.9.30.3	if BR2_UCLIBC_VERSION_0_9_30
 	default 0.9.31		if BR2_UCLIBC_VERSION_0_9_31
-	default 0.9.32-rc2	if BR2_UCLIBC_VERSION_0_9_32
+	default 0.9.32-rc3	if BR2_UCLIBC_VERSION_0_9_32
 	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
diff --git a/toolchain/uClibc/uClibc-0.9.32.config b/toolchain/uClibc/uClibc-0.9.32.config
index 9c83d68..aa00680 100644
--- a/toolchain/uClibc/uClibc-0.9.32.config
+++ b/toolchain/uClibc/uClibc-0.9.32.config
@@ -28,6 +28,7 @@
 # TARGET_vax is not set
 # TARGET_x86_64 is not set
 # TARGET_xtensa is not set
+# TARGET_c6x is not set
 
 # CONFIG_GENERIC_ARM is not set
 # CONFIG_ARM610 is not set
@@ -109,6 +110,7 @@ UCLIBC_DYNAMIC_ATEXIT=y
 UCLIBC_SUSV3_LEGACY=y
 # UCLIBC_SUSV3_LEGACY_MACROS is not set
 UCLIBC_SUSV4_LEGACY=y
+# UCLIBC_STRICT_HEADERS is not set
 # UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
 # UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
-- 
1.7.3.4
