From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Nov 2015 14:45:56 -0300
Subject: [Buildroot] [PATCH] cmake: bump to version 3.4.0
Message-ID: <1447436756-18586-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 8d130d7..469f559 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.3/cmake-3.3.2-SHA-256.txt
-sha256	e75a178d6ebf182b048ebfe6e0657c49f0dc109779170bad7ffcb17463f2fc22	cmake-3.3.2.tar.gz
+# From http://www.cmake.org/files/v3.4/cmake-3.4.0-SHA-256.txt
+sha256	a5b82bf6ace6c481cdb911fd5d372a302740cbefd387e05297cb37f7468d1cea	cmake-3.4.0.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 0f888fd..87ed8ff 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.3
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+CMAKE_VERSION_MAJOR = 3.4
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
 CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.4.10
