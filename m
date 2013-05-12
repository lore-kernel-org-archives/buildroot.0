From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 22:12:50 +0200
Subject: [Buildroot] [git commit] package/x11r7: add license informations to
	xlib_* packages
Message-ID: <20130512202408.5F5379A164@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8d55430c4fbeae42f4879ff3eff305b085d592b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libFS/xlib_libFS.mk             |    2 ++
 package/x11r7/xlib_libICE/xlib_libICE.mk           |    2 ++
 package/x11r7/xlib_libSM/xlib_libSM.mk             |    2 ++
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    2 ++
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |    2 ++
 package/x11r7/xlib_libXau/xlib_libXau.mk           |    2 ++
 package/x11r7/xlib_libXaw/xlib_libXaw.mk           |    2 ++
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |    2 ++
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |    2 ++
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   |    2 ++
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |    2 ++
 package/x11r7/xlib_libXext/xlib_libXext.mk         |    2 ++
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |    2 ++
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    2 ++
 package/x11r7/xlib_libXft/xlib_libXft.mk           |    2 ++
 package/x11r7/xlib_libXi/xlib_libXi.mk             |    2 ++
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    2 ++
 package/x11r7/xlib_libXmu/xlib_libXmu.mk           |    2 ++
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |    2 ++
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk     |    2 ++
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |    2 ++
 package/x11r7/xlib_libXres/xlib_libXres.mk         |    2 ++
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    2 ++
 package/x11r7/xlib_libXtst/xlib_libXtst.mk         |    2 ++
 package/x11r7/xlib_libXv/xlib_libXv.mk             |    2 ++
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk         |    2 ++
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    2 ++
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |    2 ++
 package/x11r7/xlib_libdmx/xlib_libdmx.mk           |    2 ++
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |    2 ++
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    2 ++
 .../xlib_libpthread-stubs/xlib_libpthread-stubs.mk |    2 ++
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |    2 ++
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |    2 ++
 34 files changed, 68 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index 58a87dd..884d68d 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -7,6 +7,8 @@
 XLIB_LIBFS_VERSION = 1.0.4
 XLIB_LIBFS_SOURCE = libFS-$(XLIB_LIBFS_VERSION).tar.bz2
 XLIB_LIBFS_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBFS_LICENSE = MIT
+XLIB_LIBFS_LICENSE_FILES = COPYING
 XLIB_LIBFS_INSTALL_STAGING = YES
 XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xproto_xproto xproto_fontsproto
 XLIB_LIBFS_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index 77fc310..a0f2357 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -7,6 +7,8 @@
 XLIB_LIBICE_VERSION = 1.0.8
 XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.bz2
 XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBICE_LICENSE = MIT
+XLIB_LIBICE_LICENSE_FILES = COPYING
 XLIB_LIBICE_INSTALL_STAGING = YES
 XLIB_LIBICE_DEPENDENCIES = xlib_xtrans xproto_xproto
 
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index ee2d25f..ecc57c6 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -7,6 +7,8 @@
 XLIB_LIBSM_VERSION = 1.2.1
 XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.bz2
 XLIB_LIBSM_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBSM_LICENSE = MIT
+XLIB_LIBSM_LICENSE_FILES = COPYING
 XLIB_LIBSM_INSTALL_STAGING = YES
 XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
 XLIB_LIBSM_CONF_OPT = --without-libuuid
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 3b106cd..2d68f9e 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -7,6 +7,8 @@
 XLIB_LIBX11_VERSION = 1.5.0
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBX11_LICENSE = MIT
+XLIB_LIBX11_LICENSE_FILES = COPYING
 XLIB_LIBX11_INSTALL_STAGING = YES
 XLIB_LIBX11_DEPENDENCIES = \
 	libxcb \
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 3885aa1..2781a14 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXSCRNSAVER_VERSION = 1.2.2
 XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.bz2
 XLIB_LIBXSCRNSAVER_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXSCRNSAVER_LICENSE = MIT
+XLIB_LIBXSCRNSAVER_LICENSE_FILES = COPYING
 XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
 XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_scrnsaverproto
 XLIB_LIBXSCRNSAVER_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index dc7f91e..1f838de 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXAU_VERSION = 1.0.7
 XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.bz2
 XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXAU_LICENSE = MIT
+XLIB_LIBXAU_LICENSE_FILES = COPYING
 XLIB_LIBXAU_INSTALL_STAGING = YES
 XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
 
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index 5e95ae0..c8be85c 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXAW_VERSION = 1.0.11
 XLIB_LIBXAW_SOURCE = libXaw-$(XLIB_LIBXAW_VERSION).tar.bz2
 XLIB_LIBXAW_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXAW_LICENSE = MIT
+XLIB_LIBXAW_LICENSE_FILES = COPYING
 XLIB_LIBXAW_INSTALL_STAGING = YES
 XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto
 XLIB_LIBXAW_CONF_OPT = --disable-docs
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index a6e7c22..8e6c5e2 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXCOMPOSITE_VERSION = 0.4.3
 XLIB_LIBXCOMPOSITE_SOURCE = libXcomposite-$(XLIB_LIBXCOMPOSITE_VERSION).tar.bz2
 XLIB_LIBXCOMPOSITE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXCOMPOSITE_LICENSE = MIT
+XLIB_LIBXCOMPOSITE_LICENSE_FILES = COPYING
 XLIB_LIBXCOMPOSITE_INSTALL_STAGING = YES
 XLIB_LIBXCOMPOSITE_DEPENDENCIES = xproto_compositeproto xlib_libX11 xlib_libXext xlib_libXfixes xproto_xproto
 
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 0b2c8ae..9a73f59 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXCURSOR_VERSION = 1.1.13
 XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.bz2
 XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXCURSOR_LICENSE = MIT
+XLIB_LIBXCURSOR_LICENSE_FILES = COPYING
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
 
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index f4d266e..431248e 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXDAMAGE_VERSION = 1.1.3
 XLIB_LIBXDAMAGE_SOURCE = libXdamage-$(XLIB_LIBXDAMAGE_VERSION).tar.bz2
 XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXDAMAGE_LICENSE = MIT
+XLIB_LIBXDAMAGE_LICENSE_FILES = COPYING
 XLIB_LIBXDAMAGE_INSTALL_STAGING = YES
 XLIB_LIBXDAMAGE_DEPENDENCIES = xproto_damageproto xlib_libX11 xlib_libXfixes xproto_xproto
 
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 1437836..fe6fb6c 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXDMCP_VERSION = 1.1.1
 XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.bz2
 XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXDMCP_LICENSE = MIT
+XLIB_LIBXDMCP_LICENSE_FILES = COPYING
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
 
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 390ed0c..28150ab 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXEXT_VERSION = 1.3.1
 XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.bz2
 XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXEXT_LICENSE = MIT
+XLIB_LIBXEXT_LICENSE_FILES = COPYING
 XLIB_LIBXEXT_INSTALL_STAGING = YES
 XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xproto_xextproto xproto_xproto
 XLIB_LIBXEXT_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index 9b2a309..70abf9a 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXFIXES_VERSION = 5.0
 XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.bz2
 XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXFIXES_LICENSE = MIT
+XLIB_LIBXFIXES_LICENSE_FILES = COPYING
 XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
 
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 72f9416..0d93468 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXFONT_VERSION = 1.4.5
 XLIB_LIBXFONT_SOURCE = libXfont-$(XLIB_LIBXFONT_VERSION).tar.bz2
 XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXFONT_LICENSE = MIT
+XLIB_LIBXFONT_LICENSE_FILES = COPYING
 XLIB_LIBXFONT_AUTORECONF = YES
 XLIB_LIBXFONT_INSTALL_STAGING = YES
 XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontsproto xproto_xproto xfont_encodings
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index 9bf10ef..2c5281a 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXFT_VERSION = 2.3.1
 XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.bz2
 XLIB_LIBXFT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXFT_LICENSE = MIT
+XLIB_LIBXFT_LICENSE_FILES = COPYING
 XLIB_LIBXFT_AUTORECONF = YES
 XLIB_LIBXFT_INSTALL_STAGING = YES
 XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index b258883..193fb97 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXI_VERSION = 1.6.1
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
 XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXI_LICENSE = MIT
+XLIB_LIBXI_LICENSE_FILES = COPYING
 XLIB_LIBXI_INSTALL_STAGING = YES
 XLIB_LIBXI_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXext xproto_xproto
 XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index ae3d41a..98ac136 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXINERAMA_VERSION = 1.1.2
 XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.bz2
 XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXINERAMA_LICENSE = MIT
+XLIB_LIBXINERAMA_LICENSE_FILES = COPYING
 XLIB_LIBXINERAMA_INSTALL_STAGING = YES
 XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xineramaproto
 XLIB_LIBXINERAMA_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index fd2a679..b067f8d 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXMU_VERSION = 1.1.1
 XLIB_LIBXMU_SOURCE = libXmu-$(XLIB_LIBXMU_VERSION).tar.bz2
 XLIB_LIBXMU_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXMU_LICENSE = MIT
+XLIB_LIBXMU_LICENSE_FILES = COPYING
 XLIB_LIBXMU_INSTALL_STAGING = YES
 XLIB_LIBXMU_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
 
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index bef2d01..1d1d017 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXPM_VERSION = 3.5.10
 XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.bz2
 XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXPM_LICENSE = MIT
+XLIB_LIBXPM_LICENSE_FILES = COPYING
 XLIB_LIBXPM_INSTALL_STAGING = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
 
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 6c3fdbf..e5673c8 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXRANDR_VERSION = 1.3.2
 XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.bz2
 XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXRANDR_LICENSE = MIT
+XLIB_LIBXRANDR_LICENSE_FILES = COPYING
 XLIB_LIBXRANDR_INSTALL_STAGING = YES
 XLIB_LIBXRANDR_DEPENDENCIES = xproto_randrproto xlib_libX11 xlib_libXext xlib_libXrender xproto_renderproto xproto_xproto
 XLIB_LIBXRANDR_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index fbd5015..4398af5 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXRENDER_VERSION = 0.9.7
 XLIB_LIBXRENDER_SOURCE = libXrender-$(XLIB_LIBXRENDER_VERSION).tar.bz2
 XLIB_LIBXRENDER_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXRENDER_LICENSE = MIT
+XLIB_LIBXRENDER_LICENSE_FILES = COPYING
 XLIB_LIBXRENDER_INSTALL_STAGING = YES
 XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
 XLIB_LIBXRENDER_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index d2d492f..a272841 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXRES_VERSION = 1.0.6
 XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.bz2
 XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXRES_LICENSE = MIT
+XLIB_LIBXRES_LICENSE_FILES = COPYING
 XLIB_LIBXRES_INSTALL_STAGING = YES
 XLIB_LIBXRES_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_resourceproto xproto_xproto
 XLIB_LIBXRES_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 9f9aaea..76c0489 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXT_VERSION = 1.1.3
 XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
 XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXT_LICENSE = MIT
+XLIB_LIBXT_LICENSE_FILES = COPYING
 XLIB_LIBXT_INSTALL_STAGING = YES
 XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb host-xproto_xproto
 XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --disable-install-makestrs
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index 8ca44b7..055b4c3 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXTST_VERSION = 1.2.1
 XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.bz2
 XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXTST_LICENSE = MIT
+XLIB_LIBXTST_LICENSE_FILES = COPYING
 XLIB_LIBXTST_INSTALL_STAGING = YES
 
 XLIB_LIBXTST_DEPENDENCIES = \
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index 06c1145..a64d980 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXV_VERSION = 1.0.7
 XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.bz2
 XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXV_LICENSE = MIT
+XLIB_LIBXV_LICENSE_FILES = COPYING
 XLIB_LIBXV_INSTALL_STAGING = YES
 XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_videoproto xproto_xproto
 XLIB_LIBXV_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index 5b92612..18bfbef 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXVMC_VERSION = 1.0.7
 XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.bz2
 XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXVMC_LICENSE = MIT
+XLIB_LIBXVMC_LICENSE_FILES = COPYING
 XLIB_LIBXVMC_INSTALL_STAGING = YES
 XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xproto_videoproto xproto_xproto
 XLIB_LIBXVMC_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index d57b794..ba2aed4 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXXF86DGA_VERSION = 1.1.3
 XLIB_LIBXXF86DGA_SOURCE = libXxf86dga-$(XLIB_LIBXXF86DGA_VERSION).tar.bz2
 XLIB_LIBXXF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXXF86DGA_LICENSE = MIT
+XLIB_LIBXXF86DGA_LICENSE_FILES = COPYING
 XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
 XLIB_LIBXXF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86dgaproto xproto_xproto
 XLIB_LIBXXF86DGA_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index f032b06..2ed7eda 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXXF86VM_VERSION = 1.1.2
 XLIB_LIBXXF86VM_SOURCE = libXxf86vm-$(XLIB_LIBXXF86VM_VERSION).tar.bz2
 XLIB_LIBXXF86VM_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXXF86VM_LICENSE = MIT
+XLIB_LIBXXF86VM_LICENSE_FILES = COPYING
 XLIB_LIBXXF86VM_INSTALL_STAGING = YES
 XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86vidmodeproto xproto_xproto
 XLIB_LIBXXF86VM_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index 0b21f8d..71a49c9 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -7,6 +7,8 @@
 XLIB_LIBDMX_VERSION = 1.1.2
 XLIB_LIBDMX_SOURCE = libdmx-$(XLIB_LIBDMX_VERSION).tar.bz2
 XLIB_LIBDMX_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBDMX_LICENSE = MIT
+XLIB_LIBDMX_LICENSE_FILES = COPYING
 XLIB_LIBDMX_INSTALL_STAGING = YES
 XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
 XLIB_LIBDMX_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index 191db88..4169e90 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -7,6 +7,8 @@
 XLIB_LIBFONTENC_VERSION = 1.1.1
 XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.bz2
 XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBFONTENC_LICENSE = MIT
+XLIB_LIBFONTENC_LICENSE_FILES = COPYING
 XLIB_LIBFONTENC_INSTALL_STAGING = YES
 XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
 
diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
index f2a5d24..64224b1 100644
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
+++ b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
@@ -7,6 +7,8 @@
 XLIB_LIBPCIACCESS_VERSION = 0.13.1
 XLIB_LIBPCIACCESS_SOURCE = libpciaccess-$(XLIB_LIBPCIACCESS_VERSION).tar.bz2
 XLIB_LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBPCIACCESS_LICENSE = MIT
+XLIB_LIBPCIACCESS_LICENSE_FILES = COPYING
 XLIB_LIBPCIACCESS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
index 909253c..d48272a 100644
--- a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
+++ b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
@@ -6,6 +6,8 @@
 XLIB_LIBPTHREAD_STUBS_VERSION = 0.3
 XLIB_LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(XLIB_LIBPTHREAD_STUBS_VERSION).tar.bz2
 XLIB_LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
+XLIB_LIBPTHREAD_STUBS_LICENSE = MIT
+XLIB_LIBPTHREAD_STUBS_LICENSE_FILES = COPYING
 
 XLIB_LIBPTHREAD_STUBS_INSTALL_STAGING = YES
 
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index bd63961..00395c5 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -7,6 +7,8 @@
 XLIB_LIBXKBFILE_VERSION = 1.0.8
 XLIB_LIBXKBFILE_SOURCE = libxkbfile-$(XLIB_LIBXKBFILE_VERSION).tar.bz2
 XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXKBFILE_LICENSE = MIT
+XLIB_LIBXKBFILE_LICENSE_FILES = COPYING
 XLIB_LIBXKBFILE_INSTALL_STAGING = YES
 XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xproto_kbproto
 
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index 1d2d68a..7cb1a58 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -7,6 +7,8 @@
 XLIB_XTRANS_VERSION = 1.2.7
 XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
 XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_XTRANS_LICENSE = MIT
+XLIB_XTRANS_LICENSE_FILES = COPYING
 XLIB_XTRANS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
