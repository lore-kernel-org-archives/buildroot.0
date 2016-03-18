From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 21:46:55 +0100
Subject: [Buildroot] [git commit] cmake: bump version to 3.5.0
Message-ID: <20160318205619.6958480497@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab067a2a4bdd9cd874ffa93831096a270729944d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 5b81416..aa0db20 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.4/cmake-3.4.3-SHA-256.txt
-sha256	b73f8c1029611df7ed81796bf5ca8ba0ef41c6761132340c73ffe42704f980fa	cmake-3.4.3.tar.gz
+# From http://www.cmake.org/files/v3.5/cmake-3.5.0-SHA-256.txt
+sha256 92c83ad8a4fd6224cf6319a60b399854f55b38ebe9d297c942408b792b1a9efa  cmake-3.5.0.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 1a1ba30..c2a0879 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.4
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION_MAJOR = 3.5
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
