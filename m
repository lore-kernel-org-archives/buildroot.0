From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:32:54 +0200
Subject: [Buildroot] [git commit] configs/imx6-sabresd_qt5: Select
 LIBV4L_UTILS
Message-ID: <20200411082714.6BBAA8E4DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d37924440b4b8d340e6407014dad42154dfc0e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select LIBV4L_UTILS so that camera capture pipelines can be
configured.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
