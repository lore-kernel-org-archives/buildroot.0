From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 09:48:35 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 18.2.4
Message-ID: <20181102084634.88C4C8818D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f8f8a49c5f8d4bbd85058dfc0cdf26038bcddb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index c3eaaac3d8..99dfb431a9 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.2.3
+MESA3D_HEADERS_VERSION = 18.2.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 5f894a771e..9ee353ee15 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-October/000468.html
-md5 3ad402144c2da93f09910dd2e0fc4017  mesa-18.2.3.tar.xz
-sha1 84c037e8ac53c210e3d74ae010241f781251b72c  mesa-18.2.3.tar.xz
-sha256 e2bf83c17e1abdecb1ee81af22652e27e9aa38f963e95e60f34275cc0376304f  mesa-18.2.3.tar.xz
-sha512 20f512b1f3835b1c78b1f05f2e2125dc3437b61b8857e7ec62e0f9ac3be2ccb5b7ebe7e18f444da1117bc100d75e4b03cd2a0180f0f0b1cf760714b43bc7a664  mesa-18.2.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-October/000471.html
+md5  33c4b4ad2f33d4faedec3206da7853d3  mesa-18.2.4.tar.xz
+sha1 9ebe58bdf03a1ff5e671de75f92c3c739edd3c4e  mesa-18.2.4.tar.xz
+sha256 621d1aebb57876d5b6a5d2dcf4eb7e0620e650c6fe5cf3655c65e243adc9cb4e  mesa-18.2.4.tar.xz
+sha512 088d43b087f4005752e4db75eaa6897e0fcb6de7b9a1f2d2b2ce3b5557d1dff829022e0092e8b1038ff01182c863ca0f26c97b9adde34bca462d3fa24502bfde  mesa-18.2.4.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d0f231792e..1a1fb17c72 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.2.3
+MESA3D_VERSION = 18.2.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
