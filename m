From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 22 Feb 2015 21:56:44 +0100
Subject: [Buildroot] [PATCH next] cmake: bump version to 3.1.3
Message-ID: <1424638604-8244-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/cmake/cmake.hash | 2 +-
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 1b6b658..76e03d3 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2b210f7d867a1e716c1895357ebe63c7b9ae61fdb5f2d300ab2f01795f085b35  cmake-3.1.2.tar.gz
+sha256 45f4d3fa8a2f61cc092ae461aac4cac1bab4ac6706f98274ea7f314dd315c6d0 cmake-3.1.3.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index f283a09..8c64b58 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CMAKE_VERSION_MAJOR = 3.1
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.3.0
