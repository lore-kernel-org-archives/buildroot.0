From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Aug 2020 07:15:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.1.5
Message-ID: <20200806051525.265429-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 2eb18c3dac..92b1db7741 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.1.4
+MESA3D_HEADERS_VERSION = 20.1.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 10baee0aa4..8974fa3cc2 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-July/000591.html
-sha256  6800271c2be2a0447510eb4e9b67edd9521859a4d565310617c4b359eb6799fe  mesa-20.1.4.tar.xz
-sha512  f4d79694cda8531e7560147caf5d18bce5c685cd6c61264dced5adaa9043be9c83d3a2bd623ebffedc8d4258b9b1f97d84d9aeea307aa77cf99d0bc47c987155  mesa-20.1.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-August/000592.html
+sha256  fac1861e6e0bf1aec893f8d86dbfb9d8a0f426ff06b05256df10e3ad7e02c69b  mesa-20.1.5.tar.xz
+sha512  47796bf2cccfd054ff25f571747754e0ab9b42fe87644ea320b3d9497d63b3013e9b7e59ea0516bbd1a38b5594e0d185bf5a36230ea5c5974e7ff889cee2601e  mesa-20.1.5.tar.xz
 
 # License
 sha256  1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4a17b2e7a2..74c5818006 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.1.4
+MESA3D_VERSION = 20.1.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.27.0
