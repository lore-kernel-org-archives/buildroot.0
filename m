From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 15 Jan 2016 18:52:05 +0100
Subject: [Buildroot] [PATCH] barebox: bump to version 2016.01.0
Message-ID: <1452880325-24060-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 207d9b2..39cb5d2 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2015.12.0"
+	bool "2016.01.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2015.12.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2016.01.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 178655d..b6e1869 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
 # http://www.barebox.org/download/barebox-2015.12.0.tar.bz2.md5
-md5 1ef8926cd2eadc39ce779b8377e7cfcc barebox-2015.12.0.tar.bz2
+md5 99f8c1252e3085e4b3a4e365ff36e9bd barebox-2016.01.0.tar.bz2
 
 # Locally calculated
-sha256 b0b7df82dafcc7aceeaa6285755855a71f6422c5a278949c717096f4ffd7f315 barebox-2015.12.0.tar.bz2
+sha256 f0bb34b745b9c8c626186e22b0154f57c15d0eec5de1e3654f740665b2136d91 barebox-2016.01.0.tar.bz2
-- 
2.7.0
