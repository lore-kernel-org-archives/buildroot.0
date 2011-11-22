From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Nov 2011 23:14:47 -0300
Subject: [Buildroot] [PATCH 2/2] linux: update stable kernel to 3.1.2
In-Reply-To: <1321928087-25965-1-git-send-email-gustavo@zacarias.com.ar>
References: <1321928087-25965-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1321928087-25965-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c304d86..591ab3d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -22,7 +22,7 @@ choice
 	default BR2_LINUX_KERNEL_3_1
 
 config BR2_LINUX_KERNEL_3_1
-	bool "3.1.1"
+	bool "3.1.2"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -58,7 +58,7 @@ endchoice
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
 	string "Kernel version"
 	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION
-	default "3.1.1"
+	default "3.1.2"
 
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
@@ -74,7 +74,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.1.1" if BR2_LINUX_KERNEL_3_1
+	default "3.1.2" if BR2_LINUX_KERNEL_3_1
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.3.4
