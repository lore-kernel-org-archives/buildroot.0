From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Dec 2015 23:06:17 +0100
Subject: [Buildroot] [git commit] barebox: bump to version 2015.12.0
Message-ID: <20151209220634.9AD6D81EE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4bccaa0b3ab498cd339d6c58f63a438057ac2699
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index e9021fb..207d9b2 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2015.11.0"
+	bool "2015.12.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2015.11.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2015.12.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index bb2ecc2..178655d 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# http://www.barebox.org/download/barebox-2015.11.0.tar.bz2.md5
-md5 05951fa64000f5baedfc1064dbcfcad0 barebox-2015.11.0.tar.bz2
+# http://www.barebox.org/download/barebox-2015.12.0.tar.bz2.md5
+md5 1ef8926cd2eadc39ce779b8377e7cfcc barebox-2015.12.0.tar.bz2
 
 # Locally calculated
-sha256 ea40cef0a5ef76c4d68e76ac0e5c71c758c563ffa48c08e0b284688ec6f9d422 barebox-2015.11.0.tar.bz2
+sha256 b0b7df82dafcc7aceeaa6285755855a71f6422c5a278949c717096f4ffd7f315 barebox-2015.12.0.tar.bz2
