From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 18:11:43 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add explanation for the
 AUTORECONF = YES
Message-ID: <20181020161012.DF20D84390@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c12325c8144473b38ea16cee494753243a8e552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/mesa3d.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 0d67dcbf1c..d0f231792e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -10,6 +10,7 @@ MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
+# 0002-configure.ac-invert-order-for-wayland-scanner-check.patch
 MESA3D_AUTORECONF = YES
 
 MESA3D_INSTALL_STAGING = YES
