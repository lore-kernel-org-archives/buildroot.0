From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Jul 2011 22:11:09 +0200
Subject: [Buildroot] [git commit] linux: bump 2.6.39.x stable version
Message-ID: <20110710201144.0043E8A422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a315ee3c662cfb9165ee959aa78b86f61177d6a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index bdfa5b7..bf16ddf 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -22,7 +22,7 @@ choice
 	default BR2_LINUX_KERNEL_2_6_39
 
 config BR2_LINUX_KERNEL_2_6_39
-	bool "2.6.39.2"
+	bool "2.6.39.3"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -52,7 +52,7 @@ endchoice
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
 	string "Kernel version"
 	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION
-	default "2.6.39.2"
+	default "2.6.39.3"
 
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
@@ -60,7 +60,7 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "2.6.39.2" if BR2_LINUX_KERNEL_2_6_39
+	default "2.6.39.3" if BR2_LINUX_KERNEL_2_6_39
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.3.4
