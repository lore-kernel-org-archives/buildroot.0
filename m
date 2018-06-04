From: Fabio Estevam <festevam@gmail.com>
Date: Mon,  4 Jun 2018 09:48:27 -0300
Subject: [Buildroot] [PATCH 3/4] linux: bump default to version 4.17
In-Reply-To: <1528116508-12103-1-git-send-email-festevam@gmail.com>
References: <1528116508-12103-1-git-send-email-festevam@gmail.com>
Message-ID: <1528116508-12103-3-git-send-email-festevam@gmail.com>
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
index 58d2286..07888e2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,7 +30,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.16)"
+	bool "Latest version (4.17)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.130-cip23)"
@@ -120,7 +120,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.16.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.17" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.130-cip23" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.7.4
