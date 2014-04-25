From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 25 Apr 2014 15:01:10 +0400
Subject: [Buildroot] [PATCH] uboot: bump to version 2014.04
Message-ID: <1398423670-12049-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 90437b5..1c77f6a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2014.01"
+	bool "2014.04"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -63,7 +63,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2014.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2014.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
-- 
1.9.0
