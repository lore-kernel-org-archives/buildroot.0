From: Fabio Estevam <festevam@gmail.com>
Date: Mon,  7 May 2018 17:44:00 -0300
Subject: [Buildroot] [PATCH 1/3] uboot: bump to version 2018.05
Message-ID: <1525725842-3078-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 95c17e3..482711c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -39,7 +39,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2018.03"
+	bool "2018.05"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -87,7 +87,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2018.03"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2018.05"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 788c169..17840d8 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  7e7477534409d5368eb1371ffde6820f0f79780a1a1f676161c48442cb303dfd  u-boot-2018.03.tar.bz2
+sha256  4da13c2a6139a78cc08608f21fd4741db27eda336cfad7ab8264fda923b9c048  u-boot-2018.05.tar.bz2
-- 
2.7.4
