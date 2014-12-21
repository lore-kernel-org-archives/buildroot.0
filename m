From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 23:24:09 +0100
Subject: [Buildroot] [git commit] boot/uboot: bump to version 2014.10
Message-ID: <20141221224101.A40D880543@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=143119c0ef58b04bd7109bcb7b095ef98cc5311c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index cf40fdc..f3e1778 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2014.07"
+	bool "2014.10"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -63,7 +63,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2014.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2014.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
