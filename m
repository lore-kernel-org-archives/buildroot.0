From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Thu, 19 Mar 2020 13:52:31 +0100
Subject: [Buildroot] [PATCH] boot/barebox: bump version to 2020.03.0
Message-ID: <20200319125231.486740-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 687bac1823..78fb26272b 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2020.01.0"
+	bool "2020.03.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2020.01.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2020.03.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 5ade20e18b..8a953847f7 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,8 +1,8 @@
-# From https://www.barebox.org/download/barebox-2020.01.0.tar.bz2.md5
-md5  05038e0b61b68ce40e038295b809c548  barebox-2020.01.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2020.03.0.tar.bz2.md5
+md5  9e93df6dadb898d91d9f3811456a94bd  barebox-2020.03.0.tar.bz2
 
 # Locally calculated
-sha256  8968e6b0d72d79eba636917b067b925e3bbb54d38c6c2acfc4e1e49909b42f33  barebox-2020.01.0.tar.bz2
+sha256  625b031d1fe99bdd3bf95f79c8ecfcf67101bc2500ec4816e034bf989f16d1c2  barebox-2020.03.0.tar.bz2
 
 # License files, locally computed
 sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
-- 
2.25.2
