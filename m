From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 14 Feb 2017 17:40:40 +0100
Subject: [Buildroot] [PATCH] barebox: bump to version 2017.02.0
Message-ID: <20170214164040.25057-1-fabio.porcedda@gmail.com>
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
index e6ecd821f..85956d655 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2017.01.0"
+	bool "2017.02.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2017.01.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2017.02.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index f769c1d80..575059706 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# http://www.barebox.org/download/barebox-2017.01.0.tar.bz2.md5
-md5 d2933437885497b09d69d6e6f4beeffc  barebox-2017.01.0.tar.bz2
+# http://www.barebox.org/download/barebox-2017.02.0.tar.bz2.md5
+md5 4651f5fa5e794a9739dd71eece0fe702  barebox-2017.02.0.tar.bz2
 
 # Locally calculated
-sha256 ca4cc06bdc7183e3fcb4bed300f1e820df1e022a7b86fdcf64205ddb6a103567  barebox-2017.01.0.tar.bz2
+sha256 d65d864fe598d61ed9c6712e32d50742e6996aae02acaae5955c3b22166344cb  barebox-2017.02.0.tar.bz2
-- 
2.11.1
