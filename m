From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  9 Oct 2019 22:10:23 +0200
Subject: [Buildroot] [PATCH] linux: bump CIP to version v4.19.75-cip11
Message-ID: <20191009201023.28208-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bump CIP to version v4.19.75-cip11.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2760e8d69c..07e17b8573 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -35,7 +35,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.3)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.19.65-cip8)"
+	bool "Latest CIP SLTS version (v4.19.75-cip11)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -123,7 +123,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.3.4" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.19.65-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.19.75-cip11" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.17.1
