From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 22:23:41 +0100
Subject: [Buildroot] [git commit branch/next] cmake: bump version to 3.1.3
Message-ID: <20150222212523.69C63807A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65f442a6495b2ade4f5ca753607b6c54fa63d51a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/cmake.hash |    2 +-
 package/cmake/cmake.mk   |    2 +-
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
