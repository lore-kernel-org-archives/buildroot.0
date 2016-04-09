From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Apr 2016 23:36:47 +0200
Subject: [Buildroot] [git commit] barebox: bump to version 2016.04.0
Message-ID: <20160409213719.7A4AD8184F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04e775dbcaeab47bd410e6615298953ed87bb9d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index bbe6ae2..a2d800e 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2016.03.0"
+	bool "2016.04.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2016.03.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2016.04.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index c2dd7fc..0e30dbd 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# http://www.barebox.org/download/barebox-2016.03.0.tar.bz2.md5
-md5 c3f69640303f3dd17eca85245c889c6f barebox-2016.03.0.tar.bz2
+# http://www.barebox.org/download/barebox-2016.04.0.tar.bz2.md5
+md5 178150b9d7fa9a27db513a629b9200c2 barebox-2016.04.0.tar.bz2
 
 # Locally calculated
-sha256 8b6197e33db919ce361d7e645f4417023fa5d9cf1ffdc9276ce8a892879e1235 barebox-2016.03.0.tar.bz2
+sha256 ad2618a7df5fe5e923d8fd4c8d99f95a8b44166ff7d016bba73e5cb677802027 barebox-2016.04.0.tar.bz2
