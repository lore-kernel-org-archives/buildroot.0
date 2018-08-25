From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Aug 2018 06:58:22 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.1.7
Message-ID: <20180825045822.5573-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index b94b640147..0c1e885fc4 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.1.6
+MESA3D_HEADERS_VERSION = 18.1.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 4f8eb851d2..a7664bcef8 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-August/000451.html
-md5  f798814c0b93ca3c1cf395bb936db3e0  mesa-18.1.6.tar.xz
-sha1 8d4daf725f20404f980b981c9693b58756ba6c48  mesa-18.1.6.tar.xz
-sha256 bb7ce759069801804fcfb8152da3457f76cd7b4e0096e4870ff5adcb5c894289  mesa-18.1.6.tar.xz
-sha512 2966210800215f5ced2720691063a8519b51ebeab9fb1e99bde4b1bd7ccc719d6395a1c29f25c88efe62d1592cf14ceafc163aca349490b1f8cee81070d46fcc  mesa-18.1.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-August/000454.html
+md5 17d8a7e7ecbe146a7dc439e8b6eb02e9  mesa-18.1.7.tar.xz
+sha1 8f86e16a1c03665e55bc284c0e4a5b0a953bcadc  mesa-18.1.7.tar.xz
+sha256 655e3b32ce3bdddd5e6e8768596e5d4bdef82d0dd37067c324cc4b2daa207306  mesa-18.1.7.tar.xz
+sha512 697c4f441ae52bc867d9d73b103094a29102168c248a502c4ea0fc48f51bcb86b2e741da39e882f24131326d460cdb1416415604c6994d1b8c09fb8a153a5c77  mesa-18.1.7.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 3a0cf6c7835f98f86d5579b2cc517f84254da7411f764fb0095a383fb0759771  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 194fb98a85..91713d58be 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.1.6
+MESA3D_VERSION = 18.1.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.18.0
