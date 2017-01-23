From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 23:07:42 +0100
Subject: [Buildroot] [git commit] gdb: bump 7.12 series to 7.12.1
Message-ID: <20170123220845.5A9A381E43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f24c87283d5c0b29b844091baa7fda1379116f03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host | 2 +-
 package/gdb/gdb.hash       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index b8b7779..24e2274 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -60,4 +60,4 @@ config BR2_GDB_VERSION
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
-	default "7.12"     if BR2_GDB_VERSION_7_12
+	default "7.12.1"   if BR2_GDB_VERSION_7_12
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index d6813ed..1e205db 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,7 +1,7 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
 sha512  f80ec6c8a0f0b54c8b945666e875809174402b7e121efb378ebac931a91f9a1cc0048568f8e2f42ae8ae2392ff8d144c2e51d41c7398935017450aaf29838360	gdb-7.11.1.tar.xz
-sha512  f610338b3a24dfb387c295431d806a0c1375e8ce51b8dd8bbfd2efc4612d0c0ed40ad4393508afca0071eca70688f62bc4f199da5e75ad16f64d91c3bc046033	gdb-7.12.tar.xz
+sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7704251289cababbfaaf9e075550cdf741a54d6cd9ca3433d910efcd8	gdb-7.12.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  0a467091d4b01fbecabb4b8da1cb743025c70e7f4874a0b5c8fa2ec623569a39bde6762b91806de0be6e63711aeb6909715cfbe43860de73d8aec6159a9f10a7	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
