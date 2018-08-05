From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 12:58:46 +0200
Subject: [Buildroot] [git commit] package/gdb: bump to version 8.1.1
Message-ID: <20180805105239.04F9E8A5DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cf4964da56863dfe4ce729c32400bd9acf25ee7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sourceware.org/ml/gdb-announce/2018/msg00002.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 2 +-
 package/gdb/gdb.hash       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 5f5e402a0e..fd05898345 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -90,5 +90,5 @@ config BR2_GDB_VERSION
 	default "arc-2018.03-gdb" if BR2_arc
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
 	default "8.0.1"    if BR2_GDB_VERSION_8_0 || !BR2_PACKAGE_HOST_GDB
-	default "8.1"      if BR2_GDB_VERSION_8_1
+	default "8.1.1"    if BR2_GDB_VERSION_8_1
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 1530a852a2..f1424faaf2 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,7 +1,7 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
 sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7704251289cababbfaaf9e075550cdf741a54d6cd9ca3433d910efcd8	gdb-7.12.1.tar.xz
 sha512  5eb328910033f0918058be2f92caebf1e8dfc6caa3c730d99d621627e53de3c1b43761c2f683d53555893253c2f06768cbf56cdea051a3d291ffb6cfae87b5e1	gdb-8.0.1.tar.xz
-sha512  ffd82f415d7652d62dad1716c307836f594217a363429609beb7d70239e8bf06b73b393345b0e000796228e56681ed7656ac3c8be05e91d6d652ab0d5b1dc357	gdb-8.1.tar.xz
+sha512  7dcd5e8c90de92f577834d887b5f54edb93a07083bfe661bc46c270a6cc4919f0b348e7e2fe8ae4511298a570ef150eeefdc667ef7cf527f0cf60943177ab6c9	gdb-8.1.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  b17e4066730491f6a75b00eab78012f67cc445fe95ecd82c06cda7c1255190e6c471ac89b92f2fcdba4790b0046756b9cecf1f827537afcb44e1e578345852ad 	gdb-arc-2018.03-gdb.tar.gz
