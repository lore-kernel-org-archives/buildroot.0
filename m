From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Mar 2016 14:29:06 +0100
Subject: [Buildroot] [git commit] barebox: bump to version 2016.03.0
Message-ID: <20160317133014.1A43981916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3eeeb03e8973e3b3dde2f0aa171a0803103d73aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 363ac2b..bbe6ae2 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2016.02.0"
+	bool "2016.03.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2016.02.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2016.03.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index a5d526a..c2dd7fc 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# http://www.barebox.org/download/barebox-2016.02.0.tar.bz2.md5
-md5 451cf8d025af6acbe7aaa2596541550f barebox-2016.02.0.tar.bz2
+# http://www.barebox.org/download/barebox-2016.03.0.tar.bz2.md5
+md5 c3f69640303f3dd17eca85245c889c6f barebox-2016.03.0.tar.bz2
 
 # Locally calculated
-sha256 1b4760e535994f950c10ef407ff59cf5c0ed97ab30476b9054e1f65d3e372eff barebox-2016.02.0.tar.bz2
+sha256 8b6197e33db919ce361d7e645f4417023fa5d9cf1ffdc9276ce8a892879e1235 barebox-2016.03.0.tar.bz2
