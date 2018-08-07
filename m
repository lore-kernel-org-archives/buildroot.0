From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  7 Aug 2018 08:53:53 +0200
Subject: [Buildroot] [PATCH] linux: bump CIP to version v4.4.138-cip25
Message-ID: <1533624833-27416-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps the CIP Linux kernel to version v4.4.138-cip25

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d30489e..11ccf31 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -33,7 +33,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.17)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.130-cip23)"
+	bool "Latest CIP SLTS version (v4.4.138-cip25)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -121,7 +121,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.17.11" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.130-cip23" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.138-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.7.4
