From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Apr 2019 21:41:14 +0200
Subject: [Buildroot] [git commit] boot/barebox: bump version to 2019.04.0
Message-ID: <20190407193745.DB77683919@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc84a9f4f93c5ed085dfe39222b89015ed393be4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 4c33a77c61..6d639e31e9 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2019.02.0"
+	bool "2019.04.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2019.02.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2019.04.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index aa80908e67..348b23d47c 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# From https://www.barebox.org/download/barebox-2019.02.0.tar.bz2.md5
-md5 b3c55967878c1e332c33502f39483ceb barebox-2019.02.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2019.04.0.tar.bz2.md5
+md5 2d9619dfe6aaaf3b10d6327486e18571 barebox-2019.04.0.tar.bz2
 
 # Locally calculated
-sha256 f4fc67d5a2410c9d568e5fc1279ac8999e80d3d91c26631df8f3af8636c04212 barebox-2019.02.0.tar.bz2
+sha256 d2834b612228b82bbaa713b26dec1fa770123bb02727400e4c56f6f2bffb01cc barebox-2019.04.0.tar.bz2
\ No newline at end of file
