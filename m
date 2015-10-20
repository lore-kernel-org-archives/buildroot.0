From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 21:33:42 +0200
Subject: [Buildroot] [git commit] barebox: bump to version 2015.10.0
Message-ID: <20151020194059.8542481D5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4dd3e6e3f5bfea36c91bfdc213c4d3e522744ca9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/Config.in    |    4 ++--
 boot/barebox/barebox.hash |    6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index bb27b61..7e81181 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2015.09.0"
+	bool "2015.10.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2015.09.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2015.10.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 57a8eff..1b927ba 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# http://www.barebox.org/download/barebox-2015.09.0.tar.bz2.md5
-md5 8ce178b4e19cc350fcdbdd8c539eaf37 barebox-2015.09.0.tar.bz2
+# http://www.barebox.org/download/barebox-2015.10.0.tar.bz2.md5
+md5 50b787db3f91bebd5ed646e80a05caab barebox-2015.10.0.tar.bz2
 
 # Locally calculated
-sha256 32759e368627aa6c1b51eb8f4c3f767c4ac37dda1d6495a2664c4f54f9db1626 barebox-2015.09.0.tar.bz2
+sha256 8353042fe27a30a01a00fe1e1f4a34f292a291027b9637d3ea8f305387407880 barebox-2015.10.0.tar.bz2
