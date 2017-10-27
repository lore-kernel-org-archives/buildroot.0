From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Oct 2017 17:57:34 +0200
Subject: [Buildroot] [PATCH v1] barebox: bump to version 2017.09.0
Message-ID: <20171027155734.23286-1-ps.report@gmx.net>
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
index 85956d6552..fd22d904bc 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2017.02.0"
+	bool "2017.09.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2017.02.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2017.09.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 5750597062..b24197024c 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# http://www.barebox.org/download/barebox-2017.02.0.tar.bz2.md5
-md5 4651f5fa5e794a9739dd71eece0fe702  barebox-2017.02.0.tar.bz2
+# http://www.barebox.org/download/barebox-2017.09.0.tar.bz2.md5
+md5 b92e9c99cda7fbb61d01baf5679df261 barebox-2017.09.0.tar.bz2
 
 # Locally calculated
-sha256 d65d864fe598d61ed9c6712e32d50742e6996aae02acaae5955c3b22166344cb  barebox-2017.02.0.tar.bz2
+sha256 43283edc019f95a53fdb7d1b7c294afc4741bfcace348d6beeded5fe5147a81b barebox-2017.09.0.tar.bz2
-- 
2.14.2
