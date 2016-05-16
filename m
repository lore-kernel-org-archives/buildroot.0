From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 May 2016 21:14:09 +0200
Subject: [Buildroot] [git commit branch/next] boot/uboot: bump to version
	2016.05
Message-ID: <20160516192028.0EEB181DD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=316986e3363499a3d8c392b6de205b07896b9a6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 4613dd3..21f9abd 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -38,7 +38,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2016.03"
+	bool "2016.05"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -86,7 +86,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2016.03"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2016.05"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 747d133..2076b3b 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  e49337262ecac44dbdeac140f2c6ebd1eba345e0162b0464172e7f05583ed7bb  u-boot-2016.03.tar.bz2
+sha256  87d02275615aaf0cd007b54cbe9fbadceef2bee7c79e6c323ea1ae8956dcb171  u-boot-2016.05.tar.bz2
