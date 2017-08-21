From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Mon, 21 Aug 2017 15:28:22 -0300
Subject: [Buildroot] [PATCH 1/2] linux: bump default to version 4.12.8
Message-ID: <1503340103-8124-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 00613b2..38c8129 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.12.5)"
+	bool "Latest version (4.12.8)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.75-cip6)"
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.12.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.12.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.75-cip6" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.7.4
