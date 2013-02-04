From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Feb 2013 07:50:15 -0300
Subject: [Buildroot] [PATCH 2/2] linux: bump 3.7.x stable version
In-Reply-To: <1359975015-8369-1-git-send-email-gustavo@zacarias.com.ar>
References: <1359975015-8369-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1359975015-8369-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 78b7b0c..3c50acc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -21,7 +21,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_3_7
-	bool "3.7.5"
+	bool "3.7.6"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -76,7 +76,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.7.5" if BR2_LINUX_KERNEL_3_7
+	default "3.7.6" if BR2_LINUX_KERNEL_3_7
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.12.4
