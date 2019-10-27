From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Oct 2019 18:32:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/leveldb: fix malformatted patch
Message-ID: <20191027173234.2674-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e46/e46d67d0e8b4b47fc09e631ca46ed02594ced801/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/leveldb/0002-CMake-install-libmemenv.a.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/leveldb/0002-CMake-install-libmemenv.a.patch b/package/leveldb/0002-CMake-install-libmemenv.a.patch
index f2e88a8a6c..ab23a1881a 100644
--- a/package/leveldb/0002-CMake-install-libmemenv.a.patch
+++ b/package/leveldb/0002-CMake-install-libmemenv.a.patch
@@ -16,7 +16,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index a65afbf..83b2425 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -199,6 +199,24 @@ target_sources(leveldb
+@@ -187,6 +187,30 @@ target_sources(leveldb
      "${LEVELDB_PUBLIC_INCLUDE_DIR}/write_batch.h"
  )
  
-- 
2.20.1
