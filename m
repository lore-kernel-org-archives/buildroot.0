From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 24 Jan 2019 17:52:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.3.2
Message-ID: <20190124165208.16966-1-bernd.kuhls@t-online.de>
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
index 710cebe070..a1b0f4909d 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.3.1
+MESA3D_HEADERS_VERSION = 18.3.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 68ec1ec5b8..78e8c3c291 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-December/000484.html
-md5 d60828056d77bfdbae0970f9b15fb1be  mesa-18.3.1.tar.xz
-sha1 50ba2d37647fea77ea19416e8a6ffed34c313330  mesa-18.3.1.tar.xz
-sha256 5b1f827d28684a25f6657289f8b7d47ac56395988c7ac23e0ec9a62b644bdc63  mesa-18.3.1.tar.xz
-sha512 a68d39158cf1e868d70730d0641a0cfe4c6e5b3cd1bc0c47f54022402aca03503933084f6ddc722bf88c9b6d1281ba5c847ec4fed8092a9b33f90527d08e12db  mesa-18.3.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-January/000489.html
+md5 4a82bf3ac2e81493a1a84dd7581ec786  mesa-18.3.2.tar.xz
+sha1 8775d7bfac7e07141ac4299888d426d5550949f7  mesa-18.3.2.tar.xz
+sha256 f7ce7181c07b6d8e0132da879af1729523a6c8aa87f79a9d59dfd064024cfb35  mesa-18.3.2.tar.xz
+sha512 34b66520728d720b1f3d3d63f8ba5c255d57b9e8fe427264419e4163b474df662ff6db9ca8b81283866da415e34346a4c39fc37bebe2a0929be14480faf4db45  mesa-18.3.2.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e1c54fbee4..73e35aa281 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.3.1
+MESA3D_VERSION = 18.3.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.20.1
