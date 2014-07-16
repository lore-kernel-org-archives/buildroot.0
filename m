From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 16 Jul 2014 15:07:04 -0300
Subject: [Buildroot] [PATCH 2/2] uboot: bump to version 2014.07
In-Reply-To: <1405534024-1923-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405534024-1923-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1405534024-1923-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/uboot/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 0f98d7f..46d1109 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2014.04"
+	bool "2014.07"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -63,7 +63,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2014.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2014.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
-- 
1.8.5.5
