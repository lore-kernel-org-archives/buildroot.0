From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Sep 2017 22:10:56 +0200
Subject: [Buildroot] [git commit] uboot: bump to version 2017.09
Message-ID: <20170912201316.D6EF17FB28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=081f6826e8e2124dcc2bb4098dcd4bc07f3abcaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 2ae38e9..84b7fb4 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -38,7 +38,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2017.07"
+	bool "2017.09"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -86,7 +86,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2017.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2017.09"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 3ba8e34..82efc79 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  5374bfdc8acb9a38c025371b1ff20f45e7533668e84e685d0df5d9e7c0e4feff  u-boot-2017.07.tar.bz2
+sha256  b2d15f2cf5f72e706025cde73d67247c6da8cd35f7e10891eefe7d9095089744  u-boot-2017.09.tar.bz2
