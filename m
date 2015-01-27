From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 27 Jan 2015 14:11:08 -0300
Subject: [Buildroot] [PATCH 2/2] linux: bump default to version 3.18.4
In-Reply-To: <1422378668-7866-1-git-send-email-gustavo@zacarias.com.ar>
References: <1422378668-7866-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1422378668-7866-2-git-send-email-gustavo@zacarias.com.ar>
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
index 95eb87a..7b538c6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -21,7 +21,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "3.18.3"
+	bool "3.18.4"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -109,7 +109,7 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.18.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "3.18.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.0.5
