From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2016 22:28:34 +0100
Subject: [Buildroot] [git commit] package/cmake: bump version to 3.4.3
Message-ID: <20160201224714.8C3037F90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4651c601852b7f35cdfaad047fc44e3a7059ea7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index b0bcf17..5b81416 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.4/cmake-3.4.2-SHA-256.txt
-sha256	da7cc34e1ce1d82e67a32ab081c02c2845534cd8bf2e09d88077a1b282e97392	cmake-3.4.2.tar.gz
+# From http://www.cmake.org/files/v3.4/cmake-3.4.3-SHA-256.txt
+sha256	b73f8c1029611df7ed81796bf5ca8ba0ef41c6761132340c73ffe42704f980fa	cmake-3.4.3.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 341ab27..1a1ba30 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 CMAKE_VERSION_MAJOR = 3.4
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
-CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
 
