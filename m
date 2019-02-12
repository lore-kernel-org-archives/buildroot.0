From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Feb 2019 11:20:41 +0100
Subject: [Buildroot] [git commit branch/next] boot/uboot: bump to version
 2019.01
Message-ID: <20190212101926.5A97D88F30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cd5b4fa0c4dfeda38c7f76f2d45ae8e52116889
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index bd1b248e94..d4a93615ee 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -39,7 +39,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2018.09"
+	bool "2019.01"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -87,7 +87,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2018.09"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2019.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index ea07fb584d..df2b8caf89 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  839bf23cfe8ce613a77e583a60375179d0ad324e92c82fbdd07bebf0fd142268  u-boot-2018.09.tar.bz2
+sha256  50bd7e5a466ab828914d080d5f6a432345b500e8fba1ad3b7b61e95e60d51c22  u-boot-2019.01.tar.bz2
