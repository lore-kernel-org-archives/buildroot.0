From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Feb 2017 16:23:09 -0300
Subject: [Buildroot] [PATCH master 2/2] linux: bump default to version 4.9.11
In-Reply-To: <20170223192309.15435-1-gustavo@zacarias.com.ar>
References: <20170223192309.15435-1-gustavo@zacarias.com.ar>
Message-ID: <20170223192309.15435-2-gustavo@zacarias.com.ar>
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
index 95ccfb3..1d375dd 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.9.10)"
+	bool "Latest version (4.9.11)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
@@ -97,7 +97,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.9.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.9.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.10.2
