From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  3 Oct 2017 10:27:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
	mesa3d-headers}: bump version to 17.2.2
Message-ID: <20171003082718.22619-1-bernd.kuhls@t-online.de>
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
index eeb4ba7037..198f2faad8 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.2.1
+MESA3D_HEADERS_VERSION = 17.2.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 2e3f54a95a..d223b110af 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-September/000359.html
-md5 f53ed38110237d9df5f9198c09ef0ab0  mesa-17.2.1.tar.xz
-sha1 7429e74a0ef12ea9d60b41b2b852898b3da0b238  mesa-17.2.1.tar.xz
-sha256 77385d17827cff24a3bae134342234f2efe7f7f990e778109682571dbbc9ba1e  mesa-17.2.1.tar.xz
-sha512 19a7d6c2e2d439b1c73199bffd4154b42017bccc138be954a893c3b70e885f07988de84dc8aa2aff36e06295e91f0181d5b95372152f6f0f80b7afe4b3846b6a  mesa-17.2.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-October/000363.html
+md5 1a157b5baefb5adf9f4fbb8a6632d74c  mesa-17.2.2.tar.xz
+sha1 d1038ed722031210ee7284a1c88fd6fa68fdb93f  mesa-17.2.2.tar.xz
+sha256 cf522244d6a5a1ecde3fc00e7c96935253fe22f808f064cab98be6f3faa65782  mesa-17.2.2.tar.xz
+sha512 641342c68989b8d801c37e668b012d3b7c4ad43d8ca01b74f8cbb3a1ec25b7390f69fe7ebc84b29dab1c6a4ac01c882ec9fd4a6b331505629461bdbbe6aa3f7e  mesa-17.2.2.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 83c83f14f9..8769267ada 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.2.1
+MESA3D_VERSION = 17.2.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.11.0
