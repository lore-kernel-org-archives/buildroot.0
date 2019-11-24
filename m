From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 22:54:10 +0100
Subject: [Buildroot] [git commit branch/next] boot/barebox: bump version to
 2019.11.0
Message-ID: <20191124214634.BC7D48FBF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59fdcd7180ba0e752527e49b6aa316980e3d5847
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 4512aa1852..b3344ce699 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2019.09.0"
+	bool "2019.11.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2019.09.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2019.11.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 9bdcfb3284..1797358833 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# From https://www.barebox.org/download/barebox-2019.09.0.tar.bz2.md5
-md5 08fa404904cc95d8d0d34d4142351d09 barebox-2019.09.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2019.11.0.tar.bz2.md5
+md5 45bf108b22de94a73dfe5c024c873486 barebox-2019.11.0.tar.bz2
 
 # Locally calculated
-sha256 beab6bdba2466bece57d23834daf4f0d530a594efc11ca0ddb69372981e6e159 barebox-2019.09.0.tar.bz2
+sha256 607165b96d98fcc114fbd07e4001e7b527739a543e7adbe019854fbd8c78777f barebox-2019.11.0.tar.bz2
