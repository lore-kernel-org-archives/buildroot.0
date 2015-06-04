From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jun 2015 15:31:47 +0200
Subject: [Buildroot] [git commit] barebox: bump to version 2015.05.0
Message-ID: <20150604133645.CCE4081E32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db71674489bde3dd2a68161849b88bd54ef77151
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/Config.in    |    4 ++--
 boot/barebox/barebox.hash |    7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 53d8013..ffac979 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2015.04.0"
+	bool "2015.05.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2015.04.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2015.05.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 5782fb5..aa0f12e 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,6 @@
 
-# http://www.barebox.org/download/barebox-2015.04.0.tar.bz2.md5
-md5 749436075f39d4cd051c71ea52b24f67 barebox-2015.04.0.tar.bz2
+# http://www.barebox.org/download/barebox-2015.05.0.tar.bz2.md5
+md5 3b4f2c72ec3b7cc2f1f294fd2baf0c4d barebox-2015.05.0.tar.bz2
+
 # Locally calculated
-sha256 905757f84366d8934c718165af4bba8a7c7f3187c29f05ee532566681711a903 barebox-2015.04.0.tar.bz2
+sha256 f650e15c7a6da8cb779bb1787829fa4184b3189baf604c8af3af4e0deefa5e8e barebox-2015.05.0.tar.bz2
