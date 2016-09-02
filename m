From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Sep 2016 14:29:40 -0000
Subject: [Buildroot] [git commit] barebox: bump version to 2016.08
Message-ID: <20160902142935.BBECB822FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6525c6d2283771061c269956486c1fd1ee5a7320
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Raphael Poggi <poggi.raph@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index fd5cb8c..1548b0d 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2016.06.0"
+	bool "2016.08.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2016.06.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2016.08.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 9db68eb..adcd4e0 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# http://www.barebox.org/download/barebox-2016.06.0.tar.bz2.md5
-md5 7dac834e637db66e624bf058e9310212 barebox-2016.06.0.tar.bz2
+# http://www.barebox.org/download/barebox-2016.08.0.tar.bz2.md5
+md5 66b8f79d337fa4a7bb8744b1a7867474 barebox-2016.08.0.tar.bz2
 
 # Locally calculated
-sha256 a214167c55bf691f686397379e8b9557a1d597e56b7c1bf9607b478a1c4c597e barebox-2016.06.0.tar.bz2
+sha256 610d3422137f0e6e9a72f51caad17d1b2c46314ee03b2ae35799a1c5425478ab barebox-2016.08.0.tar.bz2
