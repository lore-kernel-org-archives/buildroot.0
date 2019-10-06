From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sun,  6 Oct 2019 16:10:12 +0200
Subject: [Buildroot] [PATCH 1/1] boot/barebox: bump version to 2019.09.0
Message-ID: <20191006141012.31795-1-b.bilas@grinn-global.com>
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
index f4c0c27df8..4512aa1852 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2019.07.0"
+	bool "2019.09.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2019.07.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2019.09.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 70b500da77..9bdcfb3284 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# From https://www.barebox.org/download/barebox-2019.07.0.tar.bz2.md5
-md5 8fb8e8ec3775228c34f7de2096872f51 barebox-2019.07.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2019.09.0.tar.bz2.md5
+md5 08fa404904cc95d8d0d34d4142351d09 barebox-2019.09.0.tar.bz2
 
 # Locally calculated
-sha256 8512ac1b91ef48f8b657fad446edc868eb7da30e93d6ff7854f0006854b6a3a6 barebox-2019.07.0.tar.bz2
+sha256 beab6bdba2466bece57d23834daf4f0d530a594efc11ca0ddb69372981e6e159 barebox-2019.09.0.tar.bz2
-- 
2.23.0
