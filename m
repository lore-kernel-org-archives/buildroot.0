From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:32:43 +0200
Subject: [Buildroot] [git commit] configs/engicam_imx6qdl_icore_qt5: Select
 MESA3D_OPENGL_EGL
Message-ID: <20200411082714.63B628E4DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d378900a815c10550d106fdfaec75a13dac266b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that MESA3D_OPENGL_EGL is not automatically selected by the mesa3d
etnaviv driver, explicitly select it in the config file.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/engicam_imx6qdl_icore_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_imx6qdl_icore_qt5_defconfig
index 4d3d4e3a22..62d3008b4d 100644
--- a/configs/engicam_imx6qdl_icore_qt5_defconfig
+++ b/configs/engicam_imx6qdl_icore_qt5_defconfig
@@ -63,6 +63,7 @@ BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
 BR2_PACKAGE_MESA3D_OPENGL_ES=y
+BR2_PACKAGE_MESA3D_OPENGL_EGL=y
 
 # qt5 demo packages
 BR2_PACKAGE_GLMARK2=y
