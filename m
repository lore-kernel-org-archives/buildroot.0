From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 17:31:56 +0100
Subject: [Buildroot] [PATCH 6/7] X11R7.5 - remove all version information
	from Config.in files
In-Reply-To: <1271262717-2253-1-git-send-email-will_wagner@carallon.com>
References: <1271262717-2253-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1271262717-2253-7-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed on the list, don't want to have to change the Config.in
file when we bump the version of a package

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xapp_appres/Config.in                |    1 -
 package/x11r7/xapp_bdftopcf/Config.in              |    1 -
 package/x11r7/xapp_beforelight/Config.in           |    1 -
 package/x11r7/xapp_bitmap/Config.in                |    1 -
 package/x11r7/xapp_editres/Config.in               |    1 -
 package/x11r7/xapp_fonttosfnt/Config.in            |    1 -
 package/x11r7/xapp_fslsfonts/Config.in             |    1 -
 package/x11r7/xapp_fstobdf/Config.in               |    1 -
 package/x11r7/xapp_iceauth/Config.in               |    1 -
 package/x11r7/xapp_ico/Config.in                   |    1 -
 package/x11r7/xapp_listres/Config.in               |    1 -
 package/x11r7/xapp_luit/Config.in                  |    1 -
 package/x11r7/xapp_mkfontdir/Config.in             |    1 -
 package/x11r7/xapp_mkfontscale/Config.in           |    1 -
 package/x11r7/xapp_oclock/Config.in                |    1 -
 package/x11r7/xapp_rgb/Config.in                   |    1 -
 package/x11r7/xapp_rstart/Config.in                |    1 -
 package/x11r7/xapp_scripts/Config.in               |    1 -
 package/x11r7/xapp_sessreg/Config.in               |    1 -
 package/x11r7/xapp_setxkbmap/Config.in             |    1 -
 package/x11r7/xapp_showfont/Config.in              |    1 -
 package/x11r7/xapp_smproxy/Config.in               |    1 -
 package/x11r7/xapp_twm/Config.in                   |    1 -
 package/x11r7/xapp_viewres/Config.in               |    1 -
 package/x11r7/xapp_x11perf/Config.in               |    1 -
 package/x11r7/xapp_xauth/Config.in                 |    1 -
 package/x11r7/xapp_xbacklight/Config.in            |    1 -
 package/x11r7/xapp_xbiff/Config.in                 |    1 -
 package/x11r7/xapp_xcalc/Config.in                 |    1 -
 package/x11r7/xapp_xclipboard/Config.in            |    1 -
 package/x11r7/xapp_xclock/Config.in                |    1 -
 package/x11r7/xapp_xcmsdb/Config.in                |    1 -
 package/x11r7/xapp_xcursorgen/Config.in            |    1 -
 package/x11r7/xapp_xdbedizzy/Config.in             |    1 -
 package/x11r7/xapp_xditview/Config.in              |    1 -
 package/x11r7/xapp_xdm/Config.in                   |    1 -
 package/x11r7/xapp_xdpyinfo/Config.in              |    1 -
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk       |    2 +-
 package/x11r7/xapp_xdriinfo/Config.in              |    1 -
 package/x11r7/xapp_xedit/Config.in                 |    1 -
 package/x11r7/xapp_xev/Config.in                   |    1 -
 package/x11r7/xapp_xeyes/Config.in                 |    1 -
 package/x11r7/xapp_xf86dga/Config.in               |    1 -
 package/x11r7/xapp_xfd/Config.in                   |    1 -
 package/x11r7/xapp_xfontsel/Config.in              |    1 -
 package/x11r7/xapp_xfs/Config.in                   |    1 -
 package/x11r7/xapp_xfsinfo/Config.in               |    1 -
 package/x11r7/xapp_xgamma/Config.in                |    1 -
 package/x11r7/xapp_xgc/Config.in                   |    1 -
 package/x11r7/xapp_xhost/Config.in                 |    1 -
 package/x11r7/xapp_xinit/Config.in                 |    1 -
 package/x11r7/xapp_xinput/Config.in                |    1 -
 package/x11r7/xapp_xkbcomp/Config.in               |    1 -
 package/x11r7/xapp_xkbevd/Config.in                |    1 -
 package/x11r7/xapp_xkbprint/Config.in              |    1 -
 package/x11r7/xapp_xkbutils/Config.in              |    1 -
 package/x11r7/xapp_xkill/Config.in                 |    1 -
 package/x11r7/xapp_xload/Config.in                 |    1 -
 package/x11r7/xapp_xlogo/Config.in                 |    1 -
 package/x11r7/xapp_xlsatoms/Config.in              |    1 -
 package/x11r7/xapp_xlsclients/Config.in            |    1 -
 package/x11r7/xapp_xlsfonts/Config.in              |    1 -
 package/x11r7/xapp_xmag/Config.in                  |    1 -
 package/x11r7/xapp_xmessage/Config.in              |    1 -
 package/x11r7/xapp_xmh/Config.in                   |    1 -
 package/x11r7/xapp_xmodmap/Config.in               |    1 -
 package/x11r7/xapp_xmore/Config.in                 |    1 -
 package/x11r7/xapp_xplsprinters/Config.in          |    1 -
 package/x11r7/xapp_xpr/Config.in                   |    1 -
 package/x11r7/xapp_xprehashprinterlist/Config.in   |    1 -
 package/x11r7/xapp_xprop/Config.in                 |    1 -
 package/x11r7/xapp_xrandr/Config.in                |    1 -
 package/x11r7/xapp_xrdb/Config.in                  |    1 -
 package/x11r7/xapp_xrefresh/Config.in              |    1 -
 package/x11r7/xapp_xset/Config.in                  |    1 -
 package/x11r7/xapp_xsetmode/Config.in              |    1 -
 package/x11r7/xapp_xsetpointer/Config.in           |    1 -
 package/x11r7/xapp_xsetroot/Config.in              |    1 -
 package/x11r7/xapp_xsm/Config.in                   |    1 -
 package/x11r7/xapp_xstdcmap/Config.in              |    1 -
 package/x11r7/xapp_xvidtune/Config.in              |    1 -
 package/x11r7/xapp_xvinfo/Config.in                |    1 -
 package/x11r7/xapp_xwd/Config.in                   |    1 -
 package/x11r7/xapp_xwininfo/Config.in              |    1 -
 package/x11r7/xapp_xwud/Config.in                  |    1 -
 package/x11r7/xdata_xbitmaps/Config.in             |    1 -
 package/x11r7/xdriver_xf86-input-acecad/Config.in  |    1 -
 package/x11r7/xdriver_xf86-input-aiptek/Config.in  |    1 -
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |    1 -
 .../x11r7/xdriver_xf86-input-joystick/Config.in    |    1 -
 .../x11r7/xdriver_xf86-input-keyboard/Config.in    |    1 -
 package/x11r7/xdriver_xf86-input-mouse/Config.in   |    1 -
 .../x11r7/xdriver_xf86-input-synaptics/Config.in   |    1 -
 package/x11r7/xdriver_xf86-input-vmmouse/Config.in |    1 -
 package/x11r7/xdriver_xf86-input-void/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-apm/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-ark/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-ast/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-ati/Config.in     |    1 -
 .../xdriver_xf86-video-ati.mk                      |    2 +-
 package/x11r7/xdriver_xf86-video-chips/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-cirrus/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-dummy/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-fbdev/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-geode/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-glide/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-glint/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-i128/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-i740/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-mach64/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-mga/Config.in     |    1 -
 .../x11r7/xdriver_xf86-video-neomagic/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-newport/Config.in |    1 -
 package/x11r7/xdriver_xf86-video-nv/Config.in      |    1 -
 package/x11r7/xdriver_xf86-video-r128/Config.in    |    1 -
 .../x11r7/xdriver_xf86-video-rendition/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-s3/Config.in      |    1 -
 package/x11r7/xdriver_xf86-video-s3virge/Config.in |    1 -
 package/x11r7/xdriver_xf86-video-savage/Config.in  |    1 -
 .../xdriver_xf86-video-siliconmotion/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-sis/Config.in     |    1 -
 .../xdriver_xf86-video-sis.mk                      |    2 +-
 package/x11r7/xdriver_xf86-video-sisusb/Config.in  |    1 -
 .../xdriver_xf86-video-sisusb.mk                   |    2 +-
 package/x11r7/xdriver_xf86-video-suncg14/Config.in |    1 -
 package/x11r7/xdriver_xf86-video-suncg3/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-suncg6/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-sunffb/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-sunleo/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-suntcx/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-tdfx/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-tga/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-trident/Config.in |    1 -
 package/x11r7/xdriver_xf86-video-tseng/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-v4l/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-vesa/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-vmware/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-voodoo/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-wsfb/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-xgi/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-xgixp/Config.in   |    1 -
 package/x11r7/xfont_encodings/Config.in            |    1 -
 package/x11r7/xfont_font-adobe-100dpi/Config.in    |    1 -
 package/x11r7/xfont_font-adobe-75dpi/Config.in     |    1 -
 .../x11r7/xfont_font-adobe-utopia-100dpi/Config.in |    1 -
 .../x11r7/xfont_font-adobe-utopia-75dpi/Config.in  |    1 -
 .../x11r7/xfont_font-adobe-utopia-type1/Config.in  |    1 -
 package/x11r7/xfont_font-alias/Config.in           |    1 -
 package/x11r7/xfont_font-arabic-misc/Config.in     |    1 -
 package/x11r7/xfont_font-bh-100dpi/Config.in       |    1 -
 package/x11r7/xfont_font-bh-75dpi/Config.in        |    1 -
 .../Config.in                                      |    1 -
 .../xfont_font-bh-lucidatypewriter-75dpi/Config.in |    1 -
 package/x11r7/xfont_font-bh-ttf/Config.in          |    1 -
 package/x11r7/xfont_font-bh-type1/Config.in        |    1 -
 .../x11r7/xfont_font-bitstream-100dpi/Config.in    |    1 -
 package/x11r7/xfont_font-bitstream-75dpi/Config.in |    1 -
 .../x11r7/xfont_font-bitstream-speedo/Config.in    |    1 -
 package/x11r7/xfont_font-bitstream-type1/Config.in |    1 -
 package/x11r7/xfont_font-cronyx-cyrillic/Config.in |    1 -
 package/x11r7/xfont_font-cursor-misc/Config.in     |    1 -
 package/x11r7/xfont_font-daewoo-misc/Config.in     |    1 -
 package/x11r7/xfont_font-dec-misc/Config.in        |    1 -
 package/x11r7/xfont_font-ibm-type1/Config.in       |    1 -
 package/x11r7/xfont_font-isas-misc/Config.in       |    1 -
 package/x11r7/xfont_font-jis-misc/Config.in        |    1 -
 package/x11r7/xfont_font-micro-misc/Config.in      |    1 -
 package/x11r7/xfont_font-misc-cyrillic/Config.in   |    1 -
 package/x11r7/xfont_font-misc-ethiopic/Config.in   |    1 -
 package/x11r7/xfont_font-misc-meltho/Config.in     |    1 -
 package/x11r7/xfont_font-misc-misc/Config.in       |    1 -
 package/x11r7/xfont_font-mutt-misc/Config.in       |    1 -
 package/x11r7/xfont_font-schumacher-misc/Config.in |    1 -
 package/x11r7/xfont_font-screen-cyrillic/Config.in |    1 -
 package/x11r7/xfont_font-sony-misc/Config.in       |    1 -
 package/x11r7/xfont_font-sun-misc/Config.in        |    1 -
 package/x11r7/xfont_font-util/Config.in            |    1 -
 .../x11r7/xfont_font-winitzki-cyrillic/Config.in   |    1 -
 package/x11r7/xfont_font-xfree86-type1/Config.in   |    1 -
 package/x11r7/xlib_libFS/Config.in                 |    1 -
 package/x11r7/xlib_libICE/Config.in                |    1 -
 package/x11r7/xlib_libSM/Config.in                 |    1 -
 package/x11r7/xlib_libX11/Config.in                |    1 -
 package/x11r7/xlib_libXScrnSaver/Config.in         |    1 -
 package/x11r7/xlib_libXau/Config.in                |    1 -
 package/x11r7/xlib_libXaw/Config.in                |    1 -
 package/x11r7/xlib_libXcomposite/Config.in         |    1 -
 package/x11r7/xlib_libXcursor/Config.in            |    1 -
 package/x11r7/xlib_libXdamage/Config.in            |    1 -
 package/x11r7/xlib_libXdmcp/Config.in              |    1 -
 package/x11r7/xlib_libXext/Config.in               |    1 -
 package/x11r7/xlib_libXfixes/Config.in             |    1 -
 package/x11r7/xlib_libXfont/Config.in              |    1 -
 package/x11r7/xlib_libXft/Config.in                |    1 -
 package/x11r7/xlib_libXi/Config.in                 |    1 -
 package/x11r7/xlib_libXinerama/Config.in           |    1 -
 package/x11r7/xlib_libXmu/Config.in                |    1 -
 package/x11r7/xlib_libXp/Config.in                 |    1 -
 package/x11r7/xlib_libXpm/Config.in                |    1 -
 package/x11r7/xlib_libXprintAppUtil/Config.in      |    1 -
 package/x11r7/xlib_libXprintUtil/Config.in         |    1 -
 package/x11r7/xlib_libXrandr/Config.in             |    1 -
 package/x11r7/xlib_libXrender/Config.in            |    1 -
 package/x11r7/xlib_libXres/Config.in               |    1 -
 package/x11r7/xlib_libXt/Config.in                 |    1 -
 package/x11r7/xlib_libXtst/Config.in               |    1 -
 package/x11r7/xlib_libXv/Config.in                 |    1 -
 package/x11r7/xlib_libXvMC/Config.in               |    1 -
 package/x11r7/xlib_libXxf86dga/Config.in           |    1 -
 package/x11r7/xlib_libXxf86vm/Config.in            |    1 -
 package/x11r7/xlib_libdmx/Config.in                |    1 -
 package/x11r7/xlib_libfontenc/Config.in            |    1 -
 package/x11r7/xlib_liboldX/Config.in               |    1 -
 package/x11r7/xlib_libxkbfile/Config.in            |    1 -
 package/x11r7/xlib_libxkbui/Config.in              |    1 -
 package/x11r7/xlib_xtrans/Config.in                |    1 -
 package/x11r7/xproto_applewmproto/Config.in        |    1 -
 package/x11r7/xproto_bigreqsproto/Config.in        |    1 -
 package/x11r7/xproto_compositeproto/Config.in      |    1 -
 package/x11r7/xproto_damageproto/Config.in         |    1 -
 package/x11r7/xproto_dmxproto/Config.in            |    1 -
 package/x11r7/xproto_fixesproto/Config.in          |    1 -
 package/x11r7/xproto_fontsproto/Config.in          |    1 -
 package/x11r7/xproto_glproto/Config.in             |    1 -
 package/x11r7/xproto_inputproto/Config.in          |    1 -
 package/x11r7/xproto_kbproto/Config.in             |    1 -
 package/x11r7/xproto_printproto/Config.in          |    1 -
 package/x11r7/xproto_randrproto/Config.in          |    1 -
 package/x11r7/xproto_recordproto/Config.in         |    1 -
 package/x11r7/xproto_renderproto/Config.in         |    1 -
 package/x11r7/xproto_resourceproto/Config.in       |    1 -
 package/x11r7/xproto_scrnsaverproto/Config.in      |    1 -
 package/x11r7/xproto_videoproto/Config.in          |    1 -
 package/x11r7/xproto_windowswmproto/Config.in      |    1 -
 package/x11r7/xproto_xcmiscproto/Config.in         |    1 -
 package/x11r7/xproto_xextproto/Config.in           |    1 -
 package/x11r7/xproto_xf86bigfontproto/Config.in    |    1 -
 package/x11r7/xproto_xf86dgaproto/Config.in        |    1 -
 package/x11r7/xproto_xf86driproto/Config.in        |    1 -
 package/x11r7/xproto_xf86rushproto/Config.in       |    1 -
 package/x11r7/xproto_xf86vidmodeproto/Config.in    |    1 -
 package/x11r7/xproto_xineramaproto/Config.in       |    1 -
 package/x11r7/xproto_xproto/Config.in              |    1 -
 package/x11r7/xutil_makedepend/Config.in           |    1 -
 package/x11r7/xutil_util-macros/Config.in          |    1 -
 245 files changed, 4 insertions(+), 245 deletions(-)

diff --git a/package/x11r7/xapp_appres/Config.in b/package/x11r7/xapp_appres/Config.in
index 2a6b503..7574659 100644
--- a/package/x11r7/xapp_appres/Config.in
+++ b/package/x11r7/xapp_appres/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_APPRES
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
-	  appres 1.0.1
 	  list X application resource database
diff --git a/package/x11r7/xapp_bdftopcf/Config.in b/package/x11r7/xapp_bdftopcf/Config.in
index 0164836..a9caffa 100644
--- a/package/x11r7/xapp_bdftopcf/Config.in
+++ b/package/x11r7/xapp_bdftopcf/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_BDFTOPCF
 	bool "bdftopcf"
 	select BR2_PACKAGE_XLIB_LIBXFONT
 	help
-	  bdftopcf 1.0.2
 	  X.Org bdftopcf application
diff --git a/package/x11r7/xapp_beforelight/Config.in b/package/x11r7/xapp_beforelight/Config.in
index e186789..3a11189 100644
--- a/package/x11r7/xapp_beforelight/Config.in
+++ b/package/x11r7/xapp_beforelight/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XAPP_BEFORELIGHT
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
-	  beforelight 1.0.2
 	  screen saver
diff --git a/package/x11r7/xapp_bitmap/Config.in b/package/x11r7/xapp_bitmap/Config.in
index bc593df..e5bb5e8 100644
--- a/package/x11r7/xapp_bitmap/Config.in
+++ b/package/x11r7/xapp_bitmap/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XAPP_BITMAP
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XDATA_XBITMAPS
 	help
-	  bitmap 1.0.2
 	  X.Org bitmap application
diff --git a/package/x11r7/xapp_editres/Config.in b/package/x11r7/xapp_editres/Config.in
index cbbdad5..390ec48 100644
--- a/package/x11r7/xapp_editres/Config.in
+++ b/package/x11r7/xapp_editres/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XAPP_EDITRES
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
-	  editres 1.0.2
 	  a dynamic resource editor for X Toolkit applications
diff --git a/package/x11r7/xapp_fonttosfnt/Config.in b/package/x11r7/xapp_fonttosfnt/Config.in
index af8f14e..eb35710 100644
--- a/package/x11r7/xapp_fonttosfnt/Config.in
+++ b/package/x11r7/xapp_fonttosfnt/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XAPP_FONTTOSFNT
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBFONTENC
 	help
-	  fonttosfnt 1.0.3
 	  X.Org fonttosfnt application
diff --git a/package/x11r7/xapp_fslsfonts/Config.in b/package/x11r7/xapp_fslsfonts/Config.in
index 880bfad..1917d61 100644
--- a/package/x11r7/xapp_fslsfonts/Config.in
+++ b/package/x11r7/xapp_fslsfonts/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_FSLSFONTS
 	select BR2_PACKAGE_XLIB_LIBFS
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  fslsfonts 1.0.1
 	  list fonts served by X font server
diff --git a/package/x11r7/xapp_fstobdf/Config.in b/package/x11r7/xapp_fstobdf/Config.in
index a65ab4c..0a1f62b 100644
--- a/package/x11r7/xapp_fstobdf/Config.in
+++ b/package/x11r7/xapp_fstobdf/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_FSTOBDF
 	select BR2_PACKAGE_XLIB_LIBFS
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  fstobdf 1.0.2
 	  generate BDF font from X font server
diff --git a/package/x11r7/xapp_iceauth/Config.in b/package/x11r7/xapp_iceauth/Config.in
index 81acb96..ce2db98 100644
--- a/package/x11r7/xapp_iceauth/Config.in
+++ b/package/x11r7/xapp_iceauth/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_ICEAUTH
 	select BR2_PACKAGE_XLIB_LIBICE
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  iceauth 1.0.3
 	  ICE authority file utility
diff --git a/package/x11r7/xapp_ico/Config.in b/package/x11r7/xapp_ico/Config.in
index 8581708..892f2be 100644
--- a/package/x11r7/xapp_ico/Config.in
+++ b/package/x11r7/xapp_ico/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_ICO
 	bool "ico"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  ico 1.0.1
 	  animate an icosahedron or other polyhedron
diff --git a/package/x11r7/xapp_listres/Config.in b/package/x11r7/xapp_listres/Config.in
index 385e5e0..a3be6b3 100644
--- a/package/x11r7/xapp_listres/Config.in
+++ b/package/x11r7/xapp_listres/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XAPP_LISTRES
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
-	  listres 1.0.1
 	  list resources in widgets
diff --git a/package/x11r7/xapp_luit/Config.in b/package/x11r7/xapp_luit/Config.in
index 9ab6b4a..aec83a0 100644
--- a/package/x11r7/xapp_luit/Config.in
+++ b/package/x11r7/xapp_luit/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_LUIT
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBFONTENC
 	help
-	  luit 1.0.4
 	  Locale and ISO 2022 support for Unicode terminals
diff --git a/package/x11r7/xapp_mkfontdir/Config.in b/package/x11r7/xapp_mkfontdir/Config.in
index e1b1064..155772d 100644
--- a/package/x11r7/xapp_mkfontdir/Config.in
+++ b/package/x11r7/xapp_mkfontdir/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_MKFONTDIR
 	bool "mkfontdir"
 	select BR2_PACKAGE_XAPP_MKFONTSCALE
 	help
-	  mkfontdir 1.0.5
 	  create an index of X font files in a directory
diff --git a/package/x11r7/xapp_mkfontscale/Config.in b/package/x11r7/xapp_mkfontscale/Config.in
index 43eded6..540dd45 100644
--- a/package/x11r7/xapp_mkfontscale/Config.in
+++ b/package/x11r7/xapp_mkfontscale/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XAPP_MKFONTSCALE
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBFONTENC
 	help
-	  mkfontscale 1.0.7
 	  create an index of scalable font files for X
diff --git a/package/x11r7/xapp_oclock/Config.in b/package/x11r7/xapp_oclock/Config.in
index fda9a5f..00cd413 100644
--- a/package/x11r7/xapp_oclock/Config.in
+++ b/package/x11r7/xapp_oclock/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XAPP_OCLOCK
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  oclock 1.0.1
 	  round X clock
diff --git a/package/x11r7/xapp_rgb/Config.in b/package/x11r7/xapp_rgb/Config.in
index 67a1a2b..038b849 100644
--- a/package/x11r7/xapp_rgb/Config.in
+++ b/package/x11r7/xapp_rgb/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_RGB
 	bool "rgb"
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  rgb 1.0.1
 	  uncompile an rgb color-name database
diff --git a/package/x11r7/xapp_rstart/Config.in b/package/x11r7/xapp_rstart/Config.in
index 4acedab..1bf61b3 100644
--- a/package/x11r7/xapp_rstart/Config.in
+++ b/package/x11r7/xapp_rstart/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_RSTART
 	bool "rstart"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  rstart 1.0.2
 	  X.Org rstart application
diff --git a/package/x11r7/xapp_scripts/Config.in b/package/x11r7/xapp_scripts/Config.in
index a524702..691f0e2 100644
--- a/package/x11r7/xapp_scripts/Config.in
+++ b/package/x11r7/xapp_scripts/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_SCRIPTS
 	bool "scripts"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  scripts 1.0.1
 	  start an X program on a remote machine
diff --git a/package/x11r7/xapp_sessreg/Config.in b/package/x11r7/xapp_sessreg/Config.in
index 9d70886..0796bc1 100644
--- a/package/x11r7/xapp_sessreg/Config.in
+++ b/package/x11r7/xapp_sessreg/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_SESSREG
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  sessreg 1.0.5
 	  manage utmp/wtmp entries for non-init clients
diff --git a/package/x11r7/xapp_setxkbmap/Config.in b/package/x11r7/xapp_setxkbmap/Config.in
index 13a75b6..2b1389c 100644
--- a/package/x11r7/xapp_setxkbmap/Config.in
+++ b/package/x11r7/xapp_setxkbmap/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_SETXKBMAP
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	help
-	  setxkbmap 1.1.0
 	  Controls the keyboard layout of a running X server.
diff --git a/package/x11r7/xapp_showfont/Config.in b/package/x11r7/xapp_showfont/Config.in
index f0e8557..edfab3f 100644
--- a/package/x11r7/xapp_showfont/Config.in
+++ b/package/x11r7/xapp_showfont/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_SHOWFONT
 	bool "showfont"
 	select BR2_PACKAGE_XLIB_LIBFS
 	help
-	  showfont 1.0.1
 	  font dumper for X font server
diff --git a/package/x11r7/xapp_smproxy/Config.in b/package/x11r7/xapp_smproxy/Config.in
index dc72350..80ab984 100644
--- a/package/x11r7/xapp_smproxy/Config.in
+++ b/package/x11r7/xapp_smproxy/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_SMPROXY
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
-	  smproxy 1.0.3
 	  Session Manager Proxy
diff --git a/package/x11r7/xapp_twm/Config.in b/package/x11r7/xapp_twm/Config.in
index 30d5465..77f8554 100644
--- a/package/x11r7/xapp_twm/Config.in
+++ b/package/x11r7/xapp_twm/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XAPP_TWM
 	bool "twm"
 	help
-	  twm 1.0.3
 	  No description available
diff --git a/package/x11r7/xapp_viewres/Config.in b/package/x11r7/xapp_viewres/Config.in
index 12c93f0..32827c8 100644
--- a/package/x11r7/xapp_viewres/Config.in
+++ b/package/x11r7/xapp_viewres/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_VIEWRES
 	bool "viewres"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
-	  viewres 1.0.1
 	  graphical class browser for Xt
diff --git a/package/x11r7/xapp_x11perf/Config.in b/package/x11r7/xapp_x11perf/Config.in
index 860a9c9..0f1eca8 100644
--- a/package/x11r7/xapp_x11perf/Config.in
+++ b/package/x11r7/xapp_x11perf/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XAPP_X11PERF
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXFT
 	help
-	  x11perf 1.5.1
 	  summarize x11perf results
diff --git a/package/x11r7/xapp_xauth/Config.in b/package/x11r7/xapp_xauth/Config.in
index d4dc731..919fd50 100644
--- a/package/x11r7/xapp_xauth/Config.in
+++ b/package/x11r7/xapp_xauth/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XAPP_XAUTH
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xauth 1.0.4
 	  X authority file utility
diff --git a/package/x11r7/xapp_xbacklight/Config.in b/package/x11r7/xapp_xbacklight/Config.in
index 9275e58..3d727e2 100644
--- a/package/x11r7/xapp_xbacklight/Config.in
+++ b/package/x11r7/xapp_xbacklight/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XBACKLIGHT
 	bool "xbacklight"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xbacklight 1.1.1
 	  xbacklight
diff --git a/package/x11r7/xapp_xbiff/Config.in b/package/x11r7/xapp_xbiff/Config.in
index 2bef673..ea4b58a 100644
--- a/package/x11r7/xapp_xbiff/Config.in
+++ b/package/x11r7/xapp_xbiff/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XBIFF
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XDATA_XBITMAPS
 	help
-	  xbiff 1.0.1
 	  mailbox flag for X
diff --git a/package/x11r7/xapp_xcalc/Config.in b/package/x11r7/xapp_xcalc/Config.in
index aa58840..2552be0 100644
--- a/package/x11r7/xapp_xcalc/Config.in
+++ b/package/x11r7/xapp_xcalc/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XCALC
 	bool "xcalc"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
-	  xcalc 1.0.1
 	  scientific calculator for X
diff --git a/package/x11r7/xapp_xclipboard/Config.in b/package/x11r7/xapp_xclipboard/Config.in
index 749e109..941c219 100644
--- a/package/x11r7/xapp_xclipboard/Config.in
+++ b/package/x11r7/xapp_xclipboard/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XCLIPBOARD
 	bool "xclipboard"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
-	  xclipboard 1.0.1
 	  interchange between cut buffer and selection
diff --git a/package/x11r7/xapp_xclock/Config.in b/package/x11r7/xapp_xclock/Config.in
index 7b852ac..083a6d1 100644
--- a/package/x11r7/xapp_xclock/Config.in
+++ b/package/x11r7/xapp_xclock/Config.in
@@ -6,5 +6,4 @@ config BR2_PACKAGE_XAPP_XCLOCK
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	help
-	  xclock 1.0.2
 	  analog / digital clock for X
diff --git a/package/x11r7/xapp_xcmsdb/Config.in b/package/x11r7/xapp_xcmsdb/Config.in
index df6db00..99c9cbb 100644
--- a/package/x11r7/xapp_xcmsdb/Config.in
+++ b/package/x11r7/xapp_xcmsdb/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XCMSDB
 	bool "xcmsdb"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xcmsdb 1.0.2
 	  Device Color Characterization utility for X Color Management System
diff --git a/package/x11r7/xapp_xcursorgen/Config.in b/package/x11r7/xapp_xcursorgen/Config.in
index 51e23c1..c47ec28 100644
--- a/package/x11r7/xapp_xcursorgen/Config.in
+++ b/package/x11r7/xapp_xcursorgen/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XAPP_XCURSORGEN
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	help
-	  xcursorgen 1.0.3
 	  create an X cursor file from a collection of PNG images
diff --git a/package/x11r7/xapp_xdbedizzy/Config.in b/package/x11r7/xapp_xdbedizzy/Config.in
index 41d1a3e..5cba398 100644
--- a/package/x11r7/xapp_xdbedizzy/Config.in
+++ b/package/x11r7/xapp_xdbedizzy/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XAPP_XDBEDIZZY
 	select BR2_PACKAGE_XLIB_LIBXP
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	help
-	  xdbedizzy 1.0.2
 	  X.Org xdbedizzy application
diff --git a/package/x11r7/xapp_xditview/Config.in b/package/x11r7/xapp_xditview/Config.in
index 107314e..22944f7 100644
--- a/package/x11r7/xapp_xditview/Config.in
+++ b/package/x11r7/xapp_xditview/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XDITVIEW
 	bool "xditview"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
-	  xditview 1.0.1
 	  display ditroff output
diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
index 6aceb9e..b1c50d5 100644
--- a/package/x11r7/xapp_xdm/Config.in
+++ b/package/x11r7/xapp_xdm/Config.in
@@ -11,5 +11,4 @@ config BR2_PACKAGE_XAPP_XDM
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xdm 1.1.3
 	  X.Org xdm application
diff --git a/package/x11r7/xapp_xdpyinfo/Config.in b/package/x11r7/xapp_xdpyinfo/Config.in
index ffe579d..ad6bd05 100644
--- a/package/x11r7/xapp_xdpyinfo/Config.in
+++ b/package/x11r7/xapp_xdpyinfo/Config.in
@@ -17,5 +17,4 @@ config BR2_PACKAGE_XAPP_XDPYINFO
 	select BR2_PACKAGE_XPROTO_XF86MISCPROTO
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	help
-	  xdpyinfo 1.1.0
 	  display information utility for X
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index 64ef8a0..36cc067 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -8,6 +8,6 @@ XAPP_XDPYINFO_VERSION = 1.1.0
 XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.bz2
 XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDPYINFO_AUTORECONF = NO
-XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXp xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86misc xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_printproto xproto_renderproto xproto_xf86dgaproto xproto_xf86miscproto xproto_xf86vidmodeproto xlib_libdmx
+XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXp xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_printproto xproto_renderproto xproto_xf86dgaproto xproto_xf86vidmodeproto xlib_libdmx
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xdpyinfo))
diff --git a/package/x11r7/xapp_xdriinfo/Config.in b/package/x11r7/xapp_xdriinfo/Config.in
index aa2aaca..7442690 100644
--- a/package/x11r7/xapp_xdriinfo/Config.in
+++ b/package/x11r7/xapp_xdriinfo/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XAPP_XDRIINFO
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_MESA3D
 	help
-	  xdriinfo 1.0.3
 	  query configuration information of DRI drivers
diff --git a/package/x11r7/xapp_xedit/Config.in b/package/x11r7/xapp_xedit/Config.in
index b6c28c7..98e230d 100644
--- a/package/x11r7/xapp_xedit/Config.in
+++ b/package/x11r7/xapp_xedit/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XEDIT
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	help
-	  xedit 1.0.2
 	  simple text editor for X
diff --git a/package/x11r7/xapp_xev/Config.in b/package/x11r7/xapp_xev/Config.in
index 86d2ab1..e2e05b3 100644
--- a/package/x11r7/xapp_xev/Config.in
+++ b/package/x11r7/xapp_xev/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XEV
 	bool "xev"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xev 1.0.4
 	  print contents of X events
diff --git a/package/x11r7/xapp_xeyes/Config.in b/package/x11r7/xapp_xeyes/Config.in
index 74a1321..a7b7737 100644
--- a/package/x11r7/xapp_xeyes/Config.in
+++ b/package/x11r7/xapp_xeyes/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XAPP_XEYES
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
-	  xeyes 1.0.1
 	  X.Org xeyes application
diff --git a/package/x11r7/xapp_xf86dga/Config.in b/package/x11r7/xapp_xf86dga/Config.in
index 38774a3..769ebf6 100644
--- a/package/x11r7/xapp_xf86dga/Config.in
+++ b/package/x11r7/xapp_xf86dga/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XF86DGA
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXXF86DGA
 	help
-	  xf86dga 1.0.2
 	  test program for the XFree86-DGA extension
diff --git a/package/x11r7/xapp_xfd/Config.in b/package/x11r7/xapp_xfd/Config.in
index d942673..f006b1e 100644
--- a/package/x11r7/xapp_xfd/Config.in
+++ b/package/x11r7/xapp_xfd/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XAPP_XFD
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXFT
 	help
-	  xfd 1.0.1
 	  X.Org xfd application
diff --git a/package/x11r7/xapp_xfontsel/Config.in b/package/x11r7/xapp_xfontsel/Config.in
index 00ad3f5..0c6aa37 100644
--- a/package/x11r7/xapp_xfontsel/Config.in
+++ b/package/x11r7/xapp_xfontsel/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XFONTSEL
 	bool "xfontsel"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
-	  xfontsel 1.0.1
 	  point and click selection of X11 font names
diff --git a/package/x11r7/xapp_xfs/Config.in b/package/x11r7/xapp_xfs/Config.in
index c09e3a2..e71d89f 100644
--- a/package/x11r7/xapp_xfs/Config.in
+++ b/package/x11r7/xapp_xfs/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XAPP_XFS
 	select BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	help
-	  xfs 1.0.4
 	  X font server
diff --git a/package/x11r7/xapp_xfsinfo/Config.in b/package/x11r7/xapp_xfsinfo/Config.in
index 127dbf3..84c8ac1 100644
--- a/package/x11r7/xapp_xfsinfo/Config.in
+++ b/package/x11r7/xapp_xfsinfo/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XFSINFO
 	select BR2_PACKAGE_XLIB_LIBFS
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xfsinfo 1.0.1
 	  X font server information utility
diff --git a/package/x11r7/xapp_xgamma/Config.in b/package/x11r7/xapp_xgamma/Config.in
index d46dfbb..b20a784 100644
--- a/package/x11r7/xapp_xgamma/Config.in
+++ b/package/x11r7/xapp_xgamma/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XGAMMA
 	bool "xgamma"
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
 	help
-	  xgamma 1.0.3
 	  Alter a monitor's gamma correction through the X server
diff --git a/package/x11r7/xapp_xgc/Config.in b/package/x11r7/xapp_xgc/Config.in
index 05d6824..98faba8 100644
--- a/package/x11r7/xapp_xgc/Config.in
+++ b/package/x11r7/xapp_xgc/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XGC
 	bool "xgc"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
-	  xgc 1.0.1
 	  X graphics demo
diff --git a/package/x11r7/xapp_xhost/Config.in b/package/x11r7/xapp_xhost/Config.in
index b2a40c8..659b34d 100644
--- a/package/x11r7/xapp_xhost/Config.in
+++ b/package/x11r7/xapp_xhost/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XHOST
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xhost 1.0.3
 	  Controls host and/or user access to a running X server.
diff --git a/package/x11r7/xapp_xinit/Config.in b/package/x11r7/xapp_xinit/Config.in
index 22c788e..9ac2817 100644
--- a/package/x11r7/xapp_xinit/Config.in
+++ b/package/x11r7/xapp_xinit/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XINIT
 	select BR2_PACKAGE_XAPP_XAUTH
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xinit 1.0.5
 	  X Window System initializer
diff --git a/package/x11r7/xapp_xinput/Config.in b/package/x11r7/xapp_xinput/Config.in
index 3899a9a..55c47ac 100644
--- a/package/x11r7/xapp_xinput/Config.in
+++ b/package/x11r7/xapp_xinput/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XINPUT
 	bool "xinput"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xinput 1.5.0
 	  xinput
diff --git a/package/x11r7/xapp_xkbcomp/Config.in b/package/x11r7/xapp_xkbcomp/Config.in
index 597672f..2b575b2 100644
--- a/package/x11r7/xapp_xkbcomp/Config.in
+++ b/package/x11r7/xapp_xkbcomp/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XKBCOMP
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	help
-	  xkbcomp 1.1.1
 	  compile XKB keyboard description
diff --git a/package/x11r7/xapp_xkbevd/Config.in b/package/x11r7/xapp_xkbevd/Config.in
index b4a2e4a..cf31565 100644
--- a/package/x11r7/xapp_xkbevd/Config.in
+++ b/package/x11r7/xapp_xkbevd/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XKBEVD
 	bool "xkbevd"
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	help
-	  xkbevd 1.1.0
 	  XKB event daemon
diff --git a/package/x11r7/xapp_xkbprint/Config.in b/package/x11r7/xapp_xkbprint/Config.in
index fa4dd25..e7a4242 100644
--- a/package/x11r7/xapp_xkbprint/Config.in
+++ b/package/x11r7/xapp_xkbprint/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XKBPRINT
 	bool "xkbprint"
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	help
-	  xkbprint 1.0.1
 	  print an XKB keyboard description
diff --git a/package/x11r7/xapp_xkbutils/Config.in b/package/x11r7/xapp_xkbutils/Config.in
index 3a85477..22a819b 100644
--- a/package/x11r7/xapp_xkbutils/Config.in
+++ b/package/x11r7/xapp_xkbutils/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XKBUTILS
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	help
-	  xkbutils 1.0.2
 	  X.Org xkbutils application
diff --git a/package/x11r7/xapp_xkill/Config.in b/package/x11r7/xapp_xkill/Config.in
index 946e172..fcab92a 100644
--- a/package/x11r7/xapp_xkill/Config.in
+++ b/package/x11r7/xapp_xkill/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XKILL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xkill 1.0.2
 	  kill a client by its X resource
diff --git a/package/x11r7/xapp_xload/Config.in b/package/x11r7/xapp_xload/Config.in
index 4caca60..25c79d2 100644
--- a/package/x11r7/xapp_xload/Config.in
+++ b/package/x11r7/xapp_xload/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XLOAD
 	bool "xload"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
-	  xload 1.0.1
 	  system load average display for X
diff --git a/package/x11r7/xapp_xlogo/Config.in b/package/x11r7/xapp_xlogo/Config.in
index 2b13995..63a15fa 100644
--- a/package/x11r7/xapp_xlogo/Config.in
+++ b/package/x11r7/xapp_xlogo/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XAPP_XLOGO
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	help
-	  xlogo 1.0.1
 	  X Window System logo
diff --git a/package/x11r7/xapp_xlsatoms/Config.in b/package/x11r7/xapp_xlsatoms/Config.in
index b974641..2ad8484 100644
--- a/package/x11r7/xapp_xlsatoms/Config.in
+++ b/package/x11r7/xapp_xlsatoms/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XLSATOMS
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xlsatoms 1.0.2
 	  list interned atoms defined on server
diff --git a/package/x11r7/xapp_xlsclients/Config.in b/package/x11r7/xapp_xlsclients/Config.in
index 5b469f5..f8f6132 100644
--- a/package/x11r7/xapp_xlsclients/Config.in
+++ b/package/x11r7/xapp_xlsclients/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XLSCLIENTS
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xlsclients 1.0.2
 	  X.Org xlsclients application
diff --git a/package/x11r7/xapp_xlsfonts/Config.in b/package/x11r7/xapp_xlsfonts/Config.in
index 1b12737..dab61eb 100644
--- a/package/x11r7/xapp_xlsfonts/Config.in
+++ b/package/x11r7/xapp_xlsfonts/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XLSFONTS
 	bool "xlsfonts"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xlsfonts 1.0.1
 	  X.Org xlsfonts application
diff --git a/package/x11r7/xapp_xmag/Config.in b/package/x11r7/xapp_xmag/Config.in
index bd17fc4..44d2c8e 100644
--- a/package/x11r7/xapp_xmag/Config.in
+++ b/package/x11r7/xapp_xmag/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XMAG
 	bool "xmag"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
-	  xmag 1.0.1
 	  X.Org xmag application
diff --git a/package/x11r7/xapp_xmessage/Config.in b/package/x11r7/xapp_xmessage/Config.in
index 036a798..e80562f 100644
--- a/package/x11r7/xapp_xmessage/Config.in
+++ b/package/x11r7/xapp_xmessage/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XMESSAGE
 	bool "xmessage"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
-	  xmessage 1.0.1
 	  display a message or query in a window (X-based /bin/echo)
diff --git a/package/x11r7/xapp_xmh/Config.in b/package/x11r7/xapp_xmh/Config.in
index de03468..3da965a 100644
--- a/package/x11r7/xapp_xmh/Config.in
+++ b/package/x11r7/xapp_xmh/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XMH
 	bool "xmh"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
-	  xmh 1.0.1
 	  send and read mail with an X interface to MH
diff --git a/package/x11r7/xapp_xmodmap/Config.in b/package/x11r7/xapp_xmodmap/Config.in
index f4e1f0c..9be79ab 100644
--- a/package/x11r7/xapp_xmodmap/Config.in
+++ b/package/x11r7/xapp_xmodmap/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XMODMAP
 	bool "xmodmap"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xmodmap 1.0.4
 	  utility for modifying keymaps and pointer button mappings in X
diff --git a/package/x11r7/xapp_xmore/Config.in b/package/x11r7/xapp_xmore/Config.in
index 93cb716..877d6fb 100644
--- a/package/x11r7/xapp_xmore/Config.in
+++ b/package/x11r7/xapp_xmore/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XMORE
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	help
-	  xmore 1.0.1
 	  plain text display program for the X Window System
diff --git a/package/x11r7/xapp_xplsprinters/Config.in b/package/x11r7/xapp_xplsprinters/Config.in
index 7c83fc4..16a139b 100644
--- a/package/x11r7/xapp_xplsprinters/Config.in
+++ b/package/x11r7/xapp_xplsprinters/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XAPP_XPLSPRINTERS
 	select BR2_PACKAGE_XLIB_LIBXP
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	help
-	  xplsprinters 1.0.1
 	  shows a list of Xprint printers and it's attributes
diff --git a/package/x11r7/xapp_xpr/Config.in b/package/x11r7/xapp_xpr/Config.in
index 34b1c83..0710d62 100644
--- a/package/x11r7/xapp_xpr/Config.in
+++ b/package/x11r7/xapp_xpr/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XPR
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xpr 1.0.3
 	  X.Org xpr application
diff --git a/package/x11r7/xapp_xprehashprinterlist/Config.in b/package/x11r7/xapp_xprehashprinterlist/Config.in
index fc47627..056fdb6 100644
--- a/package/x11r7/xapp_xprehashprinterlist/Config.in
+++ b/package/x11r7/xapp_xprehashprinterlist/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XPREHASHPRINTERLIST
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXP
 	help
-	  xprehashprinterlist 1.0.1
 	  Recomputes the list of available printers.
diff --git a/package/x11r7/xapp_xprop/Config.in b/package/x11r7/xapp_xprop/Config.in
index 293ea40..314e79f 100644
--- a/package/x11r7/xapp_xprop/Config.in
+++ b/package/x11r7/xapp_xprop/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XPROP
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xprop 1.1.0
 	  property displayer for X
diff --git a/package/x11r7/xapp_xrandr/Config.in b/package/x11r7/xapp_xrandr/Config.in
index e553f64..fe9bd4e 100644
--- a/package/x11r7/xapp_xrandr/Config.in
+++ b/package/x11r7/xapp_xrandr/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XRANDR
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xrandr 1.3.2
 	  primitive command line interface to RandR extension
diff --git a/package/x11r7/xapp_xrdb/Config.in b/package/x11r7/xapp_xrdb/Config.in
index ce75895..8c07857 100644
--- a/package/x11r7/xapp_xrdb/Config.in
+++ b/package/x11r7/xapp_xrdb/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XRDB
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xrdb 1.0.6
 	  X server resource database utility
diff --git a/package/x11r7/xapp_xrefresh/Config.in b/package/x11r7/xapp_xrefresh/Config.in
index 7febcba..16b1e50 100644
--- a/package/x11r7/xapp_xrefresh/Config.in
+++ b/package/x11r7/xapp_xrefresh/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XREFRESH
 	bool "xrefresh"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xrefresh 1.0.3
 	  refresh all or part of an X screen
diff --git a/package/x11r7/xapp_xset/Config.in b/package/x11r7/xapp_xset/Config.in
index c61a4a9..ff697e5 100644
--- a/package/x11r7/xapp_xset/Config.in
+++ b/package/x11r7/xapp_xset/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XSET
 	select BR2_PACKAGE_XLIB_LIBXFONTCACHE
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xset 1.1.0
 	  X.Org xset application
diff --git a/package/x11r7/xapp_xsetmode/Config.in b/package/x11r7/xapp_xsetmode/Config.in
index 5b73e23..a08e02d 100644
--- a/package/x11r7/xapp_xsetmode/Config.in
+++ b/package/x11r7/xapp_xsetmode/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XSETMODE
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXI
 	help
-	  xsetmode 1.0.0
 	  set the mode for an X Input device
diff --git a/package/x11r7/xapp_xsetpointer/Config.in b/package/x11r7/xapp_xsetpointer/Config.in
index 65c18a1..2b0b462 100644
--- a/package/x11r7/xapp_xsetpointer/Config.in
+++ b/package/x11r7/xapp_xsetpointer/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XAPP_XSETPOINTER
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXI
 	help
-	  xsetpointer 1.0.0
 	  set an X Input device as the main pointer
diff --git a/package/x11r7/xapp_xsetroot/Config.in b/package/x11r7/xapp_xsetroot/Config.in
index c4d794e..82c0dba 100644
--- a/package/x11r7/xapp_xsetroot/Config.in
+++ b/package/x11r7/xapp_xsetroot/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XAPP_XSETROOT
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XDATA_XBITMAPS
 	help
-	  xsetroot 1.0.3
 	  X.Org xsetroot application
diff --git a/package/x11r7/xapp_xsm/Config.in b/package/x11r7/xapp_xsm/Config.in
index ee30e62..d06dc6c 100644
--- a/package/x11r7/xapp_xsm/Config.in
+++ b/package/x11r7/xapp_xsm/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XSM
 	bool "xsm"
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
-	  xsm 1.0.1
 	  X Session Manager
diff --git a/package/x11r7/xapp_xstdcmap/Config.in b/package/x11r7/xapp_xstdcmap/Config.in
index 331f116..f15c36b 100644
--- a/package/x11r7/xapp_xstdcmap/Config.in
+++ b/package/x11r7/xapp_xstdcmap/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XSTDCMAP
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xstdcmap 1.0.1
 	  X standard colormap utility
diff --git a/package/x11r7/xapp_xvidtune/Config.in b/package/x11r7/xapp_xvidtune/Config.in
index 21fd825..b1902cd 100644
--- a/package/x11r7/xapp_xvidtune/Config.in
+++ b/package/x11r7/xapp_xvidtune/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XVIDTUNE
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
 	help
-	  xvidtune 1.0.1
 	  video mode tuner for Xorg
diff --git a/package/x11r7/xapp_xvinfo/Config.in b/package/x11r7/xapp_xvinfo/Config.in
index 53324ce..2612c04 100644
--- a/package/x11r7/xapp_xvinfo/Config.in
+++ b/package/x11r7/xapp_xvinfo/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XVINFO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXV
 	help
-	  xvinfo 1.1.0
 	  Print out X-Video extension adaptor information
diff --git a/package/x11r7/xapp_xwd/Config.in b/package/x11r7/xapp_xwd/Config.in
index 15c08fa..b7b3172 100644
--- a/package/x11r7/xapp_xwd/Config.in
+++ b/package/x11r7/xapp_xwd/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XWD
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xwd 1.0.3
 	  dump an image of an X window
diff --git a/package/x11r7/xapp_xwininfo/Config.in b/package/x11r7/xapp_xwininfo/Config.in
index 4261a92..4e09570 100644
--- a/package/x11r7/xapp_xwininfo/Config.in
+++ b/package/x11r7/xapp_xwininfo/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XAPP_XWININFO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xwininfo 1.0.5
 	  window information utility for X
diff --git a/package/x11r7/xapp_xwud/Config.in b/package/x11r7/xapp_xwud/Config.in
index 888ee18..cb8337e 100644
--- a/package/x11r7/xapp_xwud/Config.in
+++ b/package/x11r7/xapp_xwud/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XAPP_XWUD
 	bool "xwud"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xwud 1.0.2
 	  image displayer for X
diff --git a/package/x11r7/xdata_xbitmaps/Config.in b/package/x11r7/xdata_xbitmaps/Config.in
index cfadd9c..2308cae 100644
--- a/package/x11r7/xdata_xbitmaps/Config.in
+++ b/package/x11r7/xdata_xbitmaps/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XDATA_XBITMAPS
 	bool "xbitmaps"
 	help
-	  xbitmaps 1.1.0
 	  No description available
diff --git a/package/x11r7/xdriver_xf86-input-acecad/Config.in b/package/x11r7/xdriver_xf86-input-acecad/Config.in
index e31de01..7e1838e 100644
--- a/package/x11r7/xdriver_xf86-input-acecad/Config.in
+++ b/package/x11r7/xdriver_xf86-input-acecad/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_ACECAD
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-acecad 1.4.0
 	  Acecad Flair input driver
diff --git a/package/x11r7/xdriver_xf86-input-aiptek/Config.in b/package/x11r7/xdriver_xf86-input-aiptek/Config.in
index b9a81c7..87fe5b3 100644
--- a/package/x11r7/xdriver_xf86-input-aiptek/Config.in
+++ b/package/x11r7/xdriver_xf86-input-aiptek/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_AIPTEK
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-aiptek 1.3.0
 	  Aiptek USB Digital Tablet Input Driver for Linux
diff --git a/package/x11r7/xdriver_xf86-input-evdev/Config.in b/package/x11r7/xdriver_xf86-input-evdev/Config.in
index 62472fd..248be7e 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/Config.in
+++ b/package/x11r7/xdriver_xf86-input-evdev/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-evdev 2.3.0
 	  Generic Linux input driver
diff --git a/package/x11r7/xdriver_xf86-input-joystick/Config.in b/package/x11r7/xdriver_xf86-input-joystick/Config.in
index 638e2d9..4a7439a 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/Config.in
+++ b/package/x11r7/xdriver_xf86-input-joystick/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_JOYSTICK
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-joystick 1.4.99.2
 	  X.Org driver for joystick input devices
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/Config.in b/package/x11r7/xdriver_xf86-input-keyboard/Config.in
index 65dc4ee..481c763 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/Config.in
+++ b/package/x11r7/xdriver_xf86-input-keyboard/Config.in
@@ -6,5 +6,4 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-keyboard 1.4.0
 	  Keyboard input driver
diff --git a/package/x11r7/xdriver_xf86-input-mouse/Config.in b/package/x11r7/xdriver_xf86-input-mouse/Config.in
index 113c13f..c8e39b0 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/Config.in
+++ b/package/x11r7/xdriver_xf86-input-mouse/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-mouse 1.5.0
 	  X.Org driver for mouse input devices
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/Config.in b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
index 9b5da84..258dee2 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/Config.in
+++ b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_SYNAPTICS
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-synaptics 1.2.0
 	  X.Org driver for synaptics input devices
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
index 9ce04ed..377e7e4 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_VMMOUSE
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-vmmouse 12.6.5
 	  VMWare mouse input driver
diff --git a/package/x11r7/xdriver_xf86-input-void/Config.in b/package/x11r7/xdriver_xf86-input-void/Config.in
index 7c4e6e5..ab4230b 100644
--- a/package/x11r7/xdriver_xf86-input-void/Config.in
+++ b/package/x11r7/xdriver_xf86-input-void/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-void 1.3.0
 	  null input driver
diff --git a/package/x11r7/xdriver_xf86-video-apm/Config.in b/package/x11r7/xdriver_xf86-video-apm/Config.in
index 9b799d5..dea5258 100644
--- a/package/x11r7/xdriver_xf86-video-apm/Config.in
+++ b/package/x11r7/xdriver_xf86-video-apm/Config.in
@@ -9,5 +9,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_APM
 	select BR2_PACKAGE_XPROTO_XF86RUSHPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-apm 1.2.2
 	  Alliance ProMotion video driver
diff --git a/package/x11r7/xdriver_xf86-video-ark/Config.in b/package/x11r7/xdriver_xf86-video-ark/Config.in
index 3d1b940..d9703de 100644
--- a/package/x11r7/xdriver_xf86-video-ark/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ark/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARK
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-ark 0.7.2
 	  X.Org driver for ark cards
diff --git a/package/x11r7/xdriver_xf86-video-ast/Config.in b/package/x11r7/xdriver_xf86-video-ast/Config.in
index b8a0b1e..b2a0bc8 100644
--- a/package/x11r7/xdriver_xf86-video-ast/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ast/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AST
 	bool "xf86-video-ast"
 	help
-	  xf86-video-ast 0.89.9
 	  No description available
diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index ee4dd1a..967cc66 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -12,5 +12,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-ati 6.12.4
 	  ATI video driver
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index e2c40da..59c9acf 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -8,7 +8,7 @@ XDRIVER_XF86_VIDEO_ATI_VERSION = 6.12.4
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xf86miscproto xproto_xineramaproto xproto_xproto
+XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 XDRIVER_XF86_VIDEO_ATI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-ati))
diff --git a/package/x11r7/xdriver_xf86-video-chips/Config.in b/package/x11r7/xdriver_xf86-video-chips/Config.in
index c0b8271..29a99ec 100644
--- a/package/x11r7/xdriver_xf86-video-chips/Config.in
+++ b/package/x11r7/xdriver_xf86-video-chips/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CHIPS
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-chips 1.2.2
 	  Chips and Technologies video driver
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/Config.in b/package/x11r7/xdriver_xf86-video-cirrus/Config.in
index d6f2cd7..31ed634 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/Config.in
+++ b/package/x11r7/xdriver_xf86-video-cirrus/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-cirrus 1.3.2
 	  Cirrus Logic video driver
diff --git a/package/x11r7/xdriver_xf86-video-dummy/Config.in b/package/x11r7/xdriver_xf86-video-dummy/Config.in
index f06d223..2a172cc 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/Config.in
+++ b/package/x11r7/xdriver_xf86-video-dummy/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_DUMMY
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-dummy 0.3.2
 	  X.Org driver for dummy cards
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/Config.in b/package/x11r7/xdriver_xf86-video-fbdev/Config.in
index af44116..8907fe1 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/Config.in
+++ b/package/x11r7/xdriver_xf86-video-fbdev/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-fbdev 0.4.1
 	  video driver for framebuffer device
diff --git a/package/x11r7/xdriver_xf86-video-geode/Config.in b/package/x11r7/xdriver_xf86-video-geode/Config.in
index 2145814..c60b62c 100644
--- a/package/x11r7/xdriver_xf86-video-geode/Config.in
+++ b/package/x11r7/xdriver_xf86-video-geode/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-geode 2.11.6
 	  video driver for geode device
diff --git a/package/x11r7/xdriver_xf86-video-glide/Config.in b/package/x11r7/xdriver_xf86-video-glide/Config.in
index cbba50c..ea9abd7 100644
--- a/package/x11r7/xdriver_xf86-video-glide/Config.in
+++ b/package/x11r7/xdriver_xf86-video-glide/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLIDE
 	select BR2_PACKAGE_XPROTO_XPROTO
 	depends on BROKEN # needs glide library from http://glide.sourceforge.net/
 	help
-	  xf86-video-glide 1.0.3
 	  video driver for glide device
diff --git a/package/x11r7/xdriver_xf86-video-glint/Config.in b/package/x11r7/xdriver_xf86-video-glint/Config.in
index 102f24f..703e020 100644
--- a/package/x11r7/xdriver_xf86-video-glint/Config.in
+++ b/package/x11r7/xdriver_xf86-video-glint/Config.in
@@ -12,5 +12,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-glint 1.2.4
 	  GLINT/Permedia video driver
diff --git a/package/x11r7/xdriver_xf86-video-i128/Config.in b/package/x11r7/xdriver_xf86-video-i128/Config.in
index 5017471..a66fda6 100644
--- a/package/x11r7/xdriver_xf86-video-i128/Config.in
+++ b/package/x11r7/xdriver_xf86-video-i128/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I128
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-i128 1.3.3
 	  Number 9 I128 video driver
diff --git a/package/x11r7/xdriver_xf86-video-i740/Config.in b/package/x11r7/xdriver_xf86-video-i740/Config.in
index e558325..9d1a040 100644
--- a/package/x11r7/xdriver_xf86-video-i740/Config.in
+++ b/package/x11r7/xdriver_xf86-video-i740/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I740
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-i740 1.3.2
 	  Intel i740 video driver
diff --git a/package/x11r7/xdriver_xf86-video-mach64/Config.in b/package/x11r7/xdriver_xf86-video-mach64/Config.in
index 6be86d9..8202045 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mach64/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-mach64 6.8.2
 	  mach64 video driver
diff --git a/package/x11r7/xdriver_xf86-video-mga/Config.in b/package/x11r7/xdriver_xf86-video-mga/Config.in
index 5f71f79..575bca4 100644
--- a/package/x11r7/xdriver_xf86-video-mga/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mga/Config.in
@@ -11,5 +11,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-mga 1.4.11
 	  Matrox video driver
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/Config.in b/package/x11r7/xdriver_xf86-video-neomagic/Config.in
index 3b6453a..2e028a7 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/Config.in
+++ b/package/x11r7/xdriver_xf86-video-neomagic/Config.in
@@ -9,5 +9,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEOMAGIC
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-neomagic 1.2.4
 	  Neomagic video driver
diff --git a/package/x11r7/xdriver_xf86-video-newport/Config.in b/package/x11r7/xdriver_xf86-video-newport/Config.in
index bea4c3d..e2effe8 100644
--- a/package/x11r7/xdriver_xf86-video-newport/Config.in
+++ b/package/x11r7/xdriver_xf86-video-newport/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEWPORT
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-newport 0.2.3
 	  Newport video driver
diff --git a/package/x11r7/xdriver_xf86-video-nv/Config.in b/package/x11r7/xdriver_xf86-video-nv/Config.in
index 63cca8f..943bc14 100644
--- a/package/x11r7/xdriver_xf86-video-nv/Config.in
+++ b/package/x11r7/xdriver_xf86-video-nv/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NV
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-nv 2.1.15
 	  NVIDIA video driver
diff --git a/package/x11r7/xdriver_xf86-video-r128/Config.in b/package/x11r7/xdriver_xf86-video-r128/Config.in
index 6511ca6..feb8893 100644
--- a/package/x11r7/xdriver_xf86-video-r128/Config.in
+++ b/package/x11r7/xdriver_xf86-video-r128/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-r128 6.8.1
 	  R128 video driver
diff --git a/package/x11r7/xdriver_xf86-video-rendition/Config.in b/package/x11r7/xdriver_xf86-video-rendition/Config.in
index bdcf334..9238aec 100644
--- a/package/x11r7/xdriver_xf86-video-rendition/Config.in
+++ b/package/x11r7/xdriver_xf86-video-rendition/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_RENDITION
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-rendition 4.2.3
 	  Rendition video driver
diff --git a/package/x11r7/xdriver_xf86-video-s3/Config.in b/package/x11r7/xdriver_xf86-video-s3/Config.in
index 3d3cad5..1091028 100644
--- a/package/x11r7/xdriver_xf86-video-s3/Config.in
+++ b/package/x11r7/xdriver_xf86-video-s3/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-s3 0.6.3
 	  X.Org driver for s3 cards
diff --git a/package/x11r7/xdriver_xf86-video-s3virge/Config.in b/package/x11r7/xdriver_xf86-video-s3virge/Config.in
index 6a73753..6f31864 100644
--- a/package/x11r7/xdriver_xf86-video-s3virge/Config.in
+++ b/package/x11r7/xdriver_xf86-video-s3virge/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3VIRGE
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-s3virge 1.10.4
 	  S3 ViRGE video driver
diff --git a/package/x11r7/xdriver_xf86-video-savage/Config.in b/package/x11r7/xdriver_xf86-video-savage/Config.in
index a7499eb..ec311bd 100644
--- a/package/x11r7/xdriver_xf86-video-savage/Config.in
+++ b/package/x11r7/xdriver_xf86-video-savage/Config.in
@@ -10,5 +10,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-savage 2.3.1
 	  S3 Savage video driver
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
index 042dcfa..db15116 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SILICONMOTION
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-siliconmotion 1.7.3
 	  Silicon Motion video driver
diff --git a/package/x11r7/xdriver_xf86-video-sis/Config.in b/package/x11r7/xdriver_xf86-video-sis/Config.in
index aac628e..184b770 100644
--- a/package/x11r7/xdriver_xf86-video-sis/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sis/Config.in
@@ -13,5 +13,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-sis 0.10.2
 	  SiS and XGI video driver
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index cfcb3f1..40ccab5 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -8,7 +8,7 @@ XDRIVER_XF86_VIDEO_SIS_VERSION = 0.10.2
 XDRIVER_XF86_VIDEO_SIS_SOURCE = xf86-video-sis-$(XDRIVER_XF86_VIDEO_SIS_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xf86miscproto xproto_xineramaproto xproto_xproto
+XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 XDRIVER_XF86_VIDEO_SIS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sis))
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/Config.in b/package/x11r7/xdriver_xf86-video-sisusb/Config.in
index af68d89..ffce940 100644
--- a/package/x11r7/xdriver_xf86-video-sisusb/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sisusb/Config.in
@@ -10,5 +10,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SISUSB
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-sisusb 0.9.3
 	  SiS USB video driver
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
index 36a683f..5068606 100644
--- a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
+++ b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
@@ -8,7 +8,7 @@ XDRIVER_XF86_VIDEO_SISUSB_VERSION = 0.9.3
 XDRIVER_XF86_VIDEO_SISUSB_SOURCE = xf86-video-sisusb-$(XDRIVER_XF86_VIDEO_SISUSB_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SISUSB_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SISUSB_AUTORECONF = NO
-XDRIVER_XF86_VIDEO_SISUSB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86miscproto xproto_xineramaproto xproto_xproto
+XDRIVER_XF86_VIDEO_SISUSB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xineramaproto xproto_xproto
 XDRIVER_XF86_VIDEO_SISUSB_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sisusb))
diff --git a/package/x11r7/xdriver_xf86-video-suncg14/Config.in b/package/x11r7/xdriver_xf86-video-suncg14/Config.in
index 977095b..661c179 100644
--- a/package/x11r7/xdriver_xf86-video-suncg14/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suncg14/Config.in
@@ -6,5 +6,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG14
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-suncg14 1.1.1
 	  CG14 video driver
diff --git a/package/x11r7/xdriver_xf86-video-suncg3/Config.in b/package/x11r7/xdriver_xf86-video-suncg3/Config.in
index 486f6ca..539a95a 100644
--- a/package/x11r7/xdriver_xf86-video-suncg3/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suncg3/Config.in
@@ -6,5 +6,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG3
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-suncg3 1.1.1
 	  CG3 video driver
diff --git a/package/x11r7/xdriver_xf86-video-suncg6/Config.in b/package/x11r7/xdriver_xf86-video-suncg6/Config.in
index 8b6dd34..9496f8d 100644
--- a/package/x11r7/xdriver_xf86-video-suncg6/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suncg6/Config.in
@@ -6,5 +6,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG6
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-suncg6 1.1.1
 	  GX/Turbo GX video driver
diff --git a/package/x11r7/xdriver_xf86-video-sunffb/Config.in b/package/x11r7/xdriver_xf86-video-sunffb/Config.in
index 6ac3dbc..76f5b9a 100644
--- a/package/x11r7/xdriver_xf86-video-sunffb/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sunffb/Config.in
@@ -9,5 +9,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNFFB
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-sunffb 1.2.1
 	  SUNFFB video driver
diff --git a/package/x11r7/xdriver_xf86-video-sunleo/Config.in b/package/x11r7/xdriver_xf86-video-sunleo/Config.in
index 94fadb2..29d24a2 100644
--- a/package/x11r7/xdriver_xf86-video-sunleo/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sunleo/Config.in
@@ -6,5 +6,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNLEO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-sunleo 1.1.0
 	  Leo video driver
diff --git a/package/x11r7/xdriver_xf86-video-suntcx/Config.in b/package/x11r7/xdriver_xf86-video-suntcx/Config.in
index fd4a2d2..3c82739 100644
--- a/package/x11r7/xdriver_xf86-video-suntcx/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suntcx/Config.in
@@ -6,5 +6,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNTCX
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-suntcx 1.1.1
 	  TCX video driver
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/Config.in b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
index 7a67b43..08104c9 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
@@ -10,5 +10,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-tdfx 1.4.3
 	  3Dfx video driver
diff --git a/package/x11r7/xdriver_xf86-video-tga/Config.in b/package/x11r7/xdriver_xf86-video-tga/Config.in
index 1fb8dab..800a8f6 100644
--- a/package/x11r7/xdriver_xf86-video-tga/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tga/Config.in
@@ -9,5 +9,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-tga 1.2.1
 	  X.Org driver for tga cards
diff --git a/package/x11r7/xdriver_xf86-video-trident/Config.in b/package/x11r7/xdriver_xf86-video-trident/Config.in
index 3ae3a02..4a7a477 100644
--- a/package/x11r7/xdriver_xf86-video-trident/Config.in
+++ b/package/x11r7/xdriver_xf86-video-trident/Config.in
@@ -9,5 +9,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TRIDENT
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-trident 1.3.3
 	  Trident video driver
diff --git a/package/x11r7/xdriver_xf86-video-tseng/Config.in b/package/x11r7/xdriver_xf86-video-tseng/Config.in
index d43f1a9..f72b87b 100644
--- a/package/x11r7/xdriver_xf86-video-tseng/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tseng/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TSENG
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-tseng 1.2.3
 	  Tseng Labs video driver
diff --git a/package/x11r7/xdriver_xf86-video-v4l/Config.in b/package/x11r7/xdriver_xf86-video-v4l/Config.in
index 14cafa8..3bb41fc 100644
--- a/package/x11r7/xdriver_xf86-video-v4l/Config.in
+++ b/package/x11r7/xdriver_xf86-video-v4l/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_V4L
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-v4l 0.1.1
 	  video4linux driver
diff --git a/package/x11r7/xdriver_xf86-video-vesa/Config.in b/package/x11r7/xdriver_xf86-video-vesa/Config.in
index b75cc5c..865f52c 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/Config.in
+++ b/package/x11r7/xdriver_xf86-video-vesa/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-vesa 2.2.1
 	  Generic VESA video driver
diff --git a/package/x11r7/xdriver_xf86-video-vmware/Config.in b/package/x11r7/xdriver_xf86-video-vmware/Config.in
index 20f1b98..9093b38 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/Config.in
+++ b/package/x11r7/xdriver_xf86-video-vmware/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-vmware 10.16.8
 	  VMware SVGA video driver
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/Config.in b/package/x11r7/xdriver_xf86-video-voodoo/Config.in
index 6767173..9b770be 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/Config.in
+++ b/package/x11r7/xdriver_xf86-video-voodoo/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VOODOO
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-voodoo 1.2.3
 	  Voodoo video driver
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/Config.in b/package/x11r7/xdriver_xf86-video-wsfb/Config.in
index 328fea1..3b3d406 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/Config.in
+++ b/package/x11r7/xdriver_xf86-video-wsfb/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_WSFB
 	select BR2_PACKAGE_XPROTO_XPROTO
 	depends on BROKEN # Fails to build. Actually this is OpenBSD/NetBSD stuff.
 	help
-	  xf86-video-wsfb 0.3.0
 	  WSFB based chips video driver
diff --git a/package/x11r7/xdriver_xf86-video-xgi/Config.in b/package/x11r7/xdriver_xf86-video-xgi/Config.in
index d6c3355..9a0c215 100644
--- a/package/x11r7/xdriver_xf86-video-xgi/Config.in
+++ b/package/x11r7/xdriver_xf86-video-xgi/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGI
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-xgi 1.5.1
 	  XGI based chips video driver
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/Config.in b/package/x11r7/xdriver_xf86-video-xgixp/Config.in
index e4c7f8e..e905280 100644
--- a/package/x11r7/xdriver_xf86-video-xgixp/Config.in
+++ b/package/x11r7/xdriver_xf86-video-xgixp/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGIXP
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-xgixp 1.7.99.4
 	  XGIXP based chips video driver
diff --git a/package/x11r7/xfont_encodings/Config.in b/package/x11r7/xfont_encodings/Config.in
index 5b22eda..af40da1 100644
--- a/package/x11r7/xfont_encodings/Config.in
+++ b/package/x11r7/xfont_encodings/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_ENCODINGS
 	bool "encodings"
 	help
-	  encodings 1.0.3
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-100dpi/Config.in b/package/x11r7/xfont_font-adobe-100dpi/Config.in
index cf6d857..aaac639 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/Config.in
+++ b/package/x11r7/xfont_font-adobe-100dpi/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_ADOBE_100DPI
 	bool "font-adobe-100dpi"
 	help
-	  font-adobe-100dpi 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-75dpi/Config.in b/package/x11r7/xfont_font-adobe-75dpi/Config.in
index 36cce36..f1c0a41 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/Config.in
+++ b/package/x11r7/xfont_font-adobe-75dpi/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_ADOBE_75DPI
 	bool "font-adobe-75dpi"
 	help
-	  font-adobe-75dpi 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in b/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
index e0b8b2a..02f2aeb 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_100DPI
 	bool "font-adobe-utopia-100dpi"
 	help
-	  font-adobe-utopia-100dpi 1.0.2
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in b/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
index 21ac46b..4a6e29c 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_75DPI
 	bool "font-adobe-utopia-75dpi"
 	help
-	  font-adobe-utopia-75dpi 1.0.2
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/Config.in b/package/x11r7/xfont_font-adobe-utopia-type1/Config.in
index 7cd11ff..d1efb70 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/Config.in
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_TYPE1
 	bool "font-adobe-utopia-type1"
 	help
-	  font-adobe-utopia-type1 1.0.2
 	  No description available
diff --git a/package/x11r7/xfont_font-alias/Config.in b/package/x11r7/xfont_font-alias/Config.in
index 1a0b35f..b655160 100644
--- a/package/x11r7/xfont_font-alias/Config.in
+++ b/package/x11r7/xfont_font-alias/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_ALIAS
 	bool "font-alias"
 	help
-	  font-alias 1.0.2
 	  No description available
diff --git a/package/x11r7/xfont_font-arabic-misc/Config.in b/package/x11r7/xfont_font-arabic-misc/Config.in
index 1ef43e3..acbdf7c 100644
--- a/package/x11r7/xfont_font-arabic-misc/Config.in
+++ b/package/x11r7/xfont_font-arabic-misc/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_ARABIC_MISC
 	bool "font-arabic-misc"
 	help
-	  font-arabic-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-100dpi/Config.in b/package/x11r7/xfont_font-bh-100dpi/Config.in
index b0d2809..dc405a2 100644
--- a/package/x11r7/xfont_font-bh-100dpi/Config.in
+++ b/package/x11r7/xfont_font-bh-100dpi/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_BH_100DPI
 	bool "font-bh-100dpi"
 	help
-	  font-bh-100dpi 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-75dpi/Config.in b/package/x11r7/xfont_font-bh-75dpi/Config.in
index b94ce72..6cd334e 100644
--- a/package/x11r7/xfont_font-bh-75dpi/Config.in
+++ b/package/x11r7/xfont_font-bh-75dpi/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_BH_75DPI
 	bool "font-bh-75dpi"
 	help
-	  font-bh-75dpi 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
index 8a94033..0e082d5 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI
 	bool "font-bh-lucidatypewriter-100dpi"
 	help
-	  font-bh-lucidatypewriter-100dpi 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
index 6916e4e..126fb85 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI
 	bool "font-bh-lucidatypewriter-75dpi"
 	help
-	  font-bh-lucidatypewriter-75dpi 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-ttf/Config.in b/package/x11r7/xfont_font-bh-ttf/Config.in
index e360f6d..2590798 100644
--- a/package/x11r7/xfont_font-bh-ttf/Config.in
+++ b/package/x11r7/xfont_font-bh-ttf/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_BH_TTF
 	bool "font-bh-ttf"
 	help
-	  font-bh-ttf 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-type1/Config.in b/package/x11r7/xfont_font-bh-type1/Config.in
index 7c77814..047268c 100644
--- a/package/x11r7/xfont_font-bh-type1/Config.in
+++ b/package/x11r7/xfont_font-bh-type1/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_BH_TYPE1
 	bool "font-bh-type1"
 	help
-	  font-bh-type1 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/Config.in b/package/x11r7/xfont_font-bitstream-100dpi/Config.in
index 40b6139..81393c5 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/Config.in
+++ b/package/x11r7/xfont_font-bitstream-100dpi/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_BITSTREAM_100DPI
 	bool "font-bitstream-100dpi"
 	help
-	  font-bitstream-100dpi 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/Config.in b/package/x11r7/xfont_font-bitstream-75dpi/Config.in
index a12d6f8..bada475 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/Config.in
+++ b/package/x11r7/xfont_font-bitstream-75dpi/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_BITSTREAM_75DPI
 	bool "font-bitstream-75dpi"
 	help
-	  font-bitstream-75dpi 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-speedo/Config.in b/package/x11r7/xfont_font-bitstream-speedo/Config.in
index 4037914..70750f6 100644
--- a/package/x11r7/xfont_font-bitstream-speedo/Config.in
+++ b/package/x11r7/xfont_font-bitstream-speedo/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_BITSTREAM_SPEEDO
 	bool "font-bitstream-speedo"
 	help
-	  font-bitstream-speedo 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-type1/Config.in b/package/x11r7/xfont_font-bitstream-type1/Config.in
index e3cf94a..d482a6d 100644
--- a/package/x11r7/xfont_font-bitstream-type1/Config.in
+++ b/package/x11r7/xfont_font-bitstream-type1/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_BITSTREAM_TYPE1
 	bool "font-bitstream-type1"
 	help
-	  font-bitstream-type1 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/Config.in b/package/x11r7/xfont_font-cronyx-cyrillic/Config.in
index e549a2e..a0085f5 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_CRONYX_CYRILLIC
 	bool "font-cronyx-cyrillic"
 	help
-	  font-cronyx-cyrillic 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-cursor-misc/Config.in b/package/x11r7/xfont_font-cursor-misc/Config.in
index 9b967e1..03ed530 100644
--- a/package/x11r7/xfont_font-cursor-misc/Config.in
+++ b/package/x11r7/xfont_font-cursor-misc/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_CURSOR_MISC
 	bool "font-cursor-misc"
 	help
-	  font-cursor-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-daewoo-misc/Config.in b/package/x11r7/xfont_font-daewoo-misc/Config.in
index cad2ef3..9e45341 100644
--- a/package/x11r7/xfont_font-daewoo-misc/Config.in
+++ b/package/x11r7/xfont_font-daewoo-misc/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_DAEWOO_MISC
 	bool "font-daewoo-misc"
 	help
-	  font-daewoo-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-dec-misc/Config.in b/package/x11r7/xfont_font-dec-misc/Config.in
index f682b20..326ea9b 100644
--- a/package/x11r7/xfont_font-dec-misc/Config.in
+++ b/package/x11r7/xfont_font-dec-misc/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_DEC_MISC
 	bool "font-dec-misc"
 	help
-	  font-dec-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-ibm-type1/Config.in b/package/x11r7/xfont_font-ibm-type1/Config.in
index 18a73f9..92783af 100644
--- a/package/x11r7/xfont_font-ibm-type1/Config.in
+++ b/package/x11r7/xfont_font-ibm-type1/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_IBM_TYPE1
 	bool "font-ibm-type1"
 	help
-	  font-ibm-type1 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-isas-misc/Config.in b/package/x11r7/xfont_font-isas-misc/Config.in
index d067521..2e77f66 100644
--- a/package/x11r7/xfont_font-isas-misc/Config.in
+++ b/package/x11r7/xfont_font-isas-misc/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_ISAS_MISC
 	bool "font-isas-misc"
 	help
-	  font-isas-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-jis-misc/Config.in b/package/x11r7/xfont_font-jis-misc/Config.in
index e406671..6a59cce 100644
--- a/package/x11r7/xfont_font-jis-misc/Config.in
+++ b/package/x11r7/xfont_font-jis-misc/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_JIS_MISC
 	bool "font-jis-misc"
 	help
-	  font-jis-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-micro-misc/Config.in b/package/x11r7/xfont_font-micro-misc/Config.in
index 987bf12..1420cbd 100644
--- a/package/x11r7/xfont_font-micro-misc/Config.in
+++ b/package/x11r7/xfont_font-micro-misc/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_MICRO_MISC
 	bool "font-micro-misc"
 	help
-	  font-micro-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-cyrillic/Config.in b/package/x11r7/xfont_font-misc-cyrillic/Config.in
index d1059e0..e793d70 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-misc-cyrillic/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_MISC_CYRILLIC
 	bool "font-misc-cyrillic"
 	help
-	  font-misc-cyrillic 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-ethiopic/Config.in b/package/x11r7/xfont_font-misc-ethiopic/Config.in
index 6fb564f..aa3b834 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/Config.in
+++ b/package/x11r7/xfont_font-misc-ethiopic/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_MISC_ETHIOPIC
 	bool "font-misc-ethiopic"
 	help
-	  font-misc-ethiopic 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-meltho/Config.in b/package/x11r7/xfont_font-misc-meltho/Config.in
index d416f85..dcc6c84 100644
--- a/package/x11r7/xfont_font-misc-meltho/Config.in
+++ b/package/x11r7/xfont_font-misc-meltho/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_MISC_MELTHO
 	bool "font-misc-meltho"
 	help
-	  font-misc-meltho 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-misc/Config.in b/package/x11r7/xfont_font-misc-misc/Config.in
index dd0e359..b3e4fc1 100644
--- a/package/x11r7/xfont_font-misc-misc/Config.in
+++ b/package/x11r7/xfont_font-misc-misc/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_MISC_MISC
 	bool "font-misc-misc"
 	help
-	  font-misc-misc 1.1.0
 	  No description available
diff --git a/package/x11r7/xfont_font-mutt-misc/Config.in b/package/x11r7/xfont_font-mutt-misc/Config.in
index c81508c..e27ea74 100644
--- a/package/x11r7/xfont_font-mutt-misc/Config.in
+++ b/package/x11r7/xfont_font-mutt-misc/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_MUTT_MISC
 	bool "font-mutt-misc"
 	help
-	  font-mutt-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-schumacher-misc/Config.in b/package/x11r7/xfont_font-schumacher-misc/Config.in
index 2d4c1c9..d37babc 100644
--- a/package/x11r7/xfont_font-schumacher-misc/Config.in
+++ b/package/x11r7/xfont_font-schumacher-misc/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_SCHUMACHER_MISC
 	bool "font-schumacher-misc"
 	help
-	  font-schumacher-misc 1.1.0
 	  No description available
diff --git a/package/x11r7/xfont_font-screen-cyrillic/Config.in b/package/x11r7/xfont_font-screen-cyrillic/Config.in
index 2def7b9..a1f02d0 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-screen-cyrillic/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_SCREEN_CYRILLIC
 	bool "font-screen-cyrillic"
 	help
-	  font-screen-cyrillic 1.0.2
 	  No description available
diff --git a/package/x11r7/xfont_font-sony-misc/Config.in b/package/x11r7/xfont_font-sony-misc/Config.in
index 2a831ab..a4ce4ab 100644
--- a/package/x11r7/xfont_font-sony-misc/Config.in
+++ b/package/x11r7/xfont_font-sony-misc/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_SONY_MISC
 	bool "font-sony-misc"
 	help
-	  font-sony-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-sun-misc/Config.in b/package/x11r7/xfont_font-sun-misc/Config.in
index ce41c62..07603a1 100644
--- a/package/x11r7/xfont_font-sun-misc/Config.in
+++ b/package/x11r7/xfont_font-sun-misc/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_SUN_MISC
 	bool "font-sun-misc"
 	help
-	  font-sun-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-util/Config.in b/package/x11r7/xfont_font-util/Config.in
index 932ba29..4edeffd 100644
--- a/package/x11r7/xfont_font-util/Config.in
+++ b/package/x11r7/xfont_font-util/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_UTIL
 	bool "font-util"
 	help
-	  font-util 1.1.1
 	  No description available
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/Config.in b/package/x11r7/xfont_font-winitzki-cyrillic/Config.in
index 4d321df..c804441 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_WINITZKI_CYRILLIC
 	bool "font-winitzki-cyrillic"
 	help
-	  font-winitzki-cyrillic 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-xfree86-type1/Config.in b/package/x11r7/xfont_font-xfree86-type1/Config.in
index 4fa371f..b7d0587 100644
--- a/package/x11r7/xfont_font-xfree86-type1/Config.in
+++ b/package/x11r7/xfont_font-xfree86-type1/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XFONT_FONT_XFREE86_TYPE1
 	bool "font-xfree86-type1"
 	help
-	  font-xfree86-type1 1.0.2
 	  No description available
diff --git a/package/x11r7/xlib_libFS/Config.in b/package/x11r7/xlib_libFS/Config.in
index 865825f..0c8a729 100644
--- a/package/x11r7/xlib_libFS/Config.in
+++ b/package/x11r7/xlib_libFS/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XLIB_LIBFS
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	help
-	  libFS 1.0.2
 	  X.Org FS library
diff --git a/package/x11r7/xlib_libICE/Config.in b/package/x11r7/xlib_libICE/Config.in
index 1fc57cf..d63f935 100644
--- a/package/x11r7/xlib_libICE/Config.in
+++ b/package/x11r7/xlib_libICE/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XLIB_LIBICE
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libICE 1.0.6
 	  X.Org ICE library
diff --git a/package/x11r7/xlib_libSM/Config.in b/package/x11r7/xlib_libSM/Config.in
index 0267335..ef83b53 100644
--- a/package/x11r7/xlib_libSM/Config.in
+++ b/package/x11r7/xlib_libSM/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XLIB_LIBSM
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libSM 1.1.1
 	  X.Org SM library
diff --git a/package/x11r7/xlib_libX11/Config.in b/package/x11r7/xlib_libX11/Config.in
index 5f2496c..e1189ff 100644
--- a/package/x11r7/xlib_libX11/Config.in
+++ b/package/x11r7/xlib_libX11/Config.in
@@ -13,5 +13,4 @@ config BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_BIGREQSPROTO
 	select BR2_PACKAGE_XPROTO_XCMISCPROTO
 	help
-	  libX11 1.3.2
 	  X.Org X11 library
diff --git a/package/x11r7/xlib_libXScrnSaver/Config.in b/package/x11r7/xlib_libXScrnSaver/Config.in
index 2a2a116..5df9a00 100644
--- a/package/x11r7/xlib_libXScrnSaver/Config.in
+++ b/package/x11r7/xlib_libXScrnSaver/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XLIB_LIBXSCRNSAVER
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_SCRNSAVERPROTO
 	help
-	  libXScrnSaver 1.2.0
 	  X.Org XScrnSaver library
diff --git a/package/x11r7/xlib_libXau/Config.in b/package/x11r7/xlib_libXau/Config.in
index 4c4e517..a220f01 100644
--- a/package/x11r7/xlib_libXau/Config.in
+++ b/package/x11r7/xlib_libXau/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
-	  libXau 1.0.5
 	  X.Org Xau library
diff --git a/package/x11r7/xlib_libXaw/Config.in b/package/x11r7/xlib_libXaw/Config.in
index baea7be..1c10bc0 100644
--- a/package/x11r7/xlib_libXaw/Config.in
+++ b/package/x11r7/xlib_libXaw/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XLIB_LIBXP
 	help
-	  libXaw 1.0.7
 	  X.Org Xaw library
diff --git a/package/x11r7/xlib_libXcomposite/Config.in b/package/x11r7/xlib_libXcomposite/Config.in
index 070752f..14da977 100644
--- a/package/x11r7/xlib_libXcomposite/Config.in
+++ b/package/x11r7/xlib_libXcomposite/Config.in
@@ -6,5 +6,4 @@ config BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXcomposite 0.4.1
 	  X.Org Xcomposite library
diff --git a/package/x11r7/xlib_libXcursor/Config.in b/package/x11r7/xlib_libXcursor/Config.in
index 4dc0b20..6519cc7 100644
--- a/package/x11r7/xlib_libXcursor/Config.in
+++ b/package/x11r7/xlib_libXcursor/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXcursor 1.1.10
 	  X.Org Xcursor library
diff --git a/package/x11r7/xlib_libXdamage/Config.in b/package/x11r7/xlib_libXdamage/Config.in
index b1d2e1c..2427486 100644
--- a/package/x11r7/xlib_libXdamage/Config.in
+++ b/package/x11r7/xlib_libXdamage/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXdamage 1.1.2
 	  X.Org Xdamage library
diff --git a/package/x11r7/xlib_libXdmcp/Config.in b/package/x11r7/xlib_libXdmcp/Config.in
index aa8f9e8..218ff15 100644
--- a/package/x11r7/xlib_libXdmcp/Config.in
+++ b/package/x11r7/xlib_libXdmcp/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXdmcp 1.0.3
 	  X.Org Xdmcp library
diff --git a/package/x11r7/xlib_libXext/Config.in b/package/x11r7/xlib_libXext/Config.in
index 445d0a2..823a165 100644
--- a/package/x11r7/xlib_libXext/Config.in
+++ b/package/x11r7/xlib_libXext/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXext 1.1.1
 	  X.Org Xext library
diff --git a/package/x11r7/xlib_libXfixes/Config.in b/package/x11r7/xlib_libXfixes/Config.in
index e0b941c..9bbabb2 100644
--- a/package/x11r7/xlib_libXfixes/Config.in
+++ b/package/x11r7/xlib_libXfixes/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXfixes 4.0.4
 	  X.Org Xfixes library
diff --git a/package/x11r7/xlib_libXfont/Config.in b/package/x11r7/xlib_libXfont/Config.in
index 0cb57ce..407a099 100644
--- a/package/x11r7/xlib_libXfont/Config.in
+++ b/package/x11r7/xlib_libXfont/Config.in
@@ -8,5 +8,4 @@ config BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XFONT_ENCODINGS
 	help
-	  libXfont 1.4.1
 	  X.Org Xfont library
diff --git a/package/x11r7/xlib_libXft/Config.in b/package/x11r7/xlib_libXft/Config.in
index fd7d277..6eef170 100644
--- a/package/x11r7/xlib_libXft/Config.in
+++ b/package/x11r7/xlib_libXft/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXft 2.1.14
 	  X.Org Xft library
diff --git a/package/x11r7/xlib_libXi/Config.in b/package/x11r7/xlib_libXi/Config.in
index 5f060f4..ca5ab59 100644
--- a/package/x11r7/xlib_libXi/Config.in
+++ b/package/x11r7/xlib_libXi/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXi 1.3
 	  X.Org Xi library
diff --git a/package/x11r7/xlib_libXinerama/Config.in b/package/x11r7/xlib_libXinerama/Config.in
index 0620a5e..5a79b4e 100644
--- a/package/x11r7/xlib_libXinerama/Config.in
+++ b/package/x11r7/xlib_libXinerama/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XLIB_LIBXINERAMA
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	help
-	  libXinerama 1.1
 	  X.Org Xinerama library
diff --git a/package/x11r7/xlib_libXmu/Config.in b/package/x11r7/xlib_libXmu/Config.in
index a698eb1..ed239dc 100644
--- a/package/x11r7/xlib_libXmu/Config.in
+++ b/package/x11r7/xlib_libXmu/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXmu 1.0.5
 	  X.Org Xmu library
diff --git a/package/x11r7/xlib_libXp/Config.in b/package/x11r7/xlib_libXp/Config.in
index 42c54a6..532d8ac 100644
--- a/package/x11r7/xlib_libXp/Config.in
+++ b/package/x11r7/xlib_libXp/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XLIB_LIBXP
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_PRINTPROTO
 	help
-	  libXp 1.0.0
 	  X.Org Xp library
diff --git a/package/x11r7/xlib_libXpm/Config.in b/package/x11r7/xlib_libXpm/Config.in
index 9c1ac4f..528498c 100644
--- a/package/x11r7/xlib_libXpm/Config.in
+++ b/package/x11r7/xlib_libXpm/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XLIB_LIBXPM
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXpm 3.5.8
 	  X.Org Xpm library
diff --git a/package/x11r7/xlib_libXprintAppUtil/Config.in b/package/x11r7/xlib_libXprintAppUtil/Config.in
index 82170f4..351675a 100644
--- a/package/x11r7/xlib_libXprintAppUtil/Config.in
+++ b/package/x11r7/xlib_libXprintAppUtil/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XLIB_LIBXPRINTAPPUTIL
 	select BR2_PACKAGE_XLIB_LIBXP
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	help
-	  libXprintAppUtil 1.0.1
 	  X.Org XprintAppUtil library
diff --git a/package/x11r7/xlib_libXprintUtil/Config.in b/package/x11r7/xlib_libXprintUtil/Config.in
index 2c30591..1f397f4 100644
--- a/package/x11r7/xlib_libXprintUtil/Config.in
+++ b/package/x11r7/xlib_libXprintUtil/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_PRINTPROTO
 	help
-	  libXprintUtil 1.0.1
 	  X.Org XprintUtil library
diff --git a/package/x11r7/xlib_libXrandr/Config.in b/package/x11r7/xlib_libXrandr/Config.in
index 2edbe9c..3b3ebd5 100644
--- a/package/x11r7/xlib_libXrandr/Config.in
+++ b/package/x11r7/xlib_libXrandr/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXrandr 1.3.0
 	  X.Org Xrandr library
diff --git a/package/x11r7/xlib_libXrender/Config.in b/package/x11r7/xlib_libXrender/Config.in
index d0ec551..c723e4d 100644
--- a/package/x11r7/xlib_libXrender/Config.in
+++ b/package/x11r7/xlib_libXrender/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXrender 0.9.5
 	  X.Org Xrender library
diff --git a/package/x11r7/xlib_libXres/Config.in b/package/x11r7/xlib_libXres/Config.in
index 44ca4c9..39abbbf 100644
--- a/package/x11r7/xlib_libXres/Config.in
+++ b/package/x11r7/xlib_libXres/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XLIB_LIBXRES
 	select BR2_PACKAGE_XPROTO_RESOURCEPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXres 1.0.4
 	  X.Org XRes library
diff --git a/package/x11r7/xlib_libXt/Config.in b/package/x11r7/xlib_libXt/Config.in
index 0656aab..6557e20 100644
--- a/package/x11r7/xlib_libXt/Config.in
+++ b/package/x11r7/xlib_libXt/Config.in
@@ -7,5 +7,4 @@ config BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XCB_PROTO
 	select BR2_PACKAGE_LIBXCB
 	help
-	  libXt 1.0.7
 	  X.Org Xt library
diff --git a/package/x11r7/xlib_libXtst/Config.in b/package/x11r7/xlib_libXtst/Config.in
index db50a33..a8de203 100644
--- a/package/x11r7/xlib_libXtst/Config.in
+++ b/package/x11r7/xlib_libXtst/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_RECORDPROTO
 	help
-	  libXtst 1.1.0
 	  X.Org Xtst library
diff --git a/package/x11r7/xlib_libXv/Config.in b/package/x11r7/xlib_libXv/Config.in
index 5c586d9..90f07f3 100644
--- a/package/x11r7/xlib_libXv/Config.in
+++ b/package/x11r7/xlib_libXv/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XLIB_LIBXV
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXv 1.0.5
 	  X.Org Xv library
diff --git a/package/x11r7/xlib_libXvMC/Config.in b/package/x11r7/xlib_libXvMC/Config.in
index be54cb7..90c0e74 100644
--- a/package/x11r7/xlib_libXvMC/Config.in
+++ b/package/x11r7/xlib_libXvMC/Config.in
@@ -6,5 +6,4 @@ config BR2_PACKAGE_XLIB_LIBXVMC
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXvMC 1.0.5
 	  X.Org XvMC library
diff --git a/package/x11r7/xlib_libXxf86dga/Config.in b/package/x11r7/xlib_libXxf86dga/Config.in
index f601f75..5e21502 100644
--- a/package/x11r7/xlib_libXxf86dga/Config.in
+++ b/package/x11r7/xlib_libXxf86dga/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XLIB_LIBXXF86DGA
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXxf86dga 1.1.1
 	  X.Org Xxf86dga library
diff --git a/package/x11r7/xlib_libXxf86vm/Config.in b/package/x11r7/xlib_libXxf86vm/Config.in
index 7ef8ec9..9e32188 100644
--- a/package/x11r7/xlib_libXxf86vm/Config.in
+++ b/package/x11r7/xlib_libXxf86vm/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_XLIB_LIBXXF86VM
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXxf86vm 1.1.0
 	  X.Org Xxf86vm library
diff --git a/package/x11r7/xlib_libdmx/Config.in b/package/x11r7/xlib_libdmx/Config.in
index 6a4fae5..879f689 100644
--- a/package/x11r7/xlib_libdmx/Config.in
+++ b/package/x11r7/xlib_libdmx/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XLIB_LIBDMX
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_DMXPROTO
 	help
-	  libdmx 1.1.0
 	  X.Org dmx library
diff --git a/package/x11r7/xlib_libfontenc/Config.in b/package/x11r7/xlib_libfontenc/Config.in
index 6da66cf..d2a3023 100644
--- a/package/x11r7/xlib_libfontenc/Config.in
+++ b/package/x11r7/xlib_libfontenc/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XLIB_LIBFONTENC
 	bool "libfontenc"
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libfontenc 1.0.5
 	  X.Org fontenc library
diff --git a/package/x11r7/xlib_liboldX/Config.in b/package/x11r7/xlib_liboldX/Config.in
index 968051e..e312921 100644
--- a/package/x11r7/xlib_liboldX/Config.in
+++ b/package/x11r7/xlib_liboldX/Config.in
@@ -2,5 +2,4 @@ config BR2_PACKAGE_XLIB_LIBOLDX
 	bool "liboldX"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  liboldX 1.0.1
 	  X.Org oldX library
diff --git a/package/x11r7/xlib_libxkbfile/Config.in b/package/x11r7/xlib_libxkbfile/Config.in
index f120542..ccd35fa 100644
--- a/package/x11r7/xlib_libxkbfile/Config.in
+++ b/package/x11r7/xlib_libxkbfile/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_XLIB_LIBXKBFILE
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_KBPROTO
 	help
-	  libxkbfile 1.0.6
 	  X.Org xkbfile library
diff --git a/package/x11r7/xlib_libxkbui/Config.in b/package/x11r7/xlib_libxkbui/Config.in
index 6158c0e..ceab305 100644
--- a/package/x11r7/xlib_libxkbui/Config.in
+++ b/package/x11r7/xlib_libxkbui/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_XLIB_LIBXKBUI
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_KBPROTO
 	help
-	  libxkbui 1.0.2
 	  X.Org xkbui library
diff --git a/package/x11r7/xlib_xtrans/Config.in b/package/x11r7/xlib_xtrans/Config.in
index 4b69020..7c8bae7 100644
--- a/package/x11r7/xlib_xtrans/Config.in
+++ b/package/x11r7/xlib_xtrans/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XLIB_XTRANS
 	bool "xtrans"
 	help
-	  xtrans 1.2.5
 	  X.Org xtrans library
diff --git a/package/x11r7/xproto_applewmproto/Config.in b/package/x11r7/xproto_applewmproto/Config.in
index bc677d9..51a5fd5 100644
--- a/package/x11r7/xproto_applewmproto/Config.in
+++ b/package/x11r7/xproto_applewmproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_APPLEWMPROTO
 	bool "applewmproto"
 	help
-	  applewmproto 1.4.1
 	  No description available
diff --git a/package/x11r7/xproto_bigreqsproto/Config.in b/package/x11r7/xproto_bigreqsproto/Config.in
index 10616c0..c431ef2 100644
--- a/package/x11r7/xproto_bigreqsproto/Config.in
+++ b/package/x11r7/xproto_bigreqsproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_BIGREQSPROTO
 	bool "bigreqsproto"
 	help
-	  bigreqsproto 1.1.0
 	  X.Org BigReqs protocol headers
diff --git a/package/x11r7/xproto_compositeproto/Config.in b/package/x11r7/xproto_compositeproto/Config.in
index 899a499..136900a 100644
--- a/package/x11r7/xproto_compositeproto/Config.in
+++ b/package/x11r7/xproto_compositeproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_COMPOSITEPROTO
 	bool "compositeproto"
 	help
-	  compositeproto 0.4.1
 	  X.Org Composite protocol headers
diff --git a/package/x11r7/xproto_damageproto/Config.in b/package/x11r7/xproto_damageproto/Config.in
index 1152f32..068ed2b 100644
--- a/package/x11r7/xproto_damageproto/Config.in
+++ b/package/x11r7/xproto_damageproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_DAMAGEPROTO
 	bool "damageproto"
 	help
-	  damageproto 1.2.0
 	  X.Org Damage protocol headers
diff --git a/package/x11r7/xproto_dmxproto/Config.in b/package/x11r7/xproto_dmxproto/Config.in
index 7dc2918..dc048b1 100644
--- a/package/x11r7/xproto_dmxproto/Config.in
+++ b/package/x11r7/xproto_dmxproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_DMXPROTO
 	bool "dmxproto"
 	help
-	  dmxproto 2.3
 	  X.Org DMX protocol headers
diff --git a/package/x11r7/xproto_fixesproto/Config.in b/package/x11r7/xproto_fixesproto/Config.in
index a8b9fc7..d419fa1 100644
--- a/package/x11r7/xproto_fixesproto/Config.in
+++ b/package/x11r7/xproto_fixesproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_FIXESPROTO
 	bool "fixesproto"
 	help
-	  fixesproto 4.1.1
 	  X.Org Fixes protocol headers
diff --git a/package/x11r7/xproto_fontsproto/Config.in b/package/x11r7/xproto_fontsproto/Config.in
index 11e4079..b00220c 100644
--- a/package/x11r7/xproto_fontsproto/Config.in
+++ b/package/x11r7/xproto_fontsproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_FONTSPROTO
 	bool "fontsproto"
 	help
-	  fontsproto 2.1.0
 	  X.Org Fonts protocol headers
diff --git a/package/x11r7/xproto_glproto/Config.in b/package/x11r7/xproto_glproto/Config.in
index dad2bbc..28ceb9c 100644
--- a/package/x11r7/xproto_glproto/Config.in
+++ b/package/x11r7/xproto_glproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_GLPROTO
 	bool "glproto"
 	help
-	  glproto 1.4.10
 	  X.Org GL protocol headers
diff --git a/package/x11r7/xproto_inputproto/Config.in b/package/x11r7/xproto_inputproto/Config.in
index 46d1029..fcccb26 100644
--- a/package/x11r7/xproto_inputproto/Config.in
+++ b/package/x11r7/xproto_inputproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_INPUTPROTO
 	bool "inputproto"
 	help
-	  inputproto 2.0
 	  X.Org Input protocol headers
diff --git a/package/x11r7/xproto_kbproto/Config.in b/package/x11r7/xproto_kbproto/Config.in
index 69711e3..ce568d7 100644
--- a/package/x11r7/xproto_kbproto/Config.in
+++ b/package/x11r7/xproto_kbproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_KBPROTO
 	bool "kbproto"
 	help
-	  kbproto 1.0.4
 	  X.Org KB protocol headers
diff --git a/package/x11r7/xproto_printproto/Config.in b/package/x11r7/xproto_printproto/Config.in
index 1be03df..69e214f 100644
--- a/package/x11r7/xproto_printproto/Config.in
+++ b/package/x11r7/xproto_printproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_PRINTPROTO
 	bool "printproto"
 	help
-	  printproto 1.0.3
 	  X.Org Print protocol headers
diff --git a/package/x11r7/xproto_randrproto/Config.in b/package/x11r7/xproto_randrproto/Config.in
index 4b54775..097ec8f 100644
--- a/package/x11r7/xproto_randrproto/Config.in
+++ b/package/x11r7/xproto_randrproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_RANDRPROTO
 	bool "randrproto"
 	help
-	  randrproto 1.3.1
 	  X.Org Randr protocol headers
diff --git a/package/x11r7/xproto_recordproto/Config.in b/package/x11r7/xproto_recordproto/Config.in
index 2ccddb8..9fd5b88 100644
--- a/package/x11r7/xproto_recordproto/Config.in
+++ b/package/x11r7/xproto_recordproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_RECORDPROTO
 	bool "recordproto"
 	help
-	  recordproto 1.14
 	  X.Org Record protocol headers
diff --git a/package/x11r7/xproto_renderproto/Config.in b/package/x11r7/xproto_renderproto/Config.in
index 6fed61b..5b5806f 100644
--- a/package/x11r7/xproto_renderproto/Config.in
+++ b/package/x11r7/xproto_renderproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_RENDERPROTO
 	bool "renderproto"
 	help
-	  renderproto 0.11
 	  X.Org Render protocol headers
diff --git a/package/x11r7/xproto_resourceproto/Config.in b/package/x11r7/xproto_resourceproto/Config.in
index 0eebfc7..4aec708 100644
--- a/package/x11r7/xproto_resourceproto/Config.in
+++ b/package/x11r7/xproto_resourceproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_RESOURCEPROTO
 	bool "resourceproto"
 	help
-	  resourceproto 1.1.0
 	  X.Org Resource protocol headers
diff --git a/package/x11r7/xproto_scrnsaverproto/Config.in b/package/x11r7/xproto_scrnsaverproto/Config.in
index 3c70e87..83176a0 100644
--- a/package/x11r7/xproto_scrnsaverproto/Config.in
+++ b/package/x11r7/xproto_scrnsaverproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_SCRNSAVERPROTO
 	bool "scrnsaverproto"
 	help
-	  scrnsaverproto 1.2.0
 	  X.Org ScrnSaver protocol headers
diff --git a/package/x11r7/xproto_videoproto/Config.in b/package/x11r7/xproto_videoproto/Config.in
index 589dcec..271c78f 100644
--- a/package/x11r7/xproto_videoproto/Config.in
+++ b/package/x11r7/xproto_videoproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_VIDEOPROTO
 	bool "videoproto"
 	help
-	  videoproto 2.3.0
 	  X.Org Video protocol headers
diff --git a/package/x11r7/xproto_windowswmproto/Config.in b/package/x11r7/xproto_windowswmproto/Config.in
index 1a7476f..d1a36ac 100644
--- a/package/x11r7/xproto_windowswmproto/Config.in
+++ b/package/x11r7/xproto_windowswmproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_WINDOWSWMPROTO
 	bool "windowswmproto"
 	help
-	  windowswmproto 1.0.4
 	  No description available
diff --git a/package/x11r7/xproto_xcmiscproto/Config.in b/package/x11r7/xproto_xcmiscproto/Config.in
index 49fd718..f7ba153 100644
--- a/package/x11r7/xproto_xcmiscproto/Config.in
+++ b/package/x11r7/xproto_xcmiscproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_XCMISCPROTO
 	bool "xcmiscproto"
 	help
-	  xcmiscproto 1.2.0
 	  X.Org XCMisc protocol headers
diff --git a/package/x11r7/xproto_xextproto/Config.in b/package/x11r7/xproto_xextproto/Config.in
index e1bf62f..d80d76c 100644
--- a/package/x11r7/xproto_xextproto/Config.in
+++ b/package/x11r7/xproto_xextproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_XEXTPROTO
 	bool "xextproto"
 	help
-	  xextproto 7.1.1
 	  X.Org XExt protocol headers
diff --git a/package/x11r7/xproto_xf86bigfontproto/Config.in b/package/x11r7/xproto_xf86bigfontproto/Config.in
index 1699ebf..7af30d0 100644
--- a/package/x11r7/xproto_xf86bigfontproto/Config.in
+++ b/package/x11r7/xproto_xf86bigfontproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
 	bool "xf86bigfontproto"
 	help
-	  xf86bigfontproto 1.2.0
 	  X.Org XF86BigFont protocol headers
diff --git a/package/x11r7/xproto_xf86dgaproto/Config.in b/package/x11r7/xproto_xf86dgaproto/Config.in
index 0ff27e0..7561b8a 100644
--- a/package/x11r7/xproto_xf86dgaproto/Config.in
+++ b/package/x11r7/xproto_xf86dgaproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	bool "xf86dgaproto"
 	help
-	  xf86dgaproto 2.1
 	  X.Org XF86DGA protocol headers
diff --git a/package/x11r7/xproto_xf86driproto/Config.in b/package/x11r7/xproto_xf86driproto/Config.in
index 1fd1ab9..8aeac87 100644
--- a/package/x11r7/xproto_xf86driproto/Config.in
+++ b/package/x11r7/xproto_xf86driproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	bool "xf86driproto"
 	help
-	  xf86driproto 2.1.0
 	  X.Org XF86DRI protocol headers
diff --git a/package/x11r7/xproto_xf86rushproto/Config.in b/package/x11r7/xproto_xf86rushproto/Config.in
index 0f891fb..961c31f 100644
--- a/package/x11r7/xproto_xf86rushproto/Config.in
+++ b/package/x11r7/xproto_xf86rushproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_XF86RUSHPROTO
 	bool "xf86rushproto"
 	help
-	  xf86rushproto 1.1.2
 	  X.Org XF86Rush protocol headers
diff --git a/package/x11r7/xproto_xf86vidmodeproto/Config.in b/package/x11r7/xproto_xf86vidmodeproto/Config.in
index 49a6476..395c175 100644
--- a/package/x11r7/xproto_xf86vidmodeproto/Config.in
+++ b/package/x11r7/xproto_xf86vidmodeproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	bool "xf86vidmodeproto"
 	help
-	  xf86vidmodeproto 2.3
 	  X.Org XF86VidMode protocol headers
diff --git a/package/x11r7/xproto_xineramaproto/Config.in b/package/x11r7/xproto_xineramaproto/Config.in
index c2662ad..12c8e05 100644
--- a/package/x11r7/xproto_xineramaproto/Config.in
+++ b/package/x11r7/xproto_xineramaproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	bool "xineramaproto"
 	help
-	  xineramaproto 1.2
 	  X.Org Xinerama protocol headers
diff --git a/package/x11r7/xproto_xproto/Config.in b/package/x11r7/xproto_xproto/Config.in
index 449d7bc..a5f88ef 100644
--- a/package/x11r7/xproto_xproto/Config.in
+++ b/package/x11r7/xproto_xproto/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XPROTO_XPROTO
 	bool "xproto"
 	help
-	  xproto 7.0.16
 	  X.Org xproto protocol headers
diff --git a/package/x11r7/xutil_makedepend/Config.in b/package/x11r7/xutil_makedepend/Config.in
index f94fadc..0b091b0 100644
--- a/package/x11r7/xutil_makedepend/Config.in
+++ b/package/x11r7/xutil_makedepend/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XUTIL_MAKEDEPEND
 	bool "makedepend"
 	help
-	  makedepend 1.0.2
 	  No description available
diff --git a/package/x11r7/xutil_util-macros/Config.in b/package/x11r7/xutil_util-macros/Config.in
index dd55243..10b1a59 100644
--- a/package/x11r7/xutil_util-macros/Config.in
+++ b/package/x11r7/xutil_util-macros/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XUTIL_UTIL_MACROS
 	bool "util-macros"
 	help
-	  util-macros 1.3.0
 	  No description available
-- 
1.7.0
