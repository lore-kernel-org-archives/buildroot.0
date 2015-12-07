From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 Dec 2015 09:02:28 -0300
Subject: [Buildroot] [PATCH] gdb: bump 7.10 series to 7.10.1
Message-ID: <1449489748-18741-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gdb/Config.in.host | 2 +-
 package/gdb/gdb.hash       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index b65dd52..6bf7e84 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -57,4 +57,4 @@ config BR2_GDB_VERSION
 	default "7.7.1"    if BR2_GDB_VERSION_7_7
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8
 	default "7.9.1"    if BR2_GDB_VERSION_7_9 || !BR2_PACKAGE_HOST_GDB
-	default "7.10"     if BR2_GDB_VERSION_7_10
+	default "7.10.1"   if BR2_GDB_VERSION_7_10
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 2646a32..b511a3e 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -2,7 +2,7 @@
 sha512	887b9b726dae8f6e3e5e41574460a67e4f9002b0d47bc985dcf63bdf3518397a90b6a208cb5b19e5ed2341715ad75cfeed4df4fb423f39f74218e36bc87f1cab	gdb-7.7.1.tar.bz2
 sha512	face5bf1b4ce144fc8604fc84620beed956177a11fd632b4e41906fc7f632910b2b43a50e6cfdfd6cbd876ee527c813bddab8df29dc560a6c36694cdb8edc4e4	gdb-7.8.2.tar.xz
 sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
-sha512	4d9d7b536ad46f881689fca9f3f0b60268ff413c7900115fed5030d81d1d794793cc51d51510584ea1a63fe5891d006a9867ba36981b86b50806d469b717457d	gdb-7.10.tar.xz
+sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
 # No hash for the ARC & microblaze variants, comes from the github-helper:
 none	xxx	gdb-arc-2015.06-gdb.tar.gz
 none	xxx	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-- 
2.4.10
