From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Jan 2017 10:42:49 -0300
Subject: [Buildroot] [PATCH 2/2] linux: bump default to version 4.9.3
In-Reply-To: <20170113134249.25688-1-gustavo@zacarias.com.ar>
References: <20170113134249.25688-1-gustavo@zacarias.com.ar>
Message-ID: <20170113134249.25688-2-gustavo@zacarias.com.ar>
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
index e8181c8..e20d0d5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.9.2)"
+	bool "Latest version (4.9.3)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
@@ -97,7 +97,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.9.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.9.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.10.2
