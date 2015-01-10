From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 10 Jan 2015 14:47:25 +0100
Subject: [Buildroot] [PATCH v2 6/8] docs/manual/customize-configuration.txt:
	Add uboot documentation
In-Reply-To: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
References: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
Message-ID: <1420897647-25001-7-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based on the Barebox documentation text.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v1 -> v2:
  - None
---
 docs/manual/customize-configuration.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/manual/customize-configuration.txt b/docs/manual/customize-configuration.txt
index 6224d40..a3f348d 100644
--- a/docs/manual/customize-configuration.txt
+++ b/docs/manual/customize-configuration.txt
@@ -24,8 +24,8 @@ Alternatively, you can copy the file to any other place and rebuild with
 [[customize-store-package-config]]
 === Storing the configuration of other components
 
-The configuration files for BusyBox, the Linux kernel, Barebox and
-uClibc should be stored as well if changed. For each of these
+The configuration files for BusyBox, the Linux kernel, Barebox, U-Boot
+and uClibc should be stored as well if changed. For each of these
 components, a Buildroot configuration option exists to point to an input
 configuration file, e.g. +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+. To store
 their configuration, set these configuration options to a path where you
@@ -56,7 +56,7 @@ configuration files easier.
   path specified by +BR2_UCLIBC_CONFIG+.
 * +make barebox-update-defconfig+ saves the barebox configuration to the
   path specified by +BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE+.
+* +make uboot-update-defconfig+ saves the uboot configuration to the
+  path specified by +BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE+.
 * For at91bootstrap3, no helper exists so you have to copy the config
   file manually to +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+.
-
-
-- 
2.2.1
