From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jun 2016 21:07:17 +0200
Subject: [Buildroot] [git commit] barebox: bump to version 2016.06.0
Message-ID: <20160623191635.6B2A7802A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f732e3362e813894c6dfd699e0644d1873309feb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 52a83a9..fd5cb8c 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2016.05.0"
+	bool "2016.06.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2016.05.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2016.06.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index fe3b8b2..9db68eb 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# http://www.barebox.org/download/barebox-2016.05.0.tar.bz2.md5
-md5 4df21ad084faa54ea0310288c7b03049 barebox-2016.05.0.tar.bz2
+# http://www.barebox.org/download/barebox-2016.06.0.tar.bz2.md5
+md5 7dac834e637db66e624bf058e9310212 barebox-2016.06.0.tar.bz2
 
 # Locally calculated
-sha256 e3a85fd0d9b4c92421258ba38f5bee112ec9dcae87246c93a2353c62bf16d988 barebox-2016.05.0.tar.bz2
+sha256 a214167c55bf691f686397379e8b9557a1d597e56b7c1bf9607b478a1c4c597e barebox-2016.06.0.tar.bz2
