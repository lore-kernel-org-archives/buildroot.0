From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Feb 2016 09:53:21 -0300
Subject: [Buildroot] [PATCH 2/2] linux: bump default to version 4.4.2
In-Reply-To: <1455800001-18956-1-git-send-email-gustavo@zacarias.com.ar>
References: <1455800001-18956-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1455800001-18956-2-git-send-email-gustavo@zacarias.com.ar>
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
index 4d972e1..e7df42c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -27,7 +27,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "4.4.1"
+	bool "4.4.2"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
@@ -104,7 +104,7 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.4.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.4.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.4.10
