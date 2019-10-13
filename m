From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Oct 2019 11:31:49 -0600
Subject: [Buildroot] [PATCH v5 1/3] package/cmake bump to version 3.9.6
Message-ID: <20191013173151.29108-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the latest cmake that doesn't require a c++11 toolchain.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cmake/cmake.hash | 6 +++---
 package/cmake/cmake.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 9e0159a3c8..340c81b9c9 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From http://www.cmake.org/files/v3.8/cmake-3.8.2-SHA-256.txt
-sha256 da3072794eb4c09f2d782fcee043847b99bb4cf8d4573978d9b2024214d6e92d  cmake-3.8.2.tar.gz
+# From https://cmake.org/files/v3.9/cmake-3.9.6-SHA-256.txt
+sha256 7410851a783a41b521214ad987bb534a7e4a65e059651a2514e6ebfc8f46b218  cmake-3.9.6.tar.gz
 
 # Locally calculated
-sha256 af3030e1bf1af2f534430fdfe3cfc5a617966648a2a7f0c06a631adc92be1e5f  Copyright.txt
+sha256 9d8604f7afc5564ceb9705ba121f5fba2782ce18d92902f3c6ed338228372170  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index a00691a128..e816963089 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.8
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+CMAKE_VERSION_MAJOR = 3.9
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.20.1
