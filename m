From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  8 Apr 2020 13:51:34 -0300
Subject: [Buildroot] [PATCH 5/5] configs/imx6-sabresd_qt5: Select
 LIBV4L_UTILS
In-Reply-To: <20200408165134.18337-1-festevam@gmail.com>
References: <20200408165134.18337-1-festevam@gmail.com>
Message-ID: <20200408165134.18337-5-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select LIBV4L_UTILS so that camera capture pipelines can be
configured.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6-sabresd_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 647be06d00..0b11225b72 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -65,6 +65,7 @@ BR2_PACKAGE_LIBERATION=y
 BR2_PACKAGE_GLMARK2=y
 BR2_PACKAGE_KMSCUBE=y
 BR2_PACKAGE_LIBV4L=y
+BR2_PACKAGE_LIBV4L_UTILS=y
 BR2_PACKAGE_MESA3D_DEMOS=y
 
 # Qt5
-- 
2.17.1
