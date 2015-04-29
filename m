From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Apr 2015 09:15:41 -0300
Subject: [Buildroot] [PATCH 2/2] linux: bump default to version 4.0.1
In-Reply-To: <1430309741-11007-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430309741-11007-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1430309741-11007-2-git-send-email-gustavo@zacarias.com.ar>
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
index 0ab9f26..f2d4652 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -21,7 +21,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "4.0"
+	bool "4.0.1"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -109,7 +109,7 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.0" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.0.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.0.5
