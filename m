From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Dec 2015 10:02:39 -0300
Subject: [Buildroot] [PATCH] cmake: bump to version 3.4.1
Message-ID: <1449147759-4462-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 469f559..be0b464 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.4/cmake-3.4.0-SHA-256.txt
-sha256	a5b82bf6ace6c481cdb911fd5d372a302740cbefd387e05297cb37f7468d1cea	cmake-3.4.0.tar.gz
+# From http://www.cmake.org/files/v3.4/cmake-3.4.1-SHA-256.txt
+sha256	d41462bdd80dc37f0d5608167b354bb3af8c068eee640be04c907154c5c113e2	cmake-3.4.1.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 87ed8ff..8c3da1e 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CMAKE_VERSION_MAJOR = 3.4
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.4.10
