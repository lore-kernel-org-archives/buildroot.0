From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  8 Aug 2017 15:18:29 +0200
Subject: [Buildroot] [PATCH] linux: bump cip version to v4.4.75-cip6
Message-ID: <1502198309-10016-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1622f01..59cb3af 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -29,7 +29,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.12.4)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.55-cip3)"
+	bool "Latest CIP SLTS version (v4.4.75-cip6)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -117,7 +117,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.12.4" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.55-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.75-cip6" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.7.4
