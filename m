From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 14 Sep 2015 18:50:04 +0200
Subject: [Buildroot] [PATCH v2] barebox: bump to version 2015.09.0
In-Reply-To: <1442247387-19589-1-git-send-email-fabio.porcedda@gmail.com>
References: <1442247387-19589-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1442249404-20437-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
v2:
 - Add missing Sign off line
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index f6f8f15..bb27b61 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2015.07.0"
+	bool "2015.09.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2015.07.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2015.09.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index ee09f8d..57a8eff 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# http://www.barebox.org/download/barebox-2015.07.0.tar.bz2.md5
-md5 8747cb02b607c2a92280f4c7db820828 barebox-2015.07.0.tar.bz2
+# http://www.barebox.org/download/barebox-2015.09.0.tar.bz2.md5
+md5 8ce178b4e19cc350fcdbdd8c539eaf37 barebox-2015.09.0.tar.bz2
 
 # Locally calculated
-sha256 0971be9a328b5e6b26912e3fa29ededdc061d4c3cf16d327e24d83cd5ca06695 barebox-2015.07.0.tar.bz2
+sha256 32759e368627aa6c1b51eb8f4c3f767c4ac37dda1d6495a2664c4f54f9db1626 barebox-2015.09.0.tar.bz2
-- 
2.5.2
