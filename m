From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 14:52:22 +0100
Subject: [Buildroot] [git commit branch/next] boot/barebox: bump version to
 2019.02.0
Message-ID: <20190223135015.090B48B8CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59d186454b1ca7a57343da442a1708a80a499355
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 6a8d251548..4c33a77c61 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2018.12.0"
+	bool "2019.02.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2018.12.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2019.02.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index ec4e404b10..aa80908e67 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# From https://www.barebox.org/download/barebox-2018.12.0.tar.bz2.md5
-md5 f84d7d3562055c80c3eedce0b14d4a0d barebox-2018.12.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2019.02.0.tar.bz2.md5
+md5 b3c55967878c1e332c33502f39483ceb barebox-2019.02.0.tar.bz2
 
 # Locally calculated
-sha256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855 barebox-2018.12.0.tar.bz2
+sha256 f4fc67d5a2410c9d568e5fc1279ac8999e80d3d91c26631df8f3af8636c04212 barebox-2019.02.0.tar.bz2
