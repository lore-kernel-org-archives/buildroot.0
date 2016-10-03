From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Oct 2016 08:14:05 -0300
Subject: [Buildroot] [PATCH 2/2] linux: bump default to version 4.8
In-Reply-To: <1475493245-3573-1-git-send-email-gustavo@zacarias.com.ar>
References: <1475493245-3573-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1475493245-3573-2-git-send-email-gustavo@zacarias.com.ar>
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
index e98dc80..dd58562 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.7.6)"
+	bool "Latest version (4.8)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
@@ -97,7 +97,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.7.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.7.3
