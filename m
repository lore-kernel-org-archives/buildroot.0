From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  8 Apr 2020 13:51:32 -0300
Subject: [Buildroot] [PATCH 3/5] configs/imx6-sabresd_qt5: Select
 MESA3D_OPENGL_EGL
In-Reply-To: <20200408165134.18337-1-festevam@gmail.com>
References: <20200408165134.18337-1-festevam@gmail.com>
Message-ID: <20200408165134.18337-3-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that MESA3D_OPENGL_EGL is not automatically selected by kmscube,
explicitly select it in the config file.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
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
-- 
2.17.1
