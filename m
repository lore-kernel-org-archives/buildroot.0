From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 20 Nov 2019 19:58:54 +0100
Subject: [Buildroot] [PATCH 2/2] linux: bump to version 4.19.82-cip14
In-Reply-To: <20191120185854.23820-1-angelo@amarulasolutions.com>
References: <20191120185854.23820-1-angelo@amarulasolutions.com>
Message-ID: <20191120185854.23820-2-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps Linux CIP version to 4.19.82-cip14.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 923d67fb57..b3915be6c4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -35,7 +35,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.3)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (4.19.75-cip11)"
+	bool "Latest CIP SLTS version (4.19.82-cip14)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -123,7 +123,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.3.11" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.75-cip11" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "4.19.82-cip14" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.17.1
