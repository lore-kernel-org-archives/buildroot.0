From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 May 2013 12:47:46 +0200
Subject: [Buildroot] [git commit] linux: bump 3.9.x stable version
Message-ID: <20130508112314.063A699E6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78ebe9cad85f862929f1b1f57feff715263991f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 586db47..53adfcd 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -21,7 +21,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "3.9"
+	bool "3.9.1"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -76,7 +76,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "3.9.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
