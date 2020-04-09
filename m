From: Fabio Estevam <festevam@gmail.com>
Date: Thu,  9 Apr 2020 09:35:17 -0300
Subject: [Buildroot] [PATCH v2 4/5] configs/engicam_imx6qdl_icore_qt5:
 Select MESA3D_OPENGL_EGL
In-Reply-To: <20200409123518.19576-1-festevam@gmail.com>
References: <20200409123518.19576-1-festevam@gmail.com>
Message-ID: <20200409123518.19576-4-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that MESA3D_OPENGL_EGL is not automatically selected by the mesa3d 
etnaviv driver, explicitly select it in the config file.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Mention mesa3d etanviv instead of kmscube in the commit log

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
-- 
2.17.1
