From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jan 2016 22:59:48 +0100
Subject: [Buildroot] [git commit] boot/uboot: bump to version 2016.01
Message-ID: <20160117220214.92AE580172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37e18851fa6ee65df6570e69296a2a83f2467ad6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index b75006b..dde4710 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -38,7 +38,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2015.10"
+	bool "2016.01"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -83,7 +83,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2015.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2016.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index b1d8ba0..31b0db9 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  bdc68d5f9455ad933b059c735d983f2c8b6b552dafb062e5ff1444f623021955  u-boot-2015.10.tar.bz2
+sha256  e5792fba9399d9804aa2ef667f14ff771e2cdece72367d340250265bf095a5d5  u-boot-2016.01.tar.bz2
