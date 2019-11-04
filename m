From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:12:10 +0100
Subject: [Buildroot] [git commit] package/mesa3d: drop autoreconf
Message-ID: <20191104210544.E5CFA8E6DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67d597666dae15d587c74431fa38b35945a51fb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Obviously, autoreconf is not needed since the switch to meson

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/mesa3d.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3f61253348..3d470baa66 100644
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
 
