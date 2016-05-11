From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 May 2016 17:59:28 -0300
Subject: [Buildroot] [PATCH]  barebox: bump to version 2016.05.0
Message-ID: <1463000368-8172-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 0bb19d3..52a83a9 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2016.04.0"
+	bool "2016.05.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2016.04.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2016.05.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 0e30dbd..fe3b8b2 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# http://www.barebox.org/download/barebox-2016.04.0.tar.bz2.md5
-md5 178150b9d7fa9a27db513a629b9200c2 barebox-2016.04.0.tar.bz2
+# http://www.barebox.org/download/barebox-2016.05.0.tar.bz2.md5
+md5 4df21ad084faa54ea0310288c7b03049 barebox-2016.05.0.tar.bz2
 
 # Locally calculated
-sha256 ad2618a7df5fe5e923d8fd4c8d99f95a8b44166ff7d016bba73e5cb677802027 barebox-2016.04.0.tar.bz2
+sha256 e3a85fd0d9b4c92421258ba38f5bee112ec9dcae87246c93a2353c62bf16d988 barebox-2016.05.0.tar.bz2
-- 
1.9.1
