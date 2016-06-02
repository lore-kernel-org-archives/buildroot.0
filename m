From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  2 Jun 2016 09:45:44 +0200
Subject: [Buildroot] [PATCH] gdb: bump 7.11.x branch to 7.11.1
Message-ID: <1464853544-32573-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps our gdb 7.11 version to the latest 7.11.1 release. See
https://sourceware.org/ml/gdb/2016-06/msg00000.html for the release
announcement.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in.host | 2 +-
 package/gdb/gdb.hash       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index dc149b6..7b319f5 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -57,4 +57,4 @@ config BR2_GDB_VERSION
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.9.1"    if BR2_GDB_VERSION_7_9
 	default "7.10.1"   if BR2_GDB_VERSION_7_10 || !BR2_PACKAGE_HOST_GDB
-	default "7.11"	   if BR2_GDB_VERSION_7_11
+	default "7.11.1"   if BR2_GDB_VERSION_7_11
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index bf3f925..611a75c 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,7 +1,7 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
 sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
-sha512  eadd2a59a1e48b1484eb2bea85256d6b1912926bc8b690793d02babf2639608bd22a0f2de77d4f60092da3b1dafeaa6d75a7cff3e84bd4e22fc46364b68e5e9f	gdb-7.11.tar.xz
+sha512  f80ec6c8a0f0b54c8b945666e875809174402b7e121efb378ebac931a91f9a1cc0048568f8e2f42ae8ae2392ff8d144c2e51d41c7398935017450aaf29838360	gdb-7.11.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  0a467091d4b01fbecabb4b8da1cb743025c70e7f4874a0b5c8fa2ec623569a39bde6762b91806de0be6e63711aeb6909715cfbe43860de73d8aec6159a9f10a7	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-- 
2.7.4
