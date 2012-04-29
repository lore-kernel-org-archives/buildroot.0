From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Apr 2012 10:56:44 +0200
Subject: [Buildroot] [git commit] linux: bump default to kernel version 3.3.3
Message-ID: <20120429090502.4FD4996C08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a1e6efafef5db2ab1cfc151c4f38b37be7c540c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5a2d287..945059d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -22,7 +22,7 @@ choice
 	default BR2_LINUX_KERNEL_3_3
 
 config BR2_LINUX_KERNEL_3_3
-	bool "3.3.1"
+	bool "3.3.3"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -73,7 +73,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.3.1" if BR2_LINUX_KERNEL_3_3
+	default "3.3.3" if BR2_LINUX_KERNEL_3_3
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
