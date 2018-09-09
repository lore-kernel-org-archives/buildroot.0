From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Sep 2018 16:36:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.1.8
Message-ID: <20180909143620.17436-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Mesa3d 18.2.0 was released as well, after a runtime test I will send
the next version bump, for now we stay at 18.1.x.

 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 0f4e58d326..c5a8a68c48 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.1.7
+MESA3D_HEADERS_VERSION = 18.1.8
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index a7664bcef8..3224160a5b 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-August/000454.html
-md5 17d8a7e7ecbe146a7dc439e8b6eb02e9  mesa-18.1.7.tar.xz
-sha1 8f86e16a1c03665e55bc284c0e4a5b0a953bcadc  mesa-18.1.7.tar.xz
-sha256 655e3b32ce3bdddd5e6e8768596e5d4bdef82d0dd37067c324cc4b2daa207306  mesa-18.1.7.tar.xz
-sha512 697c4f441ae52bc867d9d73b103094a29102168c248a502c4ea0fc48f51bcb86b2e741da39e882f24131326d460cdb1416415604c6994d1b8c09fb8a153a5c77  mesa-18.1.7.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-September/000459.html
+md5  d2d1de1e338e63877f753ab9d66ba597  mesa-18.1.8.tar.xz
+sha1 bb723111c45680dc31be991dd872c2c1f4f9252d  mesa-18.1.8.tar.xz
+sha256 bd1be67fe9c73b517765264ac28911c84144682d28dbff140e1c2deb2f44c21b  mesa-18.1.8.tar.xz
+sha512 ab89c6d27b765d3efdf61b24dc56d863ae590d83003d2eae4bfe25ecfbeda5bee0227f21d057523bb4eceeaf3d9955df48087ffb472c41b123c100e593056cb9  mesa-18.1.8.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 3a0cf6c7835f98f86d5579b2cc517f84254da7411f764fb0095a383fb0759771  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e9b0c14c49..9fca4c792d 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.1.7
+MESA3D_VERSION = 18.1.8
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.18.0
