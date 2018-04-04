From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  4 Apr 2018 12:34:27 -0300
Subject: [Buildroot] [PATCH 3/4] linux: bump default to version 4.16
In-Reply-To: <1522856068-17209-1-git-send-email-festevam@gmail.com>
References: <1522856068-17209-1-git-send-email-festevam@gmail.com>
Message-ID: <1522856068-17209-3-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d9c5b62863..d52af66e5c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.15)"
+	bool "Latest version (4.16)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.112-cip18)"
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.15.15" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.16" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.112-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.14.1
