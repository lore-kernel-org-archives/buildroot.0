From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  1 Dec 2013 21:26:57 -0300
Subject: [Buildroot] [PATCH 2/3] linux: bump to version 3.12.2
In-Reply-To: <1385944018-16647-1-git-send-email-gustavo@zacarias.com.ar>
References: <1385944018-16647-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1385944018-16647-2-git-send-email-gustavo@zacarias.com.ar>
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
index 3061809..9479b7a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -21,7 +21,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "3.12.1"
+	bool "3.12.2"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -87,7 +87,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.12.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "3.12.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
1.8.3.2
