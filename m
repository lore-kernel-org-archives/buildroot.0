From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 May 2016 08:58:14 -0300
Subject: [Buildroot] [PATCH 3/3] linux: bump default to version 4.6
In-Reply-To: <1463399894-9649-1-git-send-email-gustavo@zacarias.com.ar>
References: <1463399894-9649-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1463399894-9649-3-git-send-email-gustavo@zacarias.com.ar>
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
index ff62bcf..45c7d3b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -27,7 +27,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.5.4)"
+	bool "Latest version (4.6)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
@@ -110,7 +110,7 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.5.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.7.3
