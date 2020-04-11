From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:32:35 +0200
Subject: [Buildroot] [git commit] configs/imx6-sabresd_qt5: Select
 MESA3D_OPENGL_EGL
Message-ID: <20200411082714.5B7BF8E4DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1b4c54254310d15b596d39514b10497e75be5a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that MESA3D_OPENGL_EGL is not automatically selected by the mesa3d
etnaviv driver, explicitly select it in the config file.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx6-sabresd_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 47c00284d9..647be06d00 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -50,6 +50,7 @@ BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
 BR2_PACKAGE_MESA3D_OPENGL_ES=y
+BR2_PACKAGE_MESA3D_OPENGL_EGL=y
 
 # Fonts
 BR2_PACKAGE_BITSTREAM_VERA=y
