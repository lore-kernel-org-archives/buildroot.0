From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon,  9 Nov 2020 19:22:16 +0100
Subject: [Buildroot] [PATCH] boot/barebox: bump version to 2020.11.0
Message-ID: <20201109182216.279643-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 3b354e64d0..239c95bf90 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2020.09.0"
+	bool "2020.11.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2020.09.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2020.11.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 77c75b6b5b..3644601bbc 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,8 +1,8 @@
-# From https://www.barebox.org/download/barebox-2020.09.0.tar.bz2.md5
-md5  907dc813298fcded06fa9c788d3fb6c8  barebox-2020.09.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2020.11.0.tar.bz2.md5
+md5  1fc2c1a03d7b44dc12fbf4cf1fc6ffe0  barebox-2020.11.0.tar.bz2
 
 # Locally calculated
-sha256  aad3b0736aa8d368d185736260d81fb3785251f376897be3cec745182fd51869  barebox-2020.09.0.tar.bz2
+sha256  049d2b1b887d0397f4b5390255459fb0240200b06a3276ffaefdeab7fb243554  barebox-2020.11.0.tar.bz2
 
 # License files, locally computed
 sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
-- 
2.29.2
