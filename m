From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 24 Sep 2016 12:33:01 -0300
Subject: [Buildroot] [PATCH 1/3]  boot/uboot: bump to version 2016.09.01
Message-ID: <1474731183-14968-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

2016.09.01 is a bugfix release, so bump to this version.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f6d30d9..d46a757 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -38,7 +38,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2016.09"
+	bool "2016.09.01"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -86,7 +86,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2016.09"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2016.09.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 6870d68..db60dab 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  994e7b9e0e350d9f91f5892d5e5bff00d3714a4962f520f78a64a461ef950ba9  u-boot-2016.09.tar.bz2
+sha256  95728e89dd476d17428f94080752ab48884be477b6a678941582aeef618b70bb  u-boot-2016.09.01.tar.bz2
-- 
2.7.4
