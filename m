From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Nov 2017 13:13:48 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 17.2.5
Message-ID: <20171111121348.32718-1-bernd.kuhls@t-online.de>
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
index c9db3f551b..a944353642 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.2.4
+MESA3D_HEADERS_VERSION = 17.2.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 476e1bcb29..baadc49392 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-October/000371.html
-md5 cf0b7a297eedd0549cda5ba071d7561f  mesa-17.2.4.tar.xz
-sha1 2faad5bd48243a1b80f5522a26144a176f841a20  mesa-17.2.4.tar.xz
-sha256 5ba408fecd6e1132e5490eec1a2f04466214e4c65c8b89b331be844768c2e550  mesa-17.2.4.tar.xz
-sha512 665b63aab6af3f8f263f182d85d9ad71db7a23bcbaf67d62fe53c258cb0f600266ac82e72d681ec20cf7c66b47d4076aad5c3f553519f19110ee577da2707085  mesa-17.2.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-November/000374.html
+md5 ba649f82a066f710aa23655254a83eb8  mesa-17.2.5.tar.xz
+sha1 1509bd00f32ee42128f29b63b4aaf26bf9abb63e  mesa-17.2.5.tar.xz
+sha256 7f7f914b7b9ea0b15f2d9d01a4375e311b0e90e55683b8e8a67ce8691eb1070f  mesa-17.2.5.tar.xz
+sha512 c4b0f7f48b0b57fdf610de3d61e127774f8223e755acfde6cf2649818eec985e8f925abf8a15d530ecdb882cb8d7268fd01e5d94c8ac6934551b8a74272353c7  mesa-17.2.5.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9305523bdf..2667308a67 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.2.4
+MESA3D_VERSION = 17.2.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.11.0
