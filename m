From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  1 Nov 2019 22:40:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.15.5
Message-ID: <20191101214052.19167-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://blog.kitware.com/cmake-3-15-5-available-for-download/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index bbf6e19f27..983c292983 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.15/cmake-3.15.4-SHA-256.txt
-sha256 8a211589ea21374e49b25fc1fc170e2d5c7462b795f1b29c84dd0e984301ed7a  cmake-3.15.4.tar.gz
+# From https://cmake.org/files/v3.15/cmake-3.15.5-SHA-256.txt
+sha256 fbdd7cef15c0ced06bb13024bfda0ecc0dedbcaaaa6b8a5d368c75255243beb4  cmake-3.15.5.tar.gz
 
 # Locally calculated
 sha256 dc628fb936a5d229296d42083f9a8218aa32204c016919e784404c9ec58776e9  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 7c6ddf57a4..1f30736023 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CMAKE_VERSION_MAJOR = 3.15
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).4
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).5
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.20.1
