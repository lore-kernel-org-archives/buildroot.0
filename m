From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Thu, 18 Feb 2021 19:51:35 +0100
Subject: [Buildroot] [PATCH] boot/barebox: bump version to 2021.01.0
Message-ID: <20210218185135.411975-1-b.bilas@grinn-global.com>
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
index 239c95bf90..03d9a272d0 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2020.11.0"
+	bool "2021.01.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2020.11.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2021.01.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 3644601bbc..e6f8234a4d 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,8 +1,8 @@
-# From https://www.barebox.org/download/barebox-2020.11.0.tar.bz2.md5
-md5  1fc2c1a03d7b44dc12fbf4cf1fc6ffe0  barebox-2020.11.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2021.01.0.tar.bz2.md5
+md5  e81e7cd6bc2629e7fcdeaddf59c324c3  barebox-2021.01.0.tar.bz2
 
 # Locally calculated
-sha256  049d2b1b887d0397f4b5390255459fb0240200b06a3276ffaefdeab7fb243554  barebox-2020.11.0.tar.bz2
+sha256  b39501db1c701b05f862973d8aed628cab0e611421cbaadae8b5262311551ff9  barebox-2021.01.0.tar.bz2
 
 # License files, locally computed
 sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
-- 
2.30.1
