From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 15:45:58 +0200
Subject: [Buildroot] [git commit] boot/uboot: bump to version 2019.07
Message-ID: <20190714134430.EC892817BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3039498995245fbd2a7c407332b9b9a539c90942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://lists.denx.de/pipermail/u-boot/2019-July/375451.html

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 33b7e67ff7..1aa29a7d92 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -39,7 +39,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2019.01"
+	bool "2019.07"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -87,7 +87,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2019.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2019.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index df2b8caf89..d83dc062a2 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  50bd7e5a466ab828914d080d5f6a432345b500e8fba1ad3b7b61e95e60d51c22  u-boot-2019.01.tar.bz2
+sha256  bff4fa77e8da17521c030ca4c5b947a056c1b1be4d3e6ee8637020b8d50251d0  u-boot-2019.07.tar.bz2
