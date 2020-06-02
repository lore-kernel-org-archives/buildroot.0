From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 02 Jun 2020 20:01:49 -0000
Subject: [Buildroot] [git commit] boot/barebox: bump version to 2020.05.0
Message-ID: <20200602200119.DF9248256A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75c5de34ee595a391585e3a056365b85f04ec2cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 78fb26272b..e5ba8cd1cf 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2020.03.0"
+	bool "2020.05.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2020.03.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2020.05.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 8a953847f7..8a33453249 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,8 +1,8 @@
-# From https://www.barebox.org/download/barebox-2020.03.0.tar.bz2.md5
-md5  9e93df6dadb898d91d9f3811456a94bd  barebox-2020.03.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2020.05.0.tar.bz2.md5
+md5  31dee7b5715967fab882cabe4e406896  barebox-2020.05.0.tar.bz2
 
 # Locally calculated
-sha256  625b031d1fe99bdd3bf95f79c8ecfcf67101bc2500ec4816e034bf989f16d1c2  barebox-2020.03.0.tar.bz2
+sha256  03e29c2864c3220c676a0cf768ffe2b8f1064eddb60463281c9944625e649b65  barebox-2020.05.0.tar.bz2
 
 # License files, locally computed
 sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
