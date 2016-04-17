From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 16:45:05 +0200
Subject: [Buildroot] [git commit] package/cmake: bump version to 3.5.2
Message-ID: <20160417144509.E3C7E80337@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4472bacef2c6ef38d99b9f181d647d64195ae760
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 2c3f0ae..e40d4ea 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.5/cmake-3.5.1-SHA-256.txt
-sha256	93d651a754bcf6f0124669646391dd5774c0fc4d407c384e3ae76ef9a60477e8	cmake-3.5.1.tar.gz
+# From http://www.cmake.org/files/v3.5/cmake-3.5.2-SHA-256.txt
+sha256	92d8410d3d981bb881dfff2aed466da55a58d34c7390d50449aa59b32bb5e62a	cmake-3.5.2.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index a6acf8a..a776b14 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CMAKE_VERSION_MAJOR = 3.5
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
