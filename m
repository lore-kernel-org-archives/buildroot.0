From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 18 Jan 2017 17:23:20 +0100
Subject: [Buildroot] [PATCH] barebox: bump to version 2017.01.0
Message-ID: <20170118162320.6343-1-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 1548b0d2c..e6ecd821f 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2016.08.0"
+	bool "2017.01.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2016.08.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2017.01.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index adcd4e0b9..c369c9d49 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# http://www.barebox.org/download/barebox-2016.08.0.tar.bz2.md5
-md5 66b8f79d337fa4a7bb8744b1a7867474 barebox-2016.08.0.tar.bz2
+# http://www.barebox.org/download/barebox-2017.01.0.tar.bz2.md5
+md5 d2933437885497b09d69d6e6f4beeffc  barebox-2017.01.0.tar.bz2
 
 # Locally calculated
-sha256 610d3422137f0e6e9a72f51caad17d1b2c46314ee03b2ae35799a1c5425478ab barebox-2016.08.0.tar.bz2
+sha256 ca4cc06bdc7183e3fcb4bed300f1e820df1e022a7b86fdcf64205ddb6a103567  barebox-2017.01.0.tar.bz
-- 
2.11.0
