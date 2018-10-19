From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri, 19 Oct 2018 17:36:07 +0200
Subject: [Buildroot] [PATCH] barebox: bump to version 2018.10.0
Message-ID: <20181019153607.11154-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index fd22d904bc..82c400fbaa 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2017.09.0"
+	bool "2018.10.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2017.09.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2018.10.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index b24197024c..fd34a87e06 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# http://www.barebox.org/download/barebox-2017.09.0.tar.bz2.md5
-md5 b92e9c99cda7fbb61d01baf5679df261 barebox-2017.09.0.tar.bz2
+# http://www.barebox.org/download/barebox-2018.10.0.tar.bz2.md5
+md5 f4c89bc92903425c960aa41e997b2251 barebox-2018.10.0.tar.bz2
 
 # Locally calculated
-sha256 43283edc019f95a53fdb7d1b7c294afc4741bfcace348d6beeded5fe5147a81b barebox-2017.09.0.tar.bz2
+sha256 c25bfeaff7dda8862defd8d9011e7e6d23216ee4fc4e8bb5b91a1efd833a6d1c barebox-2018.10.0.tar.bz2
-- 
2.19.0
