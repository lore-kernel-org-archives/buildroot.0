From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 23:10:17 +0200
Subject: [Buildroot] [git commit] package/cmake: bump to version 3.16.9
Message-ID: <20210424204508.A300583D46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ce62b642355e97a37445ef7e6a0e1fa597be0b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cmake/cmake.hash | 6 +++---
 package/cmake/cmake.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 983c292983..97e83a274c 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.15/cmake-3.15.5-SHA-256.txt
-sha256 fbdd7cef15c0ced06bb13024bfda0ecc0dedbcaaaa6b8a5d368c75255243beb4  cmake-3.15.5.tar.gz
+# From https://cmake.org/files/v3.16/cmake-3.16.9-SHA-256.txt
+sha256  1708361827a5a0de37d55f5c9698004c035abb1de6120a376d5d59a81630191f  cmake-3.16.9.tar.gz
 
 # Locally calculated
-sha256 dc628fb936a5d229296d42083f9a8218aa32204c016919e784404c9ec58776e9  Copyright.txt
+sha256  dc628fb936a5d229296d42083f9a8218aa32204c016919e784404c9ec58776e9  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 90fe868fa5..b1b214982e 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.15
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).5
+CMAKE_VERSION_MAJOR = 3.16
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).9
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
