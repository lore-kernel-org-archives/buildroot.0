From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Dec 2016 09:21:50 +0100
Subject: [Buildroot] [git commit] cmake: bump version to 3.7.1
Message-ID: <20161202083538.E801E81D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d96fafc3d346af8790df45557b16069d6ce81e79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 687e5a4..7a22f21 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.7/cmake-3.7.0-SHA-256.txt
-sha256 ed63e05c41aeb6c036e503114ab15847f29c312f9f21f5f1a7060a4b4ec2fb31  cmake-3.7.0.tar.gz
+# From http://www.cmake.org/files/v3.7/cmake-3.7.1-SHA-256.txt
+sha256 449a5bce64dbd4d5b9517ebd1a1248ed197add6ad27934478976fd5f1f9330e1  cmake-3.7.1.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 522d7fe..f4c61aa 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CMAKE_VERSION_MAJOR = 3.7
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
