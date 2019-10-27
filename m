From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 12:18:27 +0100
Subject: [Buildroot] [git commit] configs/engicam_imx6qdl_icore_qt5: Remove
 the swrast option
Message-ID: <20191027111156.EEF2881423@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=038d25bf0f1c41216a25b2712757400e8f511b6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

i.MX6 has GPU in hardware, so we really don't need to
fallback to software rendering.

Remove the unneeded BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
option.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/engicam_imx6qdl_icore_qt5_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_imx6qdl_icore_qt5_defconfig
index b591c98f23..4d3d4e3a22 100644
--- a/configs/engicam_imx6qdl_icore_qt5_defconfig
+++ b/configs/engicam_imx6qdl_icore_qt5_defconfig
@@ -62,7 +62,6 @@ BR2_PACKAGE_QT5BASE_JPEG=y
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
-BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
 BR2_PACKAGE_MESA3D_OPENGL_ES=y
 
 # qt5 demo packages
