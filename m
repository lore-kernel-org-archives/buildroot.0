From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 Aug 2014 18:35:17 -0300
Subject: [Buildroot] [PATCH v2 2/2] linux: bump default to version 3.15.8
In-Reply-To: <1406928917-7068-1-git-send-email-gustavo@zacarias.com.ar>
References: <1406928917-7068-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1406928917-7068-2-git-send-email-gustavo@zacarias.com.ar>
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
index ea90260..da8a774 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -21,7 +21,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "3.15.7"
+	bool "3.15.8"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -104,7 +104,7 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.15.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "3.15.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
1.8.5.5
