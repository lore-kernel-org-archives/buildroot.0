From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 12 Nov 2017 20:47:08 -0200
Subject: [Buildroot] [PATCH 3/5] linux: bump default to version 4.14
In-Reply-To: <1510526830-8044-1-git-send-email-festevam@gmail.com>
References: <1510526830-8044-1-git-send-email-festevam@gmail.com>
Message-ID: <1510526830-8044-3-git-send-email-festevam@gmail.com>
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
index e90ab6b..a4977d1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.13)"
+	bool "Latest version (4.14)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.83-cip8)"
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.13.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.14" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.83-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.7.4
