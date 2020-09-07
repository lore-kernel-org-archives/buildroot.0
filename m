From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 21:30:33 +0200
Subject: [Buildroot] [git commit] boot/barebox: bump version to 2020.08.1
Message-ID: <20200907192226.004907FA0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4069d930f04a99ae1d3dee46614053f4fba8ddf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index bf27481e51..9948a249a0 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2020.07.0"
+	bool "2020.08.1"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2020.07.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2020.08.1"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 17992be7f9..4bccdf9e03 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,8 +1,8 @@
-# From https://www.barebox.org/download/barebox-2020.07.0.tar.bz2.md5
-md5  49f3fba08743d44e84e8d68ed776f05d  barebox-2020.07.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2020.08.1.tar.bz2.md5
+md5  d57031878390cb267f6641aedffcda9f  barebox-2020.08.1.tar.bz2
 
 # Locally calculated
-sha256  1956620acc39b5c9b035635ff0b1da2c1b72b791612ef55a72e6272a903fbc4c  barebox-2020.07.0.tar.bz2
+sha256  8e6d413f1083ae0974b11a381369a3bac83e798a99830a1de128c950fef047e6  barebox-2020.08.1.tar.bz2
 
 # License files, locally computed
 sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
