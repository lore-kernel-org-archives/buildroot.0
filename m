From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Tue, 24 Dec 2019 14:29:13 +0100
Subject: [Buildroot] [PATCH 1/1] boot/barebox: bump version to 2019.12.0
Message-ID: <20191224132913.453832-1-b.bilas@grinn-global.com>
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
index b3344ce699..bdec2b8e50 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2019.11.0"
+	bool "2019.12.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2019.11.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2019.12.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 1797358833..42561ea571 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# From https://www.barebox.org/download/barebox-2019.11.0.tar.bz2.md5
-md5 45bf108b22de94a73dfe5c024c873486 barebox-2019.11.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2019.12.0.tar.bz2.md5
+md5 2d25158ccffaa843c9e4943bbe820ce2 barebox-2019.12.0.tar.bz2
 
 # Locally calculated
-sha256 607165b96d98fcc114fbd07e4001e7b527739a543e7adbe019854fbd8c78777f barebox-2019.11.0.tar.bz2
+sha256 fb77afc5c1a9783b8e1a9bb6c617973f5c0ed4c6f8e079f96cb7e7e0818a7a90 barebox-2019.12.0.tar.bz2
-- 
2.24.1
