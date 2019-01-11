From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 11 Jan 2019 22:52:34 +0100
Subject: [Buildroot] [PATCH v1 1/2] barebox: bump version to 2018.12.0
Message-ID: <20190111215235.23315-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 82c400fbaa..6a8d251548 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2018.10.0"
+	bool "2018.12.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2018.10.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2018.12.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index fd34a87e06..ec4e404b10 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# http://www.barebox.org/download/barebox-2018.10.0.tar.bz2.md5
-md5 f4c89bc92903425c960aa41e997b2251 barebox-2018.10.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2018.12.0.tar.bz2.md5
+md5 f84d7d3562055c80c3eedce0b14d4a0d barebox-2018.12.0.tar.bz2
 
 # Locally calculated
-sha256 c25bfeaff7dda8862defd8d9011e7e6d23216ee4fc4e8bb5b91a1efd833a6d1c barebox-2018.10.0.tar.bz2
+sha256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855 barebox-2018.12.0.tar.bz2
-- 
2.20.1
