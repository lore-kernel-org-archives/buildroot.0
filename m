From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 13:15:37 +0200
Subject: [Buildroot] [git commit] barebox: bump to version 2015.07.0
Message-ID: <20150705111545.76F3A8081A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7314eaa01709b148214994e7e15cd870b41f8d16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/Config.in    |    4 ++--
 boot/barebox/barebox.hash |    7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index ffac979..f6f8f15 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2015.05.0"
+	bool "2015.07.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2015.05.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2015.07.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index aa0f12e..ee09f8d 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,6 +1,5 @@
-
-# http://www.barebox.org/download/barebox-2015.05.0.tar.bz2.md5
-md5 3b4f2c72ec3b7cc2f1f294fd2baf0c4d barebox-2015.05.0.tar.bz2
+# http://www.barebox.org/download/barebox-2015.07.0.tar.bz2.md5
+md5 8747cb02b607c2a92280f4c7db820828 barebox-2015.07.0.tar.bz2
 
 # Locally calculated
-sha256 f650e15c7a6da8cb779bb1787829fa4184b3189baf604c8af3af4e0deefa5e8e barebox-2015.05.0.tar.bz2
+sha256 0971be9a328b5e6b26912e3fa29ededdc061d4c3cf16d327e24d83cd5ca06695 barebox-2015.07.0.tar.bz2
