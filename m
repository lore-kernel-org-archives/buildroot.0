From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 15 Jan 2020 22:41:04 +0100
Subject: [Buildroot] [PATCH 1/2] linux: bump CIP kernel to version
 4.19.94-cip18
Message-ID: <20200115214105.16033-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps Linux CIP version to 4.19.94-cip18.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 93e89a0702..b9cfcd07f8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,7 +30,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.4)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (4.19.88-cip16)"
+	bool "Latest CIP SLTS version (4.19.94-cip18)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -129,7 +129,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.4.5" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.88-cip16" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "4.19.94-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.82-cip14-rt5" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.17.1
