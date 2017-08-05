From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Aug 2017 12:18:23 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/minizip: bump version to 1.1
Message-ID: <20170805101823.9377-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minizip/minizip.hash | 2 +-
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index 994ed60a5..718026c1f 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ac361f40531d9fb7222d4befd10d160c647d5e85138f6bc9eda080ed8f937fb8 minizip-5f56dd81d94bd7028f7dc05d7d14112697c30241.tar.gz
+sha256 5666b5ee3e85dfd2dd119970613c12e6267d31813f07d3ffa5d359fe272cb6d1  minizip-1.1.tar.gz
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 835dfb912..bcd6cc928 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 5f56dd81d94bd7028f7dc05d7d14112697c30241
+MINIZIP_VERSION = 1.1
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = zlib
 MINIZIP_AUTORECONF = YES
-- 
2.11.0
