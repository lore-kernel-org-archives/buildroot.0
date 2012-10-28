From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 28 Oct 2012 20:57:49 -0300
Subject: [Buildroot] [PATCH 2/2] linux: bump 3.6.x stable version
In-Reply-To: <1351468669-9669-1-git-send-email-gustavo@zacarias.com.ar>
References: <1351468669-9669-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1351468669-9669-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index aa25f89..a849849 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -21,7 +21,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_3_6
-	bool "3.6.3"
+	bool "3.6.4"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -76,7 +76,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.6.3" if BR2_LINUX_KERNEL_3_6
+	default "3.6.4" if BR2_LINUX_KERNEL_3_6
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.8.6
