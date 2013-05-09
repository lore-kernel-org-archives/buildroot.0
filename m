From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 May 2013 17:50:56 +0200
Subject: [Buildroot] [PATCH 01/12] package/x11r7: add license informations
	to xapp_* packages
In-Reply-To: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368114667-14476-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_appres/xapp_appres.mk           |    2 ++
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk       |    2 ++
 package/x11r7/xapp_beforelight/xapp_beforelight.mk |    2 ++
 package/x11r7/xapp_bitmap/xapp_bitmap.mk           |    2 ++
 package/x11r7/xapp_editres/xapp_editres.mk         |    2 ++
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   |    2 ++
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk     |    2 ++
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk         |    2 ++
 package/x11r7/xapp_iceauth/xapp_iceauth.mk         |    2 ++
 package/x11r7/xapp_ico/xapp_ico.mk                 |    2 ++
 package/x11r7/xapp_listres/xapp_listres.mk         |    2 ++
 package/x11r7/xapp_luit/xapp_luit.mk               |    2 ++
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk     |    2 ++
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |    2 ++
 package/x11r7/xapp_oclock/xapp_oclock.mk           |    2 ++
 package/x11r7/xapp_rgb/xapp_rgb.mk                 |    2 ++
 package/x11r7/xapp_rstart/xapp_rstart.mk           |    2 ++
 package/x11r7/xapp_scripts/xapp_scripts.mk         |    2 ++
 package/x11r7/xapp_sessreg/xapp_sessreg.mk         |    2 ++
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk     |    2 ++
 package/x11r7/xapp_showfont/xapp_showfont.mk       |    2 ++
 package/x11r7/xapp_smproxy/xapp_smproxy.mk         |    2 ++
 package/x11r7/xapp_twm/xapp_twm.mk                 |    2 ++
 package/x11r7/xapp_viewres/xapp_viewres.mk         |    2 ++
 package/x11r7/xapp_x11perf/xapp_x11perf.mk         |    2 ++
 package/x11r7/xapp_xauth/xapp_xauth.mk             |    2 ++
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk   |    2 ++
 package/x11r7/xapp_xbiff/xapp_xbiff.mk             |    2 ++
 package/x11r7/xapp_xcalc/xapp_xcalc.mk             |    2 ++
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk   |    2 ++
 package/x11r7/xapp_xclock/xapp_xclock.mk           |    2 ++
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk           |    2 ++
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   |    2 ++
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk     |    2 ++
 package/x11r7/xapp_xditview/xapp_xditview.mk       |    2 ++
 package/x11r7/xapp_xdm/xapp_xdm.mk                 |    2 ++
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk       |    2 ++
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk       |    2 ++
 package/x11r7/xapp_xedit/xapp_xedit.mk             |    2 ++
 package/x11r7/xapp_xev/xapp_xev.mk                 |    2 ++
 package/x11r7/xapp_xeyes/xapp_xeyes.mk             |    2 ++
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk         |    2 ++
 package/x11r7/xapp_xfd/xapp_xfd.mk                 |    2 ++
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk       |    2 ++
 package/x11r7/xapp_xfs/xapp_xfs.mk                 |    2 ++
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk         |    2 ++
 package/x11r7/xapp_xgamma/xapp_xgamma.mk           |    2 ++
 package/x11r7/xapp_xgc/xapp_xgc.mk                 |    2 ++
 package/x11r7/xapp_xhost/xapp_xhost.mk             |    2 ++
 .../xapp_xinput-calibrator.mk                      |    2 ++
 package/x11r7/xapp_xinput/xapp_xinput.mk           |    2 ++
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk         |    2 ++
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk           |    2 ++
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk       |    2 ++
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk       |    2 ++
 package/x11r7/xapp_xkill/xapp_xkill.mk             |    2 ++
 package/x11r7/xapp_xload/xapp_xload.mk             |    2 ++
 package/x11r7/xapp_xlogo/xapp_xlogo.mk             |    2 ++
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk       |    2 ++
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk   |    2 ++
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk       |    2 ++
 package/x11r7/xapp_xmag/xapp_xmag.mk               |    2 ++
 package/x11r7/xapp_xman/xapp_xman.mk               |    2 ++
 package/x11r7/xapp_xmessage/xapp_xmessage.mk       |    2 ++
 package/x11r7/xapp_xmh/xapp_xmh.mk                 |    2 ++
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk         |    2 ++
 package/x11r7/xapp_xmore/xapp_xmore.mk             |    2 ++
 package/x11r7/xapp_xpr/xapp_xpr.mk                 |    2 ++
 package/x11r7/xapp_xprop/xapp_xprop.mk             |    2 ++
 package/x11r7/xapp_xrandr/xapp_xrandr.mk           |    2 ++
 package/x11r7/xapp_xrdb/xapp_xrdb.mk               |    2 ++
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk       |    2 ++
 package/x11r7/xapp_xset/xapp_xset.mk               |    2 ++
 package/x11r7/xapp_xsetmode/xapp_xsetmode.mk       |    2 ++
 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk |    2 ++
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk       |    2 ++
 package/x11r7/xapp_xsm/xapp_xsm.mk                 |    2 ++
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk       |    2 ++
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk       |    2 ++
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk           |    2 ++
 package/x11r7/xapp_xwd/xapp_xwd.mk                 |    2 ++
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk       |    2 ++
 package/x11r7/xapp_xwud/xapp_xwud.mk               |    2 ++
 83 files changed, 166 insertions(+)

diff --git a/package/x11r7/xapp_appres/xapp_appres.mk b/package/x11r7/xapp_appres/xapp_appres.mk
index 77b2546..c9d7fe9 100644
--- a/package/x11r7/xapp_appres/xapp_appres.mk
+++ b/package/x11r7/xapp_appres/xapp_appres.mk
@@ -7,6 +7,8 @@
 XAPP_APPRES_VERSION = 1.0.1
 XAPP_APPRES_SOURCE = appres-$(XAPP_APPRES_VERSION).tar.bz2
 XAPP_APPRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_APPRES_LICENSE = MIT
+XAPP_APPRES_LICENSE_FILES = COPYING
 XAPP_APPRES_DEPENDENCIES = xlib_libX11 xlib_libXt
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index 739b4a9..1e2f81a 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -7,6 +7,8 @@
 XAPP_BDFTOPCF_VERSION = 1.0.3
 XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.bz2
 XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_BDFTOPCF_LICENSE = MIT
+XAPP_BDFTOPCF_LICENSE_FILES = COPYING
 XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.mk b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
index 835f7f3..e07696d 100644
--- a/package/x11r7/xapp_beforelight/xapp_beforelight.mk
+++ b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
@@ -7,6 +7,8 @@
 XAPP_BEFORELIGHT_VERSION = 1.0.2
 XAPP_BEFORELIGHT_SOURCE = beforelight-$(XAPP_BEFORELIGHT_VERSION).tar.bz2
 XAPP_BEFORELIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_BEFORELIGHT_LICENSE = MIT
+XAPP_BEFORELIGHT_LICENSE_FILES = COPYING
 XAPP_BEFORELIGHT_DEPENDENCIES = xlib_libX11 xlib_libXScrnSaver xlib_libXaw xlib_libXt
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
index 1ce450a..8c73fe2 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
@@ -7,6 +7,8 @@
 XAPP_BITMAP_VERSION = 1.0.6
 XAPP_BITMAP_SOURCE = bitmap-$(XAPP_BITMAP_VERSION).tar.bz2
 XAPP_BITMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_BITMAP_LICENSE = MIT
+XAPP_BITMAP_LICENSE_FILES = COPYING
 XAPP_BITMAP_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xdata_xbitmaps
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_editres/xapp_editres.mk b/package/x11r7/xapp_editres/xapp_editres.mk
index 440ce61..a4807b8 100644
--- a/package/x11r7/xapp_editres/xapp_editres.mk
+++ b/package/x11r7/xapp_editres/xapp_editres.mk
@@ -7,6 +7,8 @@
 XAPP_EDITRES_VERSION = 1.0.5
 XAPP_EDITRES_SOURCE = editres-$(XAPP_EDITRES_VERSION).tar.bz2
 XAPP_EDITRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_EDITRES_LICENSE = MIT
+XAPP_EDITRES_LICENSE_FILES = COPYING
 XAPP_EDITRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index b41f201..719077c 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -7,6 +7,8 @@
 XAPP_FONTTOSFNT_VERSION = 1.0.3
 XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
 XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_FONTTOSFNT_LICENSE = MIT
+XAPP_FONTTOSFNT_LICENSE_FILES = COPYING
 XAPP_FONTTOSFNT_DEPENDENCIES = freetype xlib_libX11 xlib_libfontenc
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
index b92f928..1815779 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
@@ -7,6 +7,8 @@
 XAPP_FSLSFONTS_VERSION = 1.0.1
 XAPP_FSLSFONTS_SOURCE = fslsfonts-$(XAPP_FSLSFONTS_VERSION).tar.bz2
 XAPP_FSLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_FSLSFONTS_LICENSE = MIT
+XAPP_FSLSFONTS_LICENSE_FILES = COPYING
 XAPP_FSLSFONTS_DEPENDENCIES = xlib_libFS xlib_libX11
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
index 8c37b99..2d00af0 100644
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
+++ b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
@@ -7,6 +7,8 @@
 XAPP_FSTOBDF_VERSION = 1.0.2
 XAPP_FSTOBDF_SOURCE = fstobdf-$(XAPP_FSTOBDF_VERSION).tar.bz2
 XAPP_FSTOBDF_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_FSTOBDF_LICENSE = MIT
+XAPP_FSTOBDF_LICENSE_FILES = COPYING
 XAPP_FSTOBDF_DEPENDENCIES = xlib_libFS xlib_libX11
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
index a42e5bd..bf0445e 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.mk
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
@@ -7,6 +7,8 @@
 XAPP_ICEAUTH_VERSION = 1.0.5
 XAPP_ICEAUTH_SOURCE = iceauth-$(XAPP_ICEAUTH_VERSION).tar.bz2
 XAPP_ICEAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_ICEAUTH_LICENSE = MIT
+XAPP_ICEAUTH_LICENSE_FILES = COPYING
 XAPP_ICEAUTH_DEPENDENCIES = xlib_libICE xlib_libX11
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_ico/xapp_ico.mk b/package/x11r7/xapp_ico/xapp_ico.mk
index 80f4a8e..6628efe 100644
--- a/package/x11r7/xapp_ico/xapp_ico.mk
+++ b/package/x11r7/xapp_ico/xapp_ico.mk
@@ -7,6 +7,8 @@
 XAPP_ICO_VERSION = 1.0.2
 XAPP_ICO_SOURCE = ico-$(XAPP_ICO_VERSION).tar.bz2
 XAPP_ICO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_ICO_LICENSE = MIT
+XAPP_ICO_LICENSE_FILES = COPYING
 XAPP_ICO_DEPENDENCIES = xlib_libX11
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_listres/xapp_listres.mk b/package/x11r7/xapp_listres/xapp_listres.mk
index 1a3247b..7b7e364 100644
--- a/package/x11r7/xapp_listres/xapp_listres.mk
+++ b/package/x11r7/xapp_listres/xapp_listres.mk
@@ -7,6 +7,8 @@
 XAPP_LISTRES_VERSION = 1.0.3
 XAPP_LISTRES_SOURCE = listres-$(XAPP_LISTRES_VERSION).tar.bz2
 XAPP_LISTRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_LISTRES_LICENSE = MIT
+XAPP_LISTRES_LICENSE_FILES = COPYING
 XAPP_LISTRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_luit/xapp_luit.mk b/package/x11r7/xapp_luit/xapp_luit.mk
index ddb7883..2420897 100644
--- a/package/x11r7/xapp_luit/xapp_luit.mk
+++ b/package/x11r7/xapp_luit/xapp_luit.mk
@@ -7,6 +7,8 @@
 XAPP_LUIT_VERSION = 1.1.1
 XAPP_LUIT_SOURCE = luit-$(XAPP_LUIT_VERSION).tar.bz2
 XAPP_LUIT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_LUIT_LICENSE = MIT
+XAPP_LUIT_LICENSE_FILES = COPYING
 XAPP_LUIT_DEPENDENCIES = xlib_libX11 xlib_libfontenc
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index e32ed85..15e65c1 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -7,6 +7,8 @@
 XAPP_MKFONTDIR_VERSION = 1.0.7
 XAPP_MKFONTDIR_SOURCE = mkfontdir-$(XAPP_MKFONTDIR_VERSION).tar.bz2
 XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_MKFONTDIR_LICENSE = MIT
+XAPP_MKFONTDIR_LICENSE_FILES = COPYING
 XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index 2f299a6..b15fc56 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -7,6 +7,8 @@
 XAPP_MKFONTSCALE_VERSION = 1.1.0
 XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
 XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_MKFONTSCALE_LICENSE = MIT
+XAPP_MKFONTSCALE_LICENSE_FILES = COPYING
 XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.mk b/package/x11r7/xapp_oclock/xapp_oclock.mk
index 9f09c7f..5d40ab9 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.mk
+++ b/package/x11r7/xapp_oclock/xapp_oclock.mk
@@ -7,6 +7,8 @@
 XAPP_OCLOCK_VERSION = 1.0.1
 XAPP_OCLOCK_SOURCE = oclock-$(XAPP_OCLOCK_VERSION).tar.bz2
 XAPP_OCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_OCLOCK_LICENSE = MIT
+XAPP_OCLOCK_LICENSE_FILES = COPYING
 XAPP_OCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
index c9a8ad7..2fd8c17 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.mk
+++ b/package/x11r7/xapp_rgb/xapp_rgb.mk
@@ -7,6 +7,8 @@
 XAPP_RGB_VERSION = 1.0.1
 XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.bz2
 XAPP_RGB_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_RGB_LICENSE = MIT
+XAPP_RGB_LICENSE_FILES = COPYING
 XAPP_RGB_DEPENDENCIES = xproto_xproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_rstart/xapp_rstart.mk b/package/x11r7/xapp_rstart/xapp_rstart.mk
index cce5c03..9f08f17 100644
--- a/package/x11r7/xapp_rstart/xapp_rstart.mk
+++ b/package/x11r7/xapp_rstart/xapp_rstart.mk
@@ -7,6 +7,8 @@
 XAPP_RSTART_VERSION = 1.0.2
 XAPP_RSTART_SOURCE = rstart-$(XAPP_RSTART_VERSION).tar.bz2
 XAPP_RSTART_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_RSTART_LICENSE = MIT
+XAPP_RSTART_LICENSE_FILES = COPYING
 XAPP_RSTART_DEPENDENCIES = xlib_libX11
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_scripts/xapp_scripts.mk b/package/x11r7/xapp_scripts/xapp_scripts.mk
index a505098..d444344 100644
--- a/package/x11r7/xapp_scripts/xapp_scripts.mk
+++ b/package/x11r7/xapp_scripts/xapp_scripts.mk
@@ -7,6 +7,8 @@
 XAPP_SCRIPTS_VERSION = 1.0.1
 XAPP_SCRIPTS_SOURCE = scripts-$(XAPP_SCRIPTS_VERSION).tar.bz2
 XAPP_SCRIPTS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SCRIPTS_LICENSE = MIT
+XAPP_SCRIPTS_LICENSE_FILES = COPYING
 XAPP_SCRIPTS_DEPENDENCIES = xlib_libX11
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index 6f7fd88..c9de815 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -7,6 +7,8 @@
 XAPP_SESSREG_VERSION = 1.0.7
 XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.bz2
 XAPP_SESSREG_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SESSREG_LICENSE = MIT
+XAPP_SESSREG_LICENSE_FILES = COPYING
 XAPP_SESSREG_DEPENDENCIES = xlib_libX11 xproto_xproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
index 1f1e5d3..77e271d 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
@@ -7,6 +7,8 @@
 XAPP_SETXKBMAP_VERSION = 1.3.0
 XAPP_SETXKBMAP_SOURCE = setxkbmap-$(XAPP_SETXKBMAP_VERSION).tar.bz2
 XAPP_SETXKBMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SETXKBMAP_LICENSE = MIT
+XAPP_SETXKBMAP_LICENSE_FILES = COPYING
 XAPP_SETXKBMAP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
index 54d4466..b183e91 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ b/package/x11r7/xapp_showfont/xapp_showfont.mk
@@ -7,6 +7,8 @@
 XAPP_SHOWFONT_VERSION = 1.0.1
 XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.bz2
 XAPP_SHOWFONT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SHOWFONT_LICENSE = MIT
+XAPP_SHOWFONT_LICENSE_FILES = COPYING
 XAPP_SHOWFONT_DEPENDENCIES = xlib_libFS
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
index 11c470d..8e822cf 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
@@ -7,6 +7,8 @@
 XAPP_SMPROXY_VERSION = 1.0.5
 XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.bz2
 XAPP_SMPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SMPROXY_LICENSE = MIT
+XAPP_SMPROXY_LICENSE_FILES = COPYING
 XAPP_SMPROXY_DEPENDENCIES = xlib_libXmu xlib_libXt
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index 9474eca..6e348a9 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -7,6 +7,8 @@
 XAPP_TWM_VERSION = 1.0.6
 XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.bz2
 XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_TWM_LICENSE = MIT
+XAPP_TWM_LICENSE_FILES = COPYING
 XAPP_TWM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index 04ba936..8c8bdd1 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -7,6 +7,8 @@
 XAPP_VIEWRES_VERSION = 1.0.3
 XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.bz2
 XAPP_VIEWRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_VIEWRES_LICENSE = MIT
+XAPP_VIEWRES_LICENSE_FILES = COPYING
 XAPP_VIEWRES_DEPENDENCIES = xlib_libXaw
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index 33e8628..e1a50e6 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -7,6 +7,8 @@
 XAPP_X11PERF_VERSION = 1.5.4
 XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.bz2
 XAPP_X11PERF_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_X11PERF_LICENSE = MIT
+XAPP_X11PERF_LICENSE_FILES = COPYING
 XAPP_X11PERF_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXft
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index a34ec00..d7a871c 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -7,6 +7,8 @@
 XAPP_XAUTH_VERSION = 1.0.7
 XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
 XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XAUTH_LICENSE = MIT
+XAPP_XAUTH_LICENSE_FILES = COPYING
 XAPP_XAUTH_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index 52b0dec..33ae12e 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -7,6 +7,8 @@
 XAPP_XBACKLIGHT_VERSION = 1.1.2
 XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.bz2
 XAPP_XBACKLIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XBACKLIGHT_LICENSE = MIT
+XAPP_XBACKLIGHT_LICENSE_FILES = COPYING
 XAPP_XBACKLIGHT_DEPENDENCIES = xlib_libX11 xlib_libXrandr xlib_libXrender
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
index c6f2d70..8192d6d 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.mk
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
@@ -7,6 +7,8 @@
 XAPP_XBIFF_VERSION = 1.0.3
 XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.bz2
 XAPP_XBIFF_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XBIFF_LICENSE = MIT
+XAPP_XBIFF_LICENSE_FILES = COPYING
 XAPP_XBIFF_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.mk b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
index ec2e5ad..ecadec7 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.mk
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
@@ -7,6 +7,8 @@
 XAPP_XCALC_VERSION = 1.0.2
 XAPP_XCALC_SOURCE = xcalc-$(XAPP_XCALC_VERSION).tar.bz2
 XAPP_XCALC_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCALC_LICENSE = MIT
+XAPP_XCALC_LICENSE_FILES = COPYING
 XAPP_XCALC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec install-data
 XAPP_XCALC_DEPENDENCIES = xlib_libXaw
 
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index 1fb7ca4..8accd7e 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -7,6 +7,8 @@
 XAPP_XCLIPBOARD_VERSION = 1.1.2
 XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.bz2
 XAPP_XCLIPBOARD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCLIPBOARD_LICENSE = MIT
+XAPP_XCLIPBOARD_LICENSE_FILES = COPYING
 XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw xlib_libXmu xlib_libXt
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xclock/xapp_xclock.mk b/package/x11r7/xapp_xclock/xapp_xclock.mk
index 6d7bf65..e8ca932 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.mk
+++ b/package/x11r7/xapp_xclock/xapp_xclock.mk
@@ -7,6 +7,8 @@
 XAPP_XCLOCK_VERSION = 1.0.6
 XAPP_XCLOCK_SOURCE = xclock-$(XAPP_XCLOCK_VERSION).tar.bz2
 XAPP_XCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCLOCK_LICENSE = MIT
+XAPP_XCLOCK_LICENSE_FILES = COPYING
 XAPP_XCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXft xlib_libXrender xlib_libxkbfile
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
index 7b513a8..889e1ea 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
@@ -7,6 +7,8 @@
 XAPP_XCMSDB_VERSION = 1.0.4
 XAPP_XCMSDB_SOURCE = xcmsdb-$(XAPP_XCMSDB_VERSION).tar.bz2
 XAPP_XCMSDB_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCMSDB_LICENSE = MIT
+XAPP_XCMSDB_LICENSE_FILES = COPYING
 XAPP_XCMSDB_DEPENDENCIES = xlib_libX11
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index c0dc8d1..e4be4c6 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -7,6 +7,8 @@
 XAPP_XCURSORGEN_VERSION = 1.0.5
 XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.bz2
 XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCURSORGEN_LICENSE = MIT
+XAPP_XCURSORGEN_LICENSE_FILES = COPYING
 XAPP_XCURSORGEN_DEPENDENCIES = libpng xlib_libX11 xlib_libXcursor
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
index f5925fc..201990a 100644
--- a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
+++ b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
@@ -7,6 +7,8 @@
 XAPP_XDBEDIZZY_VERSION = 1.0.2
 XAPP_XDBEDIZZY_SOURCE = xdbedizzy-$(XAPP_XDBEDIZZY_VERSION).tar.bz2
 XAPP_XDBEDIZZY_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDBEDIZZY_LICENSE = MIT
+XAPP_XDBEDIZZY_LICENSE_FILES = COPYING
 XAPP_XDBEDIZZY_DEPENDENCIES = xlib_libXext
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
index 773ed21..f228f0b 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ b/package/x11r7/xapp_xditview/xapp_xditview.mk
@@ -7,6 +7,8 @@
 XAPP_XDITVIEW_VERSION = 1.0.2
 XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.bz2
 XAPP_XDITVIEW_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDITVIEW_LICENSE = MIT
+XAPP_XDITVIEW_LICENSE_FILES = COPYING
 XAPP_XDITVIEW_DEPENDENCIES = xlib_libXaw
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 1c74708..c131d22 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -7,6 +7,8 @@
 XAPP_XDM_VERSION = 1.1.11
 XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.bz2
 XAPP_XDM_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDM_LICENSE = MIT
+XAPP_XDM_LICENSE_FILES = COPYING
 XAPP_XDM_CONF_ENV = ac_cv_file__dev_urandom=yes
 XAPP_XDM_DEPENDENCIES = xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libXdmcp xlib_libXinerama xlib_libXt xproto_xineramaproto xproto_xproto
 XAPP_XDM_CONF_OPT = --with-utmp-file=/var/adm/utmpx \
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index 0b724de..a47879a 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -7,6 +7,8 @@
 XAPP_XDPYINFO_VERSION = 1.3.0
 XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.bz2
 XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDPYINFO_LICENSE = MIT
+XAPP_XDPYINFO_LICENSE_FILES = COPYING
 XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_renderproto xproto_xf86dgaproto xproto_xf86vidmodeproto xlib_libdmx
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index 67b0069..e88e0bf 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -7,6 +7,8 @@
 XAPP_XDRIINFO_VERSION = 1.0.4
 XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.bz2
 XAPP_XDRIINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDRIINFO_LICENSE = MIT
+XAPP_XDRIINFO_LICENSE_FILES = COPYING
 XAPP_XDRIINFO_DEPENDENCIES = xlib_libX11 xproto_glproto mesa3d
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index 3e26f36..4c70002 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -7,6 +7,8 @@
 XAPP_XEDIT_VERSION = 1.2.0
 XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.bz2
 XAPP_XEDIT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XEDIT_LICENSE = MIT
+XAPP_XEDIT_LICENSE_FILES = COPYING
 XAPP_XEDIT_DEPENDENCIES = xlib_libXaw 
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index dd7c798..7e7a1b5 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -7,6 +7,8 @@
 XAPP_XEV_VERSION = 1.2.0
 XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.bz2
 XAPP_XEV_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XEV_LICENSE = MIT
+XAPP_XEV_LICENSE_FILES = COPYING
 XAPP_XEV_DEPENDENCIES = xlib_libX11 xlib_libXrandr
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 94bd390..3458c57 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -7,6 +7,8 @@
 XAPP_XEYES_VERSION = 1.0.1
 XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
 XAPP_XEYES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XEYES_LICENSE = MIT
+XAPP_XEYES_LICENSE_FILES = COPYING
 XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXt
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
index ea00d9c..e185466 100644
--- a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
+++ b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
@@ -7,6 +7,8 @@
 XAPP_XF86DGA_VERSION = 1.0.2
 XAPP_XF86DGA_SOURCE = xf86dga-$(XAPP_XF86DGA_VERSION).tar.bz2
 XAPP_XF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XF86DGA_LICENSE = MIT
+XAPP_XF86DGA_LICENSE_FILES = COPYING
 XAPP_XF86DGA_DEPENDENCIES = \
 	host-pkgconf \
 	xlib_libX11 \
diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index 72c1aca..47a274c 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -7,6 +7,8 @@
 XAPP_XFD_VERSION = 1.1.1
 XAPP_XFD_SOURCE = xfd-$(XAPP_XFD_VERSION).tar.bz2
 XAPP_XFD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFD_LICENSE = MIT
+XAPP_XFD_LICENSE_FILES = COPYING
 XAPP_XFD_DEPENDENCIES = freetype fontconfig xlib_libXaw xlib_libXft
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index d4d9ca1..6b685e8 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -7,6 +7,8 @@
 XAPP_XFONTSEL_VERSION = 1.0.4
 XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.bz2
 XAPP_XFONTSEL_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFONTSEL_LICENSE = MIT
+XAPP_XFONTSEL_LICENSE_FILES = COPYING
 XAPP_XFONTSEL_DEPENDENCIES = xlib_libXaw
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index b49b8ba..83cb59a 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -7,6 +7,8 @@
 XAPP_XFS_VERSION = 1.0.5
 XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
 XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFS_LICENSE = MIT
+XAPP_XFS_LICENSE_FILES = COPYING
 XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont xproto_fontsproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
index 94e7bed..c45fa52 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
@@ -7,6 +7,8 @@
 XAPP_XFSINFO_VERSION = 1.0.1
 XAPP_XFSINFO_SOURCE = xfsinfo-$(XAPP_XFSINFO_VERSION).tar.bz2
 XAPP_XFSINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFSINFO_LICENSE = MIT
+XAPP_XFSINFO_LICENSE_FILES = COPYING
 XAPP_XFSINFO_DEPENDENCIES = xlib_libFS xlib_libX11
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
index 6e2197d..73c8426 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.mk
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
@@ -7,6 +7,8 @@
 XAPP_XGAMMA_VERSION = 1.0.5
 XAPP_XGAMMA_SOURCE = xgamma-$(XAPP_XGAMMA_VERSION).tar.bz2
 XAPP_XGAMMA_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XGAMMA_LICENSE = MIT
+XAPP_XGAMMA_LICENSE_FILES = COPYING
 XAPP_XGAMMA_DEPENDENCIES = xlib_libXxf86vm
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index cfb3164..400b1a7 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -7,6 +7,8 @@
 XAPP_XGC_VERSION = 1.0.3
 XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.bz2
 XAPP_XGC_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XGC_LICENSE = MIT
+XAPP_XGC_LICENSE_FILES = COPYING
 XAPP_XGC_DEPENDENCIES = xlib_libXaw
 XAPP_XGC_AUTORECONF = YES
 
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index 2b72d81..232a112 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -7,6 +7,8 @@
 XAPP_XHOST_VERSION = 1.0.5
 XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.bz2
 XAPP_XHOST_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XHOST_LICENSE = MIT
+XAPP_XHOST_LICENSE_FILES = COPYING
 XAPP_XHOST_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
index 659d62a..974b83d 100644
--- a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
+++ b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
@@ -7,6 +7,8 @@
 XAPP_XINPUT_CALIBRATOR_VERSION = 0.7.5
 XAPP_XINPUT_CALIBRATOR_SOURCE = xinput_calibrator-$(XAPP_XINPUT_CALIBRATOR_VERSION).tar.gz
 XAPP_XINPUT_CALIBRATOR_SITE = http://github.com/downloads/tias/xinput_calibrator
+XAPP_XINPUT_CALIBRATOR_LICENSE = MIT
+XAPP_XINPUT_CALIBRATOR_LICENSE_FILES = COPYING
 XAPP_XINPUT_CALIBRATOR_DEPENDENCIES = xlib_libX11 xlib_libXi
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index fea939e..4206d21 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -7,6 +7,8 @@
 XAPP_XINPUT_VERSION = 1.6.0
 XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
 XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XINPUT_LICENSE = MIT
+XAPP_XINPUT_LICENSE_FILES = COPYING
 XAPP_XINPUT_DEPENDENCIES = xlib_libX11 xlib_libXi xlib_libXrandr xlib_libXinerama
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index 095c047..86053ca 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -7,6 +7,8 @@
 XAPP_XKBCOMP_VERSION = 1.2.4
 XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBCOMP_LICENSE = MIT
+XAPP_XKBCOMP_LICENSE_FILES = COPYING
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
 XAPP_XKBCOMP_CONF_ENV = ac_cv_file___xkbparse_c=yes
 
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
index 6327b20..1537b09 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
@@ -7,6 +7,8 @@
 XAPP_XKBEVD_VERSION = 1.1.3
 XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.bz2
 XAPP_XKBEVD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBEVD_LICENSE = MIT
+XAPP_XKBEVD_LICENSE_FILES = COPYING
 XAPP_XKBEVD_DEPENDENCIES = xlib_libxkbfile
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
index 6c1e272..fd3757e 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
@@ -7,6 +7,8 @@
 XAPP_XKBPRINT_VERSION = 1.0.1
 XAPP_XKBPRINT_SOURCE = xkbprint-$(XAPP_XKBPRINT_VERSION).tar.bz2
 XAPP_XKBPRINT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBPRINT_LICENSE = MIT
+XAPP_XKBPRINT_LICENSE_FILES = COPYING
 XAPP_XKBPRINT_DEPENDENCIES = xlib_libxkbfile
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
index 632fcf3..64fe877 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
@@ -7,6 +7,8 @@
 XAPP_XKBUTILS_VERSION = 1.0.3
 XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.bz2
 XAPP_XKBUTILS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBUTILS_LICENSE = MIT
+XAPP_XKBUTILS_LICENSE_FILES = COPYING
 XAPP_XKBUTILS_DEPENDENCIES = xlib_libXaw xlib_libxkbfile
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xkill/xapp_xkill.mk b/package/x11r7/xapp_xkill/xapp_xkill.mk
index 0611b3f..200d87a 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.mk
+++ b/package/x11r7/xapp_xkill/xapp_xkill.mk
@@ -7,6 +7,8 @@
 XAPP_XKILL_VERSION = 1.0.3
 XAPP_XKILL_SOURCE = xkill-$(XAPP_XKILL_VERSION).tar.bz2
 XAPP_XKILL_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKILL_LICENSE = MIT
+XAPP_XKILL_LICENSE_FILES = COPYING
 XAPP_XKILL_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index 8580391..ef88333 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -7,6 +7,8 @@
 XAPP_XLOAD_VERSION = 1.1.1
 XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.bz2
 XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLOAD_LICENSE = MIT
+XAPP_XLOAD_LICENSE_FILES = COPYING
 XAPP_XLOAD_DEPENDENCIES = xlib_libXaw
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index 73de828..cee7487 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -7,6 +7,8 @@
 XAPP_XLOGO_VERSION = 1.0.4
 XAPP_XLOGO_SOURCE = xlogo-$(XAPP_XLOGO_VERSION).tar.bz2
 XAPP_XLOGO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLOGO_LICENSE = MIT
+XAPP_XLOGO_LICENSE_FILES = COPYING
 XAPP_XLOGO_DEPENDENCIES = xlib_libXaw xlib_libXrender \
 			  xlib_libXft host-pkgconf
 
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
index c10f5c2..aa70b56 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -7,6 +7,8 @@
 XAPP_XLSATOMS_VERSION = 1.1.1
 XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.bz2
 XAPP_XLSATOMS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLSATOMS_LICENSE = MIT
+XAPP_XLSATOMS_LICENSE_FILES = COPYING
 XAPP_XLSATOMS_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
index c8bf930..d07fd33 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
@@ -7,6 +7,8 @@
 XAPP_XLSCLIENTS_VERSION = 1.1.2
 XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.bz2
 XAPP_XLSCLIENTS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLSCLIENTS_LICENSE = MIT
+XAPP_XLSCLIENTS_LICENSE_FILES = COPYING
 XAPP_XLSCLIENTS_DEPENDENCIES = xlib_libX11 xlib_libXmu libxcb xcb-util
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
index 708a19b..93fd926 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -7,6 +7,8 @@
 XAPP_XLSFONTS_VERSION = 1.0.1
 XAPP_XLSFONTS_SOURCE = xlsfonts-$(XAPP_XLSFONTS_VERSION).tar.bz2
 XAPP_XLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLSFONTS_LICENSE = MIT
+XAPP_XLSFONTS_LICENSE_FILES = COPYING
 XAPP_XLSFONTS_DEPENDENCIES = xlib_libX11
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
index 0496c8a..b55f4f3 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ b/package/x11r7/xapp_xmag/xapp_xmag.mk
@@ -7,6 +7,8 @@
 XAPP_XMAG_VERSION = 1.0.4
 XAPP_XMAG_SOURCE = xmag-$(XAPP_XMAG_VERSION).tar.bz2
 XAPP_XMAG_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMAG_LICENSE = MIT
+XAPP_XMAG_LICENSE_FILES = COPYING
 XAPP_XMAG_DEPENDENCIES = xlib_libXaw
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index 0c39aaf..fef6a9f 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -6,6 +6,8 @@
 XAPP_XMAN_VERSION = 1.0.3
 XAPP_XMAN_SOURCE = xman-$(XAPP_XMAN_VERSION).tar.bz2
 XAPP_XMAN_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMAN_LICENSE = MIT
+XAPP_XMAN_LICENSE_FILES = COPYING
 XAPP_XMAN_DEPENDENCIES = xlib_libXaw
 
 XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
index 3a11bb4..34f5433 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
@@ -7,6 +7,8 @@
 XAPP_XMESSAGE_VERSION = 1.0.2
 XAPP_XMESSAGE_SOURCE = xmessage-$(XAPP_XMESSAGE_VERSION).tar.bz2
 XAPP_XMESSAGE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMESSAGE_LICENSE = MIT
+XAPP_XMESSAGE_LICENSE_FILES = COPYING
 XAPP_XMESSAGE_DEPENDENCIES = xlib_libXaw
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index 920289e..3a77648 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -7,6 +7,8 @@
 XAPP_XMH_VERSION = 1.0.2
 XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.bz2
 XAPP_XMH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMH_LICENSE = MIT
+XAPP_XMH_LICENSE_FILES = COPYING
 XAPP_XMH_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
index a1a1882..3ffbb58 100644
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
@@ -7,6 +7,8 @@
 XAPP_XMODMAP_VERSION = 1.0.7
 XAPP_XMODMAP_SOURCE = xmodmap-$(XAPP_XMODMAP_VERSION).tar.bz2
 XAPP_XMODMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMODMAP_LICENSE = MIT
+XAPP_XMODMAP_LICENSE_FILES = COPYING
 XAPP_XMODMAP_DEPENDENCIES = xlib_libX11
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index e5c54b0..c9a1984 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -7,6 +7,8 @@
 XAPP_XMORE_VERSION = 1.0.1
 XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.bz2
 XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMORE_LICENSE = MIT
+XAPP_XMORE_LICENSE_FILES = COPYING
 XAPP_XMORE_DEPENDENCIES = xlib_libXaw
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
index c1220dc..2950afd 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ b/package/x11r7/xapp_xpr/xapp_xpr.mk
@@ -7,6 +7,8 @@
 XAPP_XPR_VERSION = 1.0.4
 XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.bz2
 XAPP_XPR_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XPR_LICENSE = MIT
+XAPP_XPR_LICENSE_FILES = COPYING
 XAPP_XPR_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index d442ce9..3f7b9e1 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -7,6 +7,8 @@
 XAPP_XPROP_VERSION = 1.2.1
 XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.bz2
 XAPP_XPROP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XPROP_LICENSE = MIT
+XAPP_XPROP_LICENSE_FILES = COPYING
 XAPP_XPROP_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index 07c4c59..3a1feed 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -7,6 +7,8 @@
 XAPP_XRANDR_VERSION = 1.3.5
 XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.bz2
 XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XRANDR_LICENSE = MIT
+XAPP_XRANDR_LICENSE_FILES = COPYING
 XAPP_XRANDR_DEPENDENCIES = xlib_libXrandr xlib_libX11
 XAPP_XRANDR_CONF_OPT = --disable-malloc0returnsnull
 
diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.mk b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
index 60908c7..72ce0e1 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.mk
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
@@ -7,6 +7,8 @@
 XAPP_XRDB_VERSION = 1.0.9
 XAPP_XRDB_SOURCE = xrdb-$(XAPP_XRDB_VERSION).tar.bz2
 XAPP_XRDB_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XRDB_LICENSE = MIT
+XAPP_XRDB_LICENSE_FILES = COPYING
 XAPP_XRDB_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
index 6146856..2b0fe29 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
@@ -7,6 +7,8 @@
 XAPP_XREFRESH_VERSION = 1.0.4
 XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.bz2
 XAPP_XREFRESH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XREFRESH_LICENSE = MIT
+XAPP_XREFRESH_LICENSE_FILES = COPYING
 XAPP_XREFRESH_DEPENDENCIES = xlib_libX11
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
index afa6b53..5a6679f 100644
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ b/package/x11r7/xapp_xset/xapp_xset.mk
@@ -7,6 +7,8 @@
 XAPP_XSET_VERSION = 1.2.2
 XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.bz2
 XAPP_XSET_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSET_LICENSE = MIT
+XAPP_XSET_LICENSE_FILES = COPYING
 XAPP_XSET_DEPENDENCIES = xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
index d795e79..9808aa0 100644
--- a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
+++ b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
@@ -7,6 +7,8 @@
 XAPP_XSETMODE_VERSION = 1.0.0
 XAPP_XSETMODE_SOURCE = xsetmode-$(XAPP_XSETMODE_VERSION).tar.bz2
 XAPP_XSETMODE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSETMODE_LICENSE = MIT
+XAPP_XSETMODE_LICENSE_FILES = COPYING
 XAPP_XSETMODE_DEPENDENCIES = xlib_libX11 xlib_libXi
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
index 7ef189e..7707b60 100644
--- a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
+++ b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
@@ -7,6 +7,8 @@
 XAPP_XSETPOINTER_VERSION = 1.0.0
 XAPP_XSETPOINTER_SOURCE = xsetpointer-$(XAPP_XSETPOINTER_VERSION).tar.bz2
 XAPP_XSETPOINTER_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSETPOINTER_LICENSE = MIT
+XAPP_XSETPOINTER_LICENSE_FILES = COPYING
 XAPP_XSETPOINTER_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXi
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
index 82fdc4e..b9bb794 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
@@ -7,6 +7,8 @@
 XAPP_XSETROOT_VERSION = 1.1.0
 XAPP_XSETROOT_SOURCE = xsetroot-$(XAPP_XSETROOT_VERSION).tar.bz2
 XAPP_XSETROOT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSETROOT_LICENSE = MIT
+XAPP_XSETROOT_LICENSE_FILES = COPYING
 XAPP_XSETROOT_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXcursor xdata_xbitmaps
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xsm/xapp_xsm.mk b/package/x11r7/xapp_xsm/xapp_xsm.mk
index 75640a2..cdc27a9 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.mk
+++ b/package/x11r7/xapp_xsm/xapp_xsm.mk
@@ -7,6 +7,8 @@
 XAPP_XSM_VERSION = 1.0.2
 XAPP_XSM_SOURCE = xsm-$(XAPP_XSM_VERSION).tar.bz2
 XAPP_XSM_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSM_LICENSE = MIT
+XAPP_XSM_LICENSE_FILES = COPYING
 XAPP_XSM_DEPENDENCIES = xlib_libXaw
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
index 5f32ea4d..19c105e 100644
--- a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
+++ b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
@@ -7,6 +7,8 @@
 XAPP_XSTDCMAP_VERSION = 1.0.1
 XAPP_XSTDCMAP_SOURCE = xstdcmap-$(XAPP_XSTDCMAP_VERSION).tar.bz2
 XAPP_XSTDCMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSTDCMAP_LICENSE = MIT
+XAPP_XSTDCMAP_LICENSE_FILES = COPYING
 XAPP_XSTDCMAP_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
index eb1cac2..3e3d50e 100644
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
+++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
@@ -7,6 +7,8 @@
 XAPP_XVIDTUNE_VERSION = 1.0.2
 XAPP_XVIDTUNE_SOURCE = xvidtune-$(XAPP_XVIDTUNE_VERSION).tar.bz2
 XAPP_XVIDTUNE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XVIDTUNE_LICENSE = MIT
+XAPP_XVIDTUNE_LICENSE_FILES = COPYING
 XAPP_XVIDTUNE_DEPENDENCIES = xlib_libXaw xlib_libXxf86vm
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
index ed1127a..28c2cda 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
@@ -7,6 +7,8 @@
 XAPP_XVINFO_VERSION = 1.1.1
 XAPP_XVINFO_SOURCE = xvinfo-$(XAPP_XVINFO_VERSION).tar.bz2
 XAPP_XVINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XVINFO_LICENSE = MIT
+XAPP_XVINFO_LICENSE_FILES = COPYING
 XAPP_XVINFO_DEPENDENCIES = xlib_libX11 xlib_libXv
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
index 17ad452..a98b132 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ b/package/x11r7/xapp_xwd/xapp_xwd.mk
@@ -7,6 +7,8 @@
 XAPP_XWD_VERSION = 1.0.5
 XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.bz2
 XAPP_XWD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XWD_LICENSE = MIT
+XAPP_XWD_LICENSE_FILES = COPYING
 XAPP_XWD_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
index b9f5f67..acbd7b3 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
@@ -7,6 +7,8 @@
 XAPP_XWININFO_VERSION = 1.1.2
 XAPP_XWININFO_SOURCE = xwininfo-$(XAPP_XWININFO_VERSION).tar.bz2
 XAPP_XWININFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XWININFO_LICENSE = MIT
+XAPP_XWININFO_LICENSE_FILES = COPYING
 XAPP_XWININFO_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index acf5cca..911ac21 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -7,6 +7,8 @@
 XAPP_XWUD_VERSION = 1.0.4
 XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.bz2
 XAPP_XWUD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XWUD_LICENSE = MIT
+XAPP_XWUD_LICENSE_FILES = COPYING
 XAPP_XWUD_DEPENDENCIES = xlib_libX11
 
 $(eval $(autotools-package))
-- 
1.7.9.5
