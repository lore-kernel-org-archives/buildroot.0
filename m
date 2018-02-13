From: Mark Hirota <markhirota@gmail.com>
Date: Tue, 13 Feb 2018 11:57:29 -0800
Subject: [Buildroot] [PATCH 1/1] cmake: bump version to 3.10.2 and add
 license hash
Message-ID: <20180213195729.33644-1-markhirota@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mark Hirota <markhirota@gmail.com>
---
 package/cmake/cmake.hash | 5 +++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index f138ac79a1..29c4b7eb6f 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,3 @@
-# From http://www.cmake.org/files/v3.8/cmake-3.8.2-SHA-256.txt
-sha256 da3072794eb4c09f2d782fcee043847b99bb4cf8d4573978d9b2024214d6e92d  cmake-3.8.2.tar.gz
+# From http://www.cmake.org/files/v3.10/cmake-3.10.0-SHA-256.txt
+sha256 80d0faad4ab56de07aa21a7fc692c88c4ce6156d42b0579c6962004a70a3218b  cmake-3.10.2.tar.gz
+sha256 ccf2c6d4468919c8c26a764b9ed8fde349f0d298335524568b346b9bdcf56e1f  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index a00691a128..48933b24d2 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.8
+CMAKE_VERSION_MAJOR = 3.10
 CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
-- 
2.14.3
