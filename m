From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Nov 2019 23:40:49 +0100
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: drop autoreconf
Message-ID: <20191103224050.19941-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Obviously, autoreconf is not needed since the switch to meson

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mesa3d/mesa3d.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index dd42021f8b..2460932c1b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -10,9 +10,6 @@ MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
-# 0002-configure.ac-invert-order-for-wayland-scanner-check.patch
-# 0003-set-LIBCLC_INCLUDEDIR.patch
-MESA3D_AUTORECONF = YES
 
 MESA3D_INSTALL_STAGING = YES
 
-- 
2.23.0
