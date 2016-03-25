From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 20:55:18 +0100
Subject: [Buildroot] [git commit] cmake: bump to version 3.5.1
Message-ID: <20160325200621.DC6CC803C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=688d0fbb754a40bab97f99747b3379ba6812694f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index aa0db20..2c3f0ae 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.5/cmake-3.5.0-SHA-256.txt
-sha256 92c83ad8a4fd6224cf6319a60b399854f55b38ebe9d297c942408b792b1a9efa  cmake-3.5.0.tar.gz
+# From http://www.cmake.org/files/v3.5/cmake-3.5.1-SHA-256.txt
+sha256	93d651a754bcf6f0124669646391dd5774c0fc4d407c384e3ae76ef9a60477e8	cmake-3.5.1.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index c2a0879..a6acf8a 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CMAKE_VERSION_MAJOR = 3.5
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
