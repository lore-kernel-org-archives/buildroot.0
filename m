From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 May 2015 14:08:10 +0200
Subject: [Buildroot] [git commit] barebox: bump to version 2015.04.0 and add
	hash file
Message-ID: <20150504123645.30048819CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c81ac0ff6f873af7d6a95ddfbc180a24a1bff031
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/Config.in    |    4 ++--
 boot/barebox/barebox.hash |    5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 48431bd..a250f3b 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2015.02.0"
+	bool "2015.04.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2015.02.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2015.04.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
new file mode 100644
index 0000000..5782fb5
--- /dev/null
+++ b/boot/barebox/barebox.hash
@@ -0,0 +1,5 @@
+
+# http://www.barebox.org/download/barebox-2015.04.0.tar.bz2.md5
+md5 749436075f39d4cd051c71ea52b24f67 barebox-2015.04.0.tar.bz2
+# Locally calculated
+sha256 905757f84366d8934c718165af4bba8a7c7f3187c29f05ee532566681711a903 barebox-2015.04.0.tar.bz2
