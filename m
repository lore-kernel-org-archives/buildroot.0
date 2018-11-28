From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 28 Nov 2018 23:44:12 +0100
Subject: [Buildroot] [PATCH] linux: bump CIP to version v4.4.154-cip28
Message-ID: <20181128224412.11676-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps the Linux CIP kernel to version v4.4.154-cip28

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 85e540754a..efce31c7e1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -33,7 +33,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.18)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.138-cip25)"
+	bool "Latest CIP SLTS version (v4.4.154-cip28)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -121,7 +121,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.18.20" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.138-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.154-cip28" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.17.1
