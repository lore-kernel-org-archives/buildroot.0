From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 May 2020 23:11:46 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] configs: remove
 BR2_PACKAGE_QT5BASE_LICENSE_APPROVED
Message-ID: <20200507214107.9F2CB88F8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a80cc2ca49cc38d80428b92689a4fdef6552bd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This option has been removed since 6836f2a70acd259a846c88968924d60afef8cc16.

This fixes the new defconfig check.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7a239696d77c192337d80f139ba07a2ebbf72708)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/engicam_imx6qdl_icore_qt5_defconfig | 1 -
 configs/imx6-sabresd_qt5_defconfig          | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_imx6qdl_icore_qt5_defconfig
index 4d3d4e3a22..e0c1fd6a02 100644
--- a/configs/engicam_imx6qdl_icore_qt5_defconfig
+++ b/configs/engicam_imx6qdl_icore_qt5_defconfig
@@ -51,7 +51,6 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # qt5
 BR2_PACKAGE_QT5=y
-BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
 BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
 BR2_PACKAGE_QT5BASE_LINUXFB=y
 BR2_PACKAGE_QT5BASE_FONTCONFIG=y
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 47c00284d9..8fcc4f713d 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -68,7 +68,6 @@ BR2_PACKAGE_MESA3D_DEMOS=y
 
 # Qt5
 BR2_PACKAGE_QT5=y
-BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
 BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
 BR2_PACKAGE_QT5BASE_LINUXFB=y
 BR2_PACKAGE_QT5BASE_FONTCONFIG=y
