From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Feb 2013 12:16:53 -0300
Subject: [Buildroot] [PATCH 2/3] linux: bump to 3.8.x series
In-Reply-To: <1361459814-15294-1-git-send-email-gustavo@zacarias.com.ar>
References: <1361459814-15294-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1361459814-15294-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f48e660..0c39e0c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -20,8 +20,8 @@ if BR2_LINUX_KERNEL
 choice
 	prompt "Kernel version"
 
-config BR2_LINUX_KERNEL_3_7
-	bool "3.7.8"
+config BR2_LINUX_KERNEL_3_8
+	bool "3.8"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -76,7 +76,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.7.8" if BR2_LINUX_KERNEL_3_7
+	default "3.8" if BR2_LINUX_KERNEL_3_8
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.12.4
