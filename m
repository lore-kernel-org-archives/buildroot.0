From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  7 Aug 2017 08:19:03 +0200
Subject: [Buildroot] [PATCH 2/2] linux: bump default to version 4.12.5
In-Reply-To: <20170807061903.22333-1-bernd.kuhls@t-online.de>
References: <20170807061903.22333-1-bernd.kuhls@t-online.de>
Message-ID: <20170807061903.22333-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1622f0196..ae47e3f10 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.12.4)"
+	bool "Latest version (4.12.5)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.55-cip3)"
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.12.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.12.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.55-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.11.0
