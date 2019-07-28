From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jul 2019 11:32:42 +0200
Subject: [Buildroot] [PATCH v5 10/10] package/{mesa3d,
 mesa3d-headers}: bump version to 19.1.3
In-Reply-To: <20190728093242.4481-1-bernd.kuhls@t-online.de>
References: <20190728093242.4481-1-bernd.kuhls@t-online.de>
Message-ID: <20190728093242.4481-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v5: initial version

 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 9d6980c3d7..027de526a2 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.0.8
+MESA3D_HEADERS_VERSION = 19.1.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 0b82342fc6..d7750a9f42 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-June/000525.html
-md5 9634964d87f1ce8d0230493e43f34c50  mesa-19.0.8.tar.xz
-sha1 5fd340a6304f7501014e1bd7291e4cfa7a6efcdb  mesa-19.0.8.tar.xz
-sha256 d017eb53a810c32dabeedf6ca2238ae1e897ce9090e470e9ce1d6c9e3f1b0862  mesa-19.0.8.tar.xz
-sha512 fbddc3a74f223564343027380af776b3fa5d63fe1af4e34121273235d1c6eced96439f601eb19bf658eb927aff3965b520f0329fcbd4650f3112167303e1746d  mesa-19.0.8.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-July/000529.html
+md5 9772ebf9ac40289a62a02c046904c8af  mesa-19.1.3.tar.xz
+sha1 ee3b1b4f9dac391d17b5f5325e41c1d3fcd1e730  mesa-19.1.3.tar.xz
+sha256 845460b2225d15c15d4a9743dec798ff0b7396b533011d43e774e67f7825b7e0  mesa-19.1.3.tar.xz
+sha512 787310c43089142209ff7db298489b0815b630577680d5ce1bc3f796eed3772ba41f03e5e773b77ae084c191ed4e365eac1753166ce60f12b8f5974d55762eeb  mesa-19.1.3.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1f9b85bd8e..0836699fd2 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.0.8
+MESA3D_VERSION = 19.1.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.20.1
