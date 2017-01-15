From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 15 Jan 2017 18:24:27 -0200
Subject: [Buildroot] [PATCH v2 2/2] linux: bump default to version 4.9.4
In-Reply-To: <1484511867-357-1-git-send-email-festevam@gmail.com>
References: <1484511867-357-1-git-send-email-festevam@gmail.com>
Message-ID: <1484511867-357-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None

 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e20d0d5..f19dce1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.9.3)"
+	bool "Latest version (4.9.4)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
@@ -97,7 +97,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.9.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.9.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.7.4
