From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 24 Apr 2019 11:36:54 +0200
Subject: [Buildroot] [PATCH] linux: bump Linux CIP to version v4.4.176-cip31
Message-ID: <1556098614-18269-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps the Linux CIP version to v4.4.176-cip31.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d683aa9..8013f2b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -34,7 +34,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.0)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.171-cip30)"
+	bool "Latest CIP SLTS version (v4.4.176-cip31)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -122,7 +122,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.0.7" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.171-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.7.4
