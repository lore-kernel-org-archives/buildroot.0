From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Sep 2010 19:38:42 +0200
Subject: [Buildroot] [git commit master 1/1] configs/i?86_defconfig: fix
	uClibc version / config file
Message-ID: <20100921173954.461B18B5C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6b899a43bae232b80eb57dfb6e373dc3971f8fed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported on the list.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/i386_defconfig |    6 +++---
 configs/i686_defconfig |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 2e1bf06..672b694 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -151,10 +151,10 @@ BR2_DEFAULT_KERNEL_HEADERS="2.6.29.2"
 #
 # BR2_UCLIBC_VERSION_0_9_29 is not set
 # BR2_UCLIBC_VERSION_0_9_30 is not set
-BR2_UCLIBC_VERSION_0_9_30_1=y
+BR2_UCLIBC_VERSION_0_9_31=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
-BR2_UCLIBC_VERSION_STRING="0.9.30.1"
-BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
+BR2_UCLIBC_VERSION_STRING="0.9.31"
+BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config"
 # BR2_PTHREAD_DEBUG is not set
 # BR2_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index fe249fa..5b1b56f 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -151,10 +151,10 @@ BR2_DEFAULT_KERNEL_HEADERS="2.6.29.2"
 #
 # BR2_UCLIBC_VERSION_0_9_29 is not set
 # BR2_UCLIBC_VERSION_0_9_30 is not set
-BR2_UCLIBC_VERSION_0_9_30_1=y
+BR2_UCLIBC_VERSION_0_9_31=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
-BR2_UCLIBC_VERSION_STRING="0.9.30.1"
-BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
+BR2_UCLIBC_VERSION_STRING="0.9.31"
+BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config"
 # BR2_PTHREAD_DEBUG is not set
 # BR2_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
-- 
1.7.1
