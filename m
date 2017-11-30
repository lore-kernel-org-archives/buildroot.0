From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu, 30 Nov 2017 21:54:05 +0100
Subject: [Buildroot] [PATCH] linux: bump Linux CIP to v4.4.98-cip13
Message-ID: <1512075245-18022-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bump the Linux CIP kernel to version v4.4.98-cip13

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 41f039e..79070ad 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -29,7 +29,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.13)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.83-cip8)"
+	bool "Latest CIP SLTS version (v4.4.98-cip13)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -117,7 +117,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.13.16" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.83-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.98-cip13" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.7.4
