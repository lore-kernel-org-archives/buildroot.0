From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:57:41 +0200
Subject: [Buildroot] [PATCH 5/5] x11r7: AUTORECONF=NO is the default, remove
In-Reply-To: <cover.1316465857.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316465857.git.thomas.petazzoni@free-electrons.com>
Message-ID: <67f26d4ed596211f7e3bc5ed384cd1abf088b236.1316465857.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/libxcb/libxcb.mk                     |    1 -
 package/x11r7/mesa3d/mesa3d.mk                     |    1 -
 package/x11r7/xapp_appres/xapp_appres.mk           |    1 -
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk       |    1 -
 package/x11r7/xapp_beforelight/xapp_beforelight.mk |    1 -
 package/x11r7/xapp_bitmap/xapp_bitmap.mk           |    1 -
 package/x11r7/xapp_editres/xapp_editres.mk         |    1 -
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   |    1 -
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk     |    1 -
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk         |    1 -
 package/x11r7/xapp_iceauth/xapp_iceauth.mk         |    1 -
 package/x11r7/xapp_ico/xapp_ico.mk                 |    1 -
 package/x11r7/xapp_listres/xapp_listres.mk         |    1 -
 package/x11r7/xapp_luit/xapp_luit.mk               |    1 -
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk     |    1 -
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |    1 -
 package/x11r7/xapp_oclock/xapp_oclock.mk           |    1 -
 package/x11r7/xapp_rgb/xapp_rgb.mk                 |    1 -
 package/x11r7/xapp_rstart/xapp_rstart.mk           |    1 -
 package/x11r7/xapp_scripts/xapp_scripts.mk         |    1 -
 package/x11r7/xapp_sessreg/xapp_sessreg.mk         |    1 -
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk     |    1 -
 package/x11r7/xapp_showfont/xapp_showfont.mk       |    1 -
 package/x11r7/xapp_smproxy/xapp_smproxy.mk         |    1 -
 package/x11r7/xapp_twm/xapp_twm.mk                 |    1 -
 package/x11r7/xapp_viewres/xapp_viewres.mk         |    1 -
 package/x11r7/xapp_x11perf/xapp_x11perf.mk         |    1 -
 package/x11r7/xapp_xauth/xapp_xauth.mk             |    1 -
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk   |    1 -
 package/x11r7/xapp_xbiff/xapp_xbiff.mk             |    1 -
 package/x11r7/xapp_xcalc/xapp_xcalc.mk             |    1 -
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk   |    1 -
 package/x11r7/xapp_xclock/xapp_xclock.mk           |    1 -
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk           |    1 -
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   |    1 -
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk     |    1 -
 package/x11r7/xapp_xditview/xapp_xditview.mk       |    1 -
 package/x11r7/xapp_xdm/xapp_xdm.mk                 |    1 -
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk       |    1 -
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk       |    1 -
 package/x11r7/xapp_xedit/xapp_xedit.mk             |    1 -
 package/x11r7/xapp_xev/xapp_xev.mk                 |    1 -
 package/x11r7/xapp_xeyes/xapp_xeyes.mk             |    1 -
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk         |    1 -
 package/x11r7/xapp_xfd/xapp_xfd.mk                 |    1 -
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk       |    1 -
 package/x11r7/xapp_xfs/xapp_xfs.mk                 |    1 -
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk         |    1 -
 package/x11r7/xapp_xgamma/xapp_xgamma.mk           |    1 -
 package/x11r7/xapp_xgc/xapp_xgc.mk                 |    1 -
 package/x11r7/xapp_xhost/xapp_xhost.mk             |    1 -
 package/x11r7/xapp_xinput/xapp_xinput.mk           |    1 -
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk         |    1 -
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk           |    1 -
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk       |    1 -
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk       |    1 -
 package/x11r7/xapp_xkill/xapp_xkill.mk             |    1 -
 package/x11r7/xapp_xload/xapp_xload.mk             |    1 -
 package/x11r7/xapp_xlogo/xapp_xlogo.mk             |    1 -
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk       |    1 -
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk   |    1 -
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk       |    1 -
 package/x11r7/xapp_xmag/xapp_xmag.mk               |    1 -
 package/x11r7/xapp_xman/xapp_xman.mk               |    1 -
 package/x11r7/xapp_xmessage/xapp_xmessage.mk       |    1 -
 package/x11r7/xapp_xmh/xapp_xmh.mk                 |    1 -
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk         |    1 -
 package/x11r7/xapp_xmore/xapp_xmore.mk             |    1 -
 .../x11r7/xapp_xplsprinters/xapp_xplsprinters.mk   |    1 -
 package/x11r7/xapp_xpr/xapp_xpr.mk                 |    1 -
 .../xapp_xprehashprinterlist.mk                    |    1 -
 package/x11r7/xapp_xprop/xapp_xprop.mk             |    1 -
 package/x11r7/xapp_xrandr/xapp_xrandr.mk           |    1 -
 package/x11r7/xapp_xrdb/xapp_xrdb.mk               |    1 -
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk       |    1 -
 package/x11r7/xapp_xset/xapp_xset.mk               |    1 -
 package/x11r7/xapp_xsetmode/xapp_xsetmode.mk       |    1 -
 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk |    1 -
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk       |    1 -
 package/x11r7/xapp_xsm/xapp_xsm.mk                 |    1 -
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk       |    1 -
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk       |    1 -
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk           |    1 -
 package/x11r7/xapp_xwd/xapp_xwd.mk                 |    1 -
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk       |    1 -
 package/x11r7/xapp_xwud/xapp_xwud.mk               |    1 -
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk     |    1 -
 .../xdata_xcursor-themes/xdata_xcursor-themes.mk   |    1 -
 .../xdriver_xf86-input-acecad.mk                   |    1 -
 .../xdriver_xf86-input-aiptek.mk                   |    1 -
 .../xdriver_xf86-input-evdev.mk                    |    1 -
 .../xdriver_xf86-input-joystick.mk                 |    1 -
 .../xdriver_xf86-input-keyboard.mk                 |    1 -
 .../xdriver_xf86-input-mouse.mk                    |    1 -
 .../xdriver_xf86-input-synaptics.mk                |    1 -
 .../xdriver_xf86-input-vmmouse.mk                  |    1 -
 .../xdriver_xf86-input-void.mk                     |    1 -
 .../xdriver_xf86-video-apm.mk                      |    1 -
 .../xdriver_xf86-video-ark.mk                      |    1 -
 .../xdriver_xf86-video-ast.mk                      |    1 -
 .../xdriver_xf86-video-chips.mk                    |    1 -
 .../xdriver_xf86-video-cirrus.mk                   |    1 -
 .../xdriver_xf86-video-dummy.mk                    |    1 -
 .../xdriver_xf86-video-fbdev.mk                    |    1 -
 .../xdriver_xf86-video-geode.mk                    |    1 -
 .../xdriver_xf86-video-glide.mk                    |    1 -
 .../xdriver_xf86-video-i128.mk                     |    1 -
 .../xdriver_xf86-video-i740.mk                     |    1 -
 .../xdriver_xf86-video-neomagic.mk                 |    1 -
 .../xdriver_xf86-video-newport.mk                  |    1 -
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk |    1 -
 .../xdriver_xf86-video-rendition.mk                |    1 -
 .../xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk |    1 -
 .../xdriver_xf86-video-s3virge.mk                  |    1 -
 .../xdriver_xf86-video-siliconmotion.mk            |    1 -
 .../xdriver_xf86-video-sisusb.mk                   |    1 -
 .../xdriver_xf86-video-suncg14.mk                  |    1 -
 .../xdriver_xf86-video-suncg3.mk                   |    1 -
 .../xdriver_xf86-video-suncg6.mk                   |    1 -
 .../xdriver_xf86-video-sunffb.mk                   |    1 -
 .../xdriver_xf86-video-sunleo.mk                   |    1 -
 .../xdriver_xf86-video-suntcx.mk                   |    1 -
 .../xdriver_xf86-video-tga.mk                      |    1 -
 .../xdriver_xf86-video-trident.mk                  |    1 -
 .../xdriver_xf86-video-tseng.mk                    |    1 -
 .../xdriver_xf86-video-v4l.mk                      |    1 -
 .../xdriver_xf86-video-vmware.mk                   |    1 -
 .../xdriver_xf86-video-voodoo.mk                   |    1 -
 .../xdriver_xf86-video-wsfb.mk                     |    1 -
 package/x11r7/xfont_encodings/xfont_encodings.mk   |    1 -
 .../xfont_font-adobe-100dpi.mk                     |    1 -
 .../xfont_font-adobe-75dpi.mk                      |    1 -
 .../xfont_font-adobe-utopia-100dpi.mk              |    1 -
 .../xfont_font-adobe-utopia-75dpi.mk               |    1 -
 .../xfont_font-adobe-utopia-type1.mk               |    1 -
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |    1 -
 .../xfont_font-arabic-misc.mk                      |    1 -
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |    1 -
 .../xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk     |    1 -
 .../xfont_font-bh-lucidatypewriter-100dpi.mk       |    1 -
 .../xfont_font-bh-lucidatypewriter-75dpi.mk        |    1 -
 .../x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |    1 -
 .../xfont_font-bh-type1/xfont_font-bh-type1.mk     |    1 -
 .../xfont_font-bitstream-100dpi.mk                 |    1 -
 .../xfont_font-bitstream-75dpi.mk                  |    1 -
 .../xfont_font-bitstream-speedo.mk                 |    1 -
 .../xfont_font-bitstream-type1.mk                  |    1 -
 .../xfont_font-cronyx-cyrillic.mk                  |    1 -
 .../xfont_font-cursor-misc.mk                      |    1 -
 .../xfont_font-daewoo-misc.mk                      |    1 -
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |    1 -
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |    1 -
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |    1 -
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |    1 -
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |    1 -
 .../xfont_font-misc-cyrillic.mk                    |    1 -
 .../xfont_font-misc-ethiopic.mk                    |    1 -
 .../xfont_font-misc-meltho.mk                      |    1 -
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |    1 -
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |    1 -
 .../xfont_font-schumacher-misc.mk                  |    1 -
 .../xfont_font-screen-cyrillic.mk                  |    1 -
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |    1 -
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |    1 -
 .../xfont_font-winitzki-cyrillic.mk                |    1 -
 .../xfont_font-xfree86-type1.mk                    |    1 -
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    1 -
 package/x11r7/xlib_libFS/xlib_libFS.mk             |    1 -
 package/x11r7/xlib_libICE/xlib_libICE.mk           |    1 -
 package/x11r7/xlib_libSM/xlib_libSM.mk             |    1 -
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |    1 -
 package/x11r7/xlib_libXau/xlib_libXau.mk           |    1 -
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |    1 -
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |    1 -
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   |    1 -
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |    1 -
 package/x11r7/xlib_libXext/xlib_libXext.mk         |    1 -
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |    1 -
 .../x11r7/xlib_libXfontcache/xlib_libXfontcache.mk |    1 -
 package/x11r7/xlib_libXi/xlib_libXi.mk             |    1 -
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    1 -
 package/x11r7/xlib_libXmu/xlib_libXmu.mk           |    1 -
 package/x11r7/xlib_libXp/xlib_libXp.mk             |    1 -
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |    1 -
 .../xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk |    1 -
 .../x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk |    1 -
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk     |    1 -
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |    1 -
 package/x11r7/xlib_libXres/xlib_libXres.mk         |    1 -
 package/x11r7/xlib_libXv/xlib_libXv.mk             |    1 -
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk         |    1 -
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    1 -
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |    1 -
 package/x11r7/xlib_libdmx/xlib_libdmx.mk           |    1 -
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |    1 -
 package/x11r7/xlib_liboldX/xlib_liboldX.mk         |    1 -
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |    1 -
 package/x11r7/xlib_libxkbui/xlib_libxkbui.mk       |    1 -
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |    1 -
 .../xproto_applewmproto/xproto_applewmproto.mk     |    1 -
 .../xproto_bigreqsproto/xproto_bigreqsproto.mk     |    1 -
 .../xproto_compositeproto/xproto_compositeproto.mk |    1 -
 .../x11r7/xproto_damageproto/xproto_damageproto.mk |    1 -
 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk   |    1 -
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |    1 -
 .../x11r7/xproto_fixesproto/xproto_fixesproto.mk   |    1 -
 .../xproto_fontcacheproto/xproto_fontcacheproto.mk |    1 -
 .../x11r7/xproto_fontsproto/xproto_fontsproto.mk   |    1 -
 package/x11r7/xproto_glproto/xproto_glproto.mk     |    1 -
 .../x11r7/xproto_inputproto/xproto_inputproto.mk   |    1 -
 package/x11r7/xproto_kbproto/xproto_kbproto.mk     |    1 -
 .../x11r7/xproto_printproto/xproto_printproto.mk   |    1 -
 .../x11r7/xproto_randrproto/xproto_randrproto.mk   |    1 -
 .../x11r7/xproto_recordproto/xproto_recordproto.mk |    1 -
 .../x11r7/xproto_renderproto/xproto_renderproto.mk |    1 -
 .../xproto_resourceproto/xproto_resourceproto.mk   |    1 -
 .../xproto_scrnsaverproto/xproto_scrnsaverproto.mk |    1 -
 .../x11r7/xproto_videoproto/xproto_videoproto.mk   |    1 -
 .../xproto_windowswmproto/xproto_windowswmproto.mk |    1 -
 .../x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |    1 -
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    1 -
 .../xproto_xf86bigfontproto.mk                     |    1 -
 .../xproto_xf86dgaproto/xproto_xf86dgaproto.mk     |    1 -
 .../xproto_xf86driproto/xproto_xf86driproto.mk     |    1 -
 .../xproto_xf86rushproto/xproto_xf86rushproto.mk   |    1 -
 .../xproto_xf86vidmodeproto.mk                     |    1 -
 .../xproto_xineramaproto/xproto_xineramaproto.mk   |    1 -
 package/x11r7/xproto_xproto/xproto_xproto.mk       |    1 -
 .../xserver_xorg-server/xserver_xorg-server.mk     |    1 -
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |    1 -
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    1 -
 231 files changed, 0 insertions(+), 231 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index a3c87d1..981f816 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -9,7 +9,6 @@ LIBXCB_SITE = http://xcb.freedesktop.org/dist/
 
 LIBXCB_INSTALL_STAGING = YES
 
-LIBXCB_AUTORECONF = NO
 LIBXCB_DEPENDENCIES = \
 	host-libxslt pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
 	host-xcb-proto host-python
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index 21fc4cc..4cb044b 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -7,7 +7,6 @@ MESA3D_VERSION:=7.6.1
 MESA3D_SOURCE:=MesaLib-$(MESA3D_VERSION).tar.gz
 MESA3D_SITE:=ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 
-MESA3D_AUTORECONF = NO
 
 # Mesa DRI drivers cannot be built statically, so we must force
 # --disable-static even if the package infrastructure globally passes
diff --git a/package/x11r7/xapp_appres/xapp_appres.mk b/package/x11r7/xapp_appres/xapp_appres.mk
index 308634c..1506623 100644
--- a/package/x11r7/xapp_appres/xapp_appres.mk
+++ b/package/x11r7/xapp_appres/xapp_appres.mk
@@ -7,7 +7,6 @@
 XAPP_APPRES_VERSION = 1.0.1
 XAPP_APPRES_SOURCE = appres-$(XAPP_APPRES_VERSION).tar.bz2
 XAPP_APPRES_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_APPRES_AUTORECONF = NO
 XAPP_APPRES_DEPENDENCIES = xlib_libX11 xlib_libXt
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_appres))
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index 0350a87..34258f9 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -7,7 +7,6 @@
 XAPP_BDFTOPCF_VERSION = 1.0.2
 XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.bz2
 XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_BDFTOPCF_AUTORECONF = NO
 XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
 HOST_XAPP_BDFTOPCF_DEPENDENCIES = host-xlib_libXfont
 
diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.mk b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
index 8c1273f..7d0920f 100644
--- a/package/x11r7/xapp_beforelight/xapp_beforelight.mk
+++ b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
@@ -7,7 +7,6 @@
 XAPP_BEFORELIGHT_VERSION = 1.0.2
 XAPP_BEFORELIGHT_SOURCE = beforelight-$(XAPP_BEFORELIGHT_VERSION).tar.bz2
 XAPP_BEFORELIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_BEFORELIGHT_AUTORECONF = NO
 XAPP_BEFORELIGHT_DEPENDENCIES = xlib_libX11 xlib_libXScrnSaver xlib_libXaw xlib_libXt
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_beforelight))
diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
index 252507e..985b48e 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
@@ -7,7 +7,6 @@
 XAPP_BITMAP_VERSION = 1.0.3
 XAPP_BITMAP_SOURCE = bitmap-$(XAPP_BITMAP_VERSION).tar.bz2
 XAPP_BITMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_BITMAP_AUTORECONF = NO
 XAPP_BITMAP_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xdata_xbitmaps
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_bitmap))
diff --git a/package/x11r7/xapp_editres/xapp_editres.mk b/package/x11r7/xapp_editres/xapp_editres.mk
index 54f1b01..d17f679 100644
--- a/package/x11r7/xapp_editres/xapp_editres.mk
+++ b/package/x11r7/xapp_editres/xapp_editres.mk
@@ -7,7 +7,6 @@
 XAPP_EDITRES_VERSION = 1.0.2
 XAPP_EDITRES_SOURCE = editres-$(XAPP_EDITRES_VERSION).tar.bz2
 XAPP_EDITRES_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_EDITRES_AUTORECONF = NO
 XAPP_EDITRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_editres))
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index 00b64f1..bb98821 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -7,7 +7,6 @@
 XAPP_FONTTOSFNT_VERSION = 1.0.3
 XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
 XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_FONTTOSFNT_AUTORECONF = NO
 XAPP_FONTTOSFNT_DEPENDENCIES = freetype xlib_libX11 xlib_libfontenc
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_fonttosfnt))
diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
index 469fb4c..e83a9c8 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
@@ -7,7 +7,6 @@
 XAPP_FSLSFONTS_VERSION = 1.0.1
 XAPP_FSLSFONTS_SOURCE = fslsfonts-$(XAPP_FSLSFONTS_VERSION).tar.bz2
 XAPP_FSLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_FSLSFONTS_AUTORECONF = NO
 XAPP_FSLSFONTS_DEPENDENCIES = xlib_libFS xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_fslsfonts))
diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
index 052b572..60ef523 100644
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
+++ b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
@@ -7,7 +7,6 @@
 XAPP_FSTOBDF_VERSION = 1.0.2
 XAPP_FSTOBDF_SOURCE = fstobdf-$(XAPP_FSTOBDF_VERSION).tar.bz2
 XAPP_FSTOBDF_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_FSTOBDF_AUTORECONF = NO
 XAPP_FSTOBDF_DEPENDENCIES = xlib_libFS xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_fstobdf))
diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
index 3b9e373..c00b600 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.mk
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
@@ -7,7 +7,6 @@
 XAPP_ICEAUTH_VERSION = 1.0.3
 XAPP_ICEAUTH_SOURCE = iceauth-$(XAPP_ICEAUTH_VERSION).tar.bz2
 XAPP_ICEAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_ICEAUTH_AUTORECONF = NO
 XAPP_ICEAUTH_DEPENDENCIES = xlib_libICE xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_iceauth))
diff --git a/package/x11r7/xapp_ico/xapp_ico.mk b/package/x11r7/xapp_ico/xapp_ico.mk
index 9edeacb..5780851 100644
--- a/package/x11r7/xapp_ico/xapp_ico.mk
+++ b/package/x11r7/xapp_ico/xapp_ico.mk
@@ -7,7 +7,6 @@
 XAPP_ICO_VERSION = 1.0.2
 XAPP_ICO_SOURCE = ico-$(XAPP_ICO_VERSION).tar.bz2
 XAPP_ICO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_ICO_AUTORECONF = NO
 XAPP_ICO_DEPENDENCIES = xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_ico))
diff --git a/package/x11r7/xapp_listres/xapp_listres.mk b/package/x11r7/xapp_listres/xapp_listres.mk
index f856d7c..f5c95bc 100644
--- a/package/x11r7/xapp_listres/xapp_listres.mk
+++ b/package/x11r7/xapp_listres/xapp_listres.mk
@@ -7,7 +7,6 @@
 XAPP_LISTRES_VERSION = 1.0.1
 XAPP_LISTRES_SOURCE = listres-$(XAPP_LISTRES_VERSION).tar.bz2
 XAPP_LISTRES_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_LISTRES_AUTORECONF = NO
 XAPP_LISTRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_listres))
diff --git a/package/x11r7/xapp_luit/xapp_luit.mk b/package/x11r7/xapp_luit/xapp_luit.mk
index dc53e05..dbf8f75 100644
--- a/package/x11r7/xapp_luit/xapp_luit.mk
+++ b/package/x11r7/xapp_luit/xapp_luit.mk
@@ -7,7 +7,6 @@
 XAPP_LUIT_VERSION = 1.0.4
 XAPP_LUIT_SOURCE = luit-$(XAPP_LUIT_VERSION).tar.bz2
 XAPP_LUIT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_LUIT_AUTORECONF = NO
 XAPP_LUIT_DEPENDENCIES = xlib_libX11 xlib_libfontenc
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_luit))
diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index 443b44f..44aa5c6 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -7,7 +7,6 @@
 XAPP_MKFONTDIR_VERSION = 1.0.5
 XAPP_MKFONTDIR_SOURCE = mkfontdir-$(XAPP_MKFONTDIR_VERSION).tar.bz2
 XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_MKFONTDIR_AUTORECONF = NO
 XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
 HOST_XAPP_MKFONTDIR_DEPENDENCIES = host-xapp_mkfontscale
 
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index beec9f1..2a67b83 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -7,7 +7,6 @@
 XAPP_MKFONTSCALE_VERSION = 1.0.7
 XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
 XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_MKFONTSCALE_AUTORECONF = NO
 XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
 HOST_XAPP_MKFONTSCALE_DEPENDENCIES = host-zlib host-freetype host-xlib_libfontenc host-xproto_xproto
 
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.mk b/package/x11r7/xapp_oclock/xapp_oclock.mk
index d3f09c0..d440d24 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.mk
+++ b/package/x11r7/xapp_oclock/xapp_oclock.mk
@@ -7,7 +7,6 @@
 XAPP_OCLOCK_VERSION = 1.0.1
 XAPP_OCLOCK_SOURCE = oclock-$(XAPP_OCLOCK_VERSION).tar.bz2
 XAPP_OCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_OCLOCK_AUTORECONF = NO
 XAPP_OCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_oclock))
diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
index 95ee70b..0cbac6f 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.mk
+++ b/package/x11r7/xapp_rgb/xapp_rgb.mk
@@ -7,7 +7,6 @@
 XAPP_RGB_VERSION = 1.0.1
 XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.bz2
 XAPP_RGB_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_RGB_AUTORECONF = NO
 XAPP_RGB_DEPENDENCIES = xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_rgb))
diff --git a/package/x11r7/xapp_rstart/xapp_rstart.mk b/package/x11r7/xapp_rstart/xapp_rstart.mk
index aa37f29..3fbfb7b 100644
--- a/package/x11r7/xapp_rstart/xapp_rstart.mk
+++ b/package/x11r7/xapp_rstart/xapp_rstart.mk
@@ -7,7 +7,6 @@
 XAPP_RSTART_VERSION = 1.0.2
 XAPP_RSTART_SOURCE = rstart-$(XAPP_RSTART_VERSION).tar.bz2
 XAPP_RSTART_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_RSTART_AUTORECONF = NO
 XAPP_RSTART_DEPENDENCIES = xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_rstart))
diff --git a/package/x11r7/xapp_scripts/xapp_scripts.mk b/package/x11r7/xapp_scripts/xapp_scripts.mk
index 00fb695..bd92c32 100644
--- a/package/x11r7/xapp_scripts/xapp_scripts.mk
+++ b/package/x11r7/xapp_scripts/xapp_scripts.mk
@@ -7,7 +7,6 @@
 XAPP_SCRIPTS_VERSION = 1.0.1
 XAPP_SCRIPTS_SOURCE = scripts-$(XAPP_SCRIPTS_VERSION).tar.bz2
 XAPP_SCRIPTS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_SCRIPTS_AUTORECONF = NO
 XAPP_SCRIPTS_DEPENDENCIES = xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_scripts))
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index 699537d..801a532 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -7,7 +7,6 @@
 XAPP_SESSREG_VERSION = 1.0.5
 XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.bz2
 XAPP_SESSREG_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_SESSREG_AUTORECONF = NO
 XAPP_SESSREG_DEPENDENCIES = xlib_libX11 xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_sessreg))
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
index 7c9d0f8..a63626d 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
@@ -7,7 +7,6 @@
 XAPP_SETXKBMAP_VERSION = 1.1.0
 XAPP_SETXKBMAP_SOURCE = setxkbmap-$(XAPP_SETXKBMAP_VERSION).tar.bz2
 XAPP_SETXKBMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_SETXKBMAP_AUTORECONF = NO
 XAPP_SETXKBMAP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_setxkbmap))
diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
index 21273e4..8019c58 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ b/package/x11r7/xapp_showfont/xapp_showfont.mk
@@ -7,7 +7,6 @@
 XAPP_SHOWFONT_VERSION = 1.0.1
 XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.bz2
 XAPP_SHOWFONT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_SHOWFONT_AUTORECONF = NO
 XAPP_SHOWFONT_DEPENDENCIES = xlib_libFS
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_showfont))
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
index fa2acb3..e8c033e 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
@@ -7,7 +7,6 @@
 XAPP_SMPROXY_VERSION = 1.0.3
 XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.bz2
 XAPP_SMPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_SMPROXY_AUTORECONF = NO
 XAPP_SMPROXY_DEPENDENCIES = xlib_libXmu xlib_libXt
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_smproxy))
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index bc35293..7eb576f 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -7,7 +7,6 @@
 XAPP_TWM_VERSION = 1.0.3
 XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.bz2
 XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_TWM_AUTORECONF = NO
 XAPP_TWM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_twm))
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index a2cd1ea..17795dc 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -7,7 +7,6 @@
 XAPP_VIEWRES_VERSION = 1.0.1
 XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.bz2
 XAPP_VIEWRES_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_VIEWRES_AUTORECONF = NO
 XAPP_VIEWRES_DEPENDENCIES = xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_viewres))
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index ac8cd7a..d1c4eda 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -7,7 +7,6 @@
 XAPP_X11PERF_VERSION = 1.5.1
 XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.bz2
 XAPP_X11PERF_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_X11PERF_AUTORECONF = NO
 XAPP_X11PERF_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXft
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_x11perf))
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index c0ab92d..ac2ec35 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -7,7 +7,6 @@
 XAPP_XAUTH_VERSION = 1.0.4
 XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
 XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XAUTH_AUTORECONF = NO
 XAPP_XAUTH_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xauth))
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index 9da0c65..061df24 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -7,7 +7,6 @@
 XAPP_XBACKLIGHT_VERSION = 1.1.1
 XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.bz2
 XAPP_XBACKLIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XBACKLIGHT_AUTORECONF = NO
 XAPP_XBACKLIGHT_DEPENDENCIES = xlib_libX11 xlib_libXrandr xlib_libXrender
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xbacklight))
diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
index 6959398..df994f6 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.mk
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
@@ -7,7 +7,6 @@
 XAPP_XBIFF_VERSION = 1.0.1
 XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.bz2
 XAPP_XBIFF_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XBIFF_AUTORECONF = NO
 XAPP_XBIFF_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xbiff))
diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.mk b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
index e3ef39c..8ba6906 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.mk
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
@@ -7,7 +7,6 @@
 XAPP_XCALC_VERSION = 1.0.2
 XAPP_XCALC_SOURCE = xcalc-$(XAPP_XCALC_VERSION).tar.bz2
 XAPP_XCALC_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XCALC_AUTORECONF = NO
 XAPP_XCALC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec install-data
 XAPP_XCALC_DEPENDENCIES = xlib_libXaw
 
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index 9cfeddd..57dab05 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -7,7 +7,6 @@
 XAPP_XCLIPBOARD_VERSION = 1.0.1
 XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.bz2
 XAPP_XCLIPBOARD_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XCLIPBOARD_AUTORECONF = NO
 XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xclipboard))
diff --git a/package/x11r7/xapp_xclock/xapp_xclock.mk b/package/x11r7/xapp_xclock/xapp_xclock.mk
index 56b22fc..6bbacfa 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.mk
+++ b/package/x11r7/xapp_xclock/xapp_xclock.mk
@@ -7,7 +7,6 @@
 XAPP_XCLOCK_VERSION = 1.0.3
 XAPP_XCLOCK_SOURCE = xclock-$(XAPP_XCLOCK_VERSION).tar.bz2
 XAPP_XCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XCLOCK_AUTORECONF = NO
 XAPP_XCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXft xlib_libXrender xlib_libxkbfile
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xclock))
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
index 06af50d..aaac8fa 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
@@ -7,7 +7,6 @@
 XAPP_XCMSDB_VERSION = 1.0.2
 XAPP_XCMSDB_SOURCE = xcmsdb-$(XAPP_XCMSDB_VERSION).tar.bz2
 XAPP_XCMSDB_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XCMSDB_AUTORECONF = NO
 XAPP_XCMSDB_DEPENDENCIES = xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xcmsdb))
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index ac06efc..07565f6 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -7,7 +7,6 @@
 XAPP_XCURSORGEN_VERSION = 1.0.4
 XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.bz2
 XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XCURSORGEN_AUTORECONF = NO
 XAPP_XCURSORGEN_DEPENDENCIES = libpng xlib_libX11 xlib_libXcursor
 
 HOST_XAPP_XCURSORGEN_DEPENDENCIES = host-libpng host-xlib_libX11 host-xlib_libXcursor
diff --git a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
index 9f81357..97997ad 100644
--- a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
+++ b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
@@ -7,7 +7,6 @@
 XAPP_XDBEDIZZY_VERSION = 1.0.2
 XAPP_XDBEDIZZY_SOURCE = xdbedizzy-$(XAPP_XDBEDIZZY_VERSION).tar.bz2
 XAPP_XDBEDIZZY_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XDBEDIZZY_AUTORECONF = NO
 XAPP_XDBEDIZZY_DEPENDENCIES = xlib_libXext xlib_libXp xlib_libXprintUtil
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xdbedizzy))
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
index 9d69d81..c5abaf1 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ b/package/x11r7/xapp_xditview/xapp_xditview.mk
@@ -7,7 +7,6 @@
 XAPP_XDITVIEW_VERSION = 1.0.1
 XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.bz2
 XAPP_XDITVIEW_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XDITVIEW_AUTORECONF = NO
 XAPP_XDITVIEW_DEPENDENCIES = xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xditview))
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index e05ffc8..6f8c8f4 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -7,7 +7,6 @@
 XAPP_XDM_VERSION = 1.1.6
 XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.bz2
 XAPP_XDM_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XDM_AUTORECONF = NO
 XAPP_XDM_CONF_ENV = ac_cv_file__dev_urandom=yes
 XAPP_XDM_DEPENDENCIES = xapp_xinit xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libXdmcp xlib_libXinerama xlib_libXt xproto_xineramaproto xproto_xproto
 
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index 36cc067..31f2b5d 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -7,7 +7,6 @@
 XAPP_XDPYINFO_VERSION = 1.1.0
 XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.bz2
 XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XDPYINFO_AUTORECONF = NO
 XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXp xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_printproto xproto_renderproto xproto_xf86dgaproto xproto_xf86vidmodeproto xlib_libdmx
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xdpyinfo))
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index ce4716d..3fd64c6 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -7,7 +7,6 @@
 XAPP_XDRIINFO_VERSION = 1.0.3
 XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.bz2
 XAPP_XDRIINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XDRIINFO_AUTORECONF = NO
 XAPP_XDRIINFO_DEPENDENCIES = xlib_libX11 xproto_glproto mesa3d
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xdriinfo))
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index 888d54e..fd5d7d4 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -7,7 +7,6 @@
 XAPP_XEDIT_VERSION = 1.0.2
 XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.bz2
 XAPP_XEDIT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XEDIT_AUTORECONF = NO
 XAPP_XEDIT_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xedit))
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index 19be2c1..38d5f6a 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -7,7 +7,6 @@
 XAPP_XEV_VERSION = 1.0.4
 XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.bz2
 XAPP_XEV_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XEV_AUTORECONF = NO
 XAPP_XEV_DEPENDENCIES = xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xev))
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 74358d5..1b29e92 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -7,7 +7,6 @@
 XAPP_XEYES_VERSION = 1.0.1
 XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
 XAPP_XEYES_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XEYES_AUTORECONF = NO
 XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXt
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xeyes))
diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
index da141ae..85ff9fb 100644
--- a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
+++ b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
@@ -7,7 +7,6 @@
 XAPP_XF86DGA_VERSION = 1.0.2
 XAPP_XF86DGA_SOURCE = xf86dga-$(XAPP_XF86DGA_VERSION).tar.bz2
 XAPP_XF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XF86DGA_AUTORECONF = NO
 XAPP_XF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXxf86dga
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xf86dga))
diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index 622dafd..8958293 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -7,7 +7,6 @@
 XAPP_XFD_VERSION = 1.0.1
 XAPP_XFD_SOURCE = xfd-$(XAPP_XFD_VERSION).tar.bz2
 XAPP_XFD_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XFD_AUTORECONF = NO
 XAPP_XFD_DEPENDENCIES = freetype fontconfig xlib_libXaw xlib_libXft
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xfd))
diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index 2b27160..f0b151a 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -7,7 +7,6 @@
 XAPP_XFONTSEL_VERSION = 1.0.1
 XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.bz2
 XAPP_XFONTSEL_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XFONTSEL_AUTORECONF = NO
 XAPP_XFONTSEL_DEPENDENCIES = xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xfontsel))
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 2398d6b..47968e2 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -7,7 +7,6 @@
 XAPP_XFS_VERSION = 1.0.5
 XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
 XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XFS_AUTORECONF = NO
 XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont xproto_fontsproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xfs))
diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
index 1ea7306..8772d72 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
@@ -7,7 +7,6 @@
 XAPP_XFSINFO_VERSION = 1.0.1
 XAPP_XFSINFO_SOURCE = xfsinfo-$(XAPP_XFSINFO_VERSION).tar.bz2
 XAPP_XFSINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XFSINFO_AUTORECONF = NO
 XAPP_XFSINFO_DEPENDENCIES = xlib_libFS xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xfsinfo))
diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
index 2bdaa27..c1d8948 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.mk
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
@@ -7,7 +7,6 @@
 XAPP_XGAMMA_VERSION = 1.0.3
 XAPP_XGAMMA_SOURCE = xgamma-$(XAPP_XGAMMA_VERSION).tar.bz2
 XAPP_XGAMMA_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XGAMMA_AUTORECONF = NO
 XAPP_XGAMMA_DEPENDENCIES = xlib_libXxf86vm
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xgamma))
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index 9e642e2..df7f83a 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -7,7 +7,6 @@
 XAPP_XGC_VERSION = 1.0.1
 XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.bz2
 XAPP_XGC_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XGC_AUTORECONF = NO
 XAPP_XGC_DEPENDENCIES = xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xgc))
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index fd81537..34cda14 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -7,7 +7,6 @@
 XAPP_XHOST_VERSION = 1.0.3
 XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.bz2
 XAPP_XHOST_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XHOST_AUTORECONF = NO
 XAPP_XHOST_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xhost))
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index 423c7c2..df858cc 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -7,7 +7,6 @@
 XAPP_XINPUT_VERSION = 1.5.0
 XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
 XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XINPUT_AUTORECONF = NO
 XAPP_XINPUT_DEPENDENCIES = xlib_libX11 xlib_libXi
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xinput))
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index e9f7174..43c77a3 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -7,7 +7,6 @@
 XAPP_XKBCOMP_VERSION = 1.1.1
 XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XKBCOMP_AUTORECONF = NO
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
 HOST_XAPP_XKBCOMP_DEPENDENCIES = host-xlib_libX11 host-xlib_libxkbfile
 
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
index 48d6565..48b019c 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
@@ -7,7 +7,6 @@
 XAPP_XKBEVD_VERSION = 1.1.0
 XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.bz2
 XAPP_XKBEVD_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XKBEVD_AUTORECONF = NO
 XAPP_XKBEVD_DEPENDENCIES = xlib_libxkbfile
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xkbevd))
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
index ec96c94..67c7fbb 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
@@ -7,7 +7,6 @@
 XAPP_XKBPRINT_VERSION = 1.0.1
 XAPP_XKBPRINT_SOURCE = xkbprint-$(XAPP_XKBPRINT_VERSION).tar.bz2
 XAPP_XKBPRINT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XKBPRINT_AUTORECONF = NO
 XAPP_XKBPRINT_DEPENDENCIES = xlib_libxkbfile
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xkbprint))
diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
index 07a34f4..1d3229e 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
@@ -7,7 +7,6 @@
 XAPP_XKBUTILS_VERSION = 1.0.2
 XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.bz2
 XAPP_XKBUTILS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XKBUTILS_AUTORECONF = NO
 XAPP_XKBUTILS_DEPENDENCIES = xlib_libXaw xlib_libxkbfile
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xkbutils))
diff --git a/package/x11r7/xapp_xkill/xapp_xkill.mk b/package/x11r7/xapp_xkill/xapp_xkill.mk
index 894c552..b3bf19e 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.mk
+++ b/package/x11r7/xapp_xkill/xapp_xkill.mk
@@ -7,7 +7,6 @@
 XAPP_XKILL_VERSION = 1.0.2
 XAPP_XKILL_SOURCE = xkill-$(XAPP_XKILL_VERSION).tar.bz2
 XAPP_XKILL_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XKILL_AUTORECONF = NO
 XAPP_XKILL_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xkill))
diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index e1ae662..91a7250 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -7,7 +7,6 @@
 XAPP_XLOAD_VERSION = 1.0.2
 XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.bz2
 XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XLOAD_AUTORECONF = NO
 XAPP_XLOAD_DEPENDENCIES = xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xload))
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index eb35a6d..19af049 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -7,7 +7,6 @@
 XAPP_XLOGO_VERSION = 1.0.1
 XAPP_XLOGO_SOURCE = xlogo-$(XAPP_XLOGO_VERSION).tar.bz2
 XAPP_XLOGO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XLOGO_AUTORECONF = NO
 XAPP_XLOGO_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil xlib_libXrender \
 			  xlib_libXft host-pkg-config
 
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
index d202114..1a464cd 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -7,7 +7,6 @@
 XAPP_XLSATOMS_VERSION = 1.0.2
 XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.bz2
 XAPP_XLSATOMS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XLSATOMS_AUTORECONF = NO
 XAPP_XLSATOMS_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xlsatoms))
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
index cd522db..aafadbd 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
@@ -7,7 +7,6 @@
 XAPP_XLSCLIENTS_VERSION = 1.0.2
 XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.bz2
 XAPP_XLSCLIENTS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XLSCLIENTS_AUTORECONF = NO
 XAPP_XLSCLIENTS_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xlsclients))
diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
index 120669c..e55589e 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -7,7 +7,6 @@
 XAPP_XLSFONTS_VERSION = 1.0.1
 XAPP_XLSFONTS_SOURCE = xlsfonts-$(XAPP_XLSFONTS_VERSION).tar.bz2
 XAPP_XLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XLSFONTS_AUTORECONF = NO
 XAPP_XLSFONTS_DEPENDENCIES = xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xlsfonts))
diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
index 518fe48..4bced65 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ b/package/x11r7/xapp_xmag/xapp_xmag.mk
@@ -7,7 +7,6 @@
 XAPP_XMAG_VERSION = 1.0.2
 XAPP_XMAG_SOURCE = xmag-$(XAPP_XMAG_VERSION).tar.bz2
 XAPP_XMAG_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMAG_AUTORECONF = NO
 XAPP_XMAG_DEPENDENCIES = xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xmag))
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index 8ef0a1f..dc1fc38 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -6,7 +6,6 @@
 XAPP_XMAN_VERSION:=1.0.3
 XAPP_XMAN_SOURCE:=xman-$(XAPP_XMAN_VERSION).tar.bz2
 XAPP_XMAN_SITE:=http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMAN_AUTORECONF = NO
 XAPP_XMAN_INSTALL_TARGET = YES
 
 XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
index 9f1aa74..48e8527 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
@@ -7,7 +7,6 @@
 XAPP_XMESSAGE_VERSION = 1.0.2
 XAPP_XMESSAGE_SOURCE = xmessage-$(XAPP_XMESSAGE_VERSION).tar.bz2
 XAPP_XMESSAGE_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMESSAGE_AUTORECONF = NO
 XAPP_XMESSAGE_DEPENDENCIES = xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xmessage))
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index 500801b..aa22a8e 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -7,7 +7,6 @@
 XAPP_XMH_VERSION = 1.0.1
 XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.bz2
 XAPP_XMH_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMH_AUTORECONF = NO
 XAPP_XMH_DEPENDENCIES = xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xmh))
diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
index df4280b..f149041 100644
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
@@ -7,7 +7,6 @@
 XAPP_XMODMAP_VERSION = 1.0.4
 XAPP_XMODMAP_SOURCE = xmodmap-$(XAPP_XMODMAP_VERSION).tar.bz2
 XAPP_XMODMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMODMAP_AUTORECONF = NO
 XAPP_XMODMAP_DEPENDENCIES = xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xmodmap))
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index 0b68e71..6f2fd5e 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -7,7 +7,6 @@
 XAPP_XMORE_VERSION = 1.0.1
 XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.bz2
 XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMORE_AUTORECONF = NO
 XAPP_XMORE_DEPENDENCIES = xlib_libXprintUtil xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xmore))
diff --git a/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk b/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
index e16733b..83b8665 100644
--- a/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
+++ b/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
@@ -7,7 +7,6 @@
 XAPP_XPLSPRINTERS_VERSION = 1.0.1
 XAPP_XPLSPRINTERS_SOURCE = xplsprinters-$(XAPP_XPLSPRINTERS_VERSION).tar.bz2
 XAPP_XPLSPRINTERS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XPLSPRINTERS_AUTORECONF = NO
 XAPP_XPLSPRINTERS_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXprintUtil
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xplsprinters))
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
index 257d10b..24bd14f 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ b/package/x11r7/xapp_xpr/xapp_xpr.mk
@@ -7,7 +7,6 @@
 XAPP_XPR_VERSION = 1.0.3
 XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.bz2
 XAPP_XPR_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XPR_AUTORECONF = NO
 XAPP_XPR_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xpr))
diff --git a/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk b/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
index e9f8f43..474d6e1 100644
--- a/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
+++ b/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
@@ -7,7 +7,6 @@
 XAPP_XPREHASHPRINTERLIST_VERSION = 1.0.1
 XAPP_XPREHASHPRINTERLIST_SOURCE = xprehashprinterlist-$(XAPP_XPREHASHPRINTERLIST_VERSION).tar.bz2
 XAPP_XPREHASHPRINTERLIST_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XPREHASHPRINTERLIST_AUTORECONF = NO
 XAPP_XPREHASHPRINTERLIST_DEPENDENCIES = xlib_libX11 xlib_libXp
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xprehashprinterlist))
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index 7bcd1f0..c5cae68 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -7,7 +7,6 @@
 XAPP_XPROP_VERSION = 1.1.0
 XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.bz2
 XAPP_XPROP_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XPROP_AUTORECONF = NO
 XAPP_XPROP_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xprop))
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index 70c7e1a..09f99a6 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -7,7 +7,6 @@
 XAPP_XRANDR_VERSION = 1.3.2
 XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.bz2
 XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XRANDR_AUTORECONF = NO
 XAPP_XRANDR_DEPENDENCIES = xlib_libXrandr xlib_libX11
 XAPP_XRANDR_CONF_OPT = --disable-malloc0returnsnull
 
diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.mk b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
index c7b24b5..af56d9b 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.mk
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
@@ -7,7 +7,6 @@
 XAPP_XRDB_VERSION = 1.0.6
 XAPP_XRDB_SOURCE = xrdb-$(XAPP_XRDB_VERSION).tar.bz2
 XAPP_XRDB_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XRDB_AUTORECONF = NO
 XAPP_XRDB_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xrdb))
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
index 9a9022c..9074fb4 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
@@ -7,7 +7,6 @@
 XAPP_XREFRESH_VERSION = 1.0.3
 XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.bz2
 XAPP_XREFRESH_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XREFRESH_AUTORECONF = NO
 XAPP_XREFRESH_DEPENDENCIES = xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xrefresh))
diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
index 51ddd98..01b0414 100644
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ b/package/x11r7/xapp_xset/xapp_xset.mk
@@ -7,7 +7,6 @@
 XAPP_XSET_VERSION = 1.1.0
 XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.bz2
 XAPP_XSET_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XSET_AUTORECONF = NO
 XAPP_XSET_DEPENDENCIES = xlib_libXfontcache xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xset))
diff --git a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
index 23db1f9..8bcf7c8 100644
--- a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
+++ b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
@@ -7,7 +7,6 @@
 XAPP_XSETMODE_VERSION = 1.0.0
 XAPP_XSETMODE_SOURCE = xsetmode-$(XAPP_XSETMODE_VERSION).tar.bz2
 XAPP_XSETMODE_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XSETMODE_AUTORECONF = NO
 XAPP_XSETMODE_DEPENDENCIES = xlib_libX11 xlib_libXi
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xsetmode))
diff --git a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
index 7c65bc7..eda00c2 100644
--- a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
+++ b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
@@ -7,7 +7,6 @@
 XAPP_XSETPOINTER_VERSION = 1.0.0
 XAPP_XSETPOINTER_SOURCE = xsetpointer-$(XAPP_XSETPOINTER_VERSION).tar.bz2
 XAPP_XSETPOINTER_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XSETPOINTER_AUTORECONF = NO
 XAPP_XSETPOINTER_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXi
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xsetpointer))
diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
index 523c89a..738c746 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
@@ -7,7 +7,6 @@
 XAPP_XSETROOT_VERSION = 1.0.3
 XAPP_XSETROOT_SOURCE = xsetroot-$(XAPP_XSETROOT_VERSION).tar.bz2
 XAPP_XSETROOT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XSETROOT_AUTORECONF = NO
 XAPP_XSETROOT_DEPENDENCIES = xlib_libX11 xlib_libXmu xdata_xbitmaps
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xsetroot))
diff --git a/package/x11r7/xapp_xsm/xapp_xsm.mk b/package/x11r7/xapp_xsm/xapp_xsm.mk
index 76cc07b..c317ad8 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.mk
+++ b/package/x11r7/xapp_xsm/xapp_xsm.mk
@@ -7,7 +7,6 @@
 XAPP_XSM_VERSION = 1.0.1
 XAPP_XSM_SOURCE = xsm-$(XAPP_XSM_VERSION).tar.bz2
 XAPP_XSM_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XSM_AUTORECONF = NO
 XAPP_XSM_DEPENDENCIES = xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xsm))
diff --git a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
index 6137974..e4544cd 100644
--- a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
+++ b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
@@ -7,7 +7,6 @@
 XAPP_XSTDCMAP_VERSION = 1.0.1
 XAPP_XSTDCMAP_SOURCE = xstdcmap-$(XAPP_XSTDCMAP_VERSION).tar.bz2
 XAPP_XSTDCMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XSTDCMAP_AUTORECONF = NO
 XAPP_XSTDCMAP_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xstdcmap))
diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
index 039da18..4ec5e86 100644
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
+++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
@@ -7,7 +7,6 @@
 XAPP_XVIDTUNE_VERSION = 1.0.1
 XAPP_XVIDTUNE_SOURCE = xvidtune-$(XAPP_XVIDTUNE_VERSION).tar.bz2
 XAPP_XVIDTUNE_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XVIDTUNE_AUTORECONF = NO
 XAPP_XVIDTUNE_DEPENDENCIES = xlib_libXaw xlib_libXxf86vm
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xvidtune))
diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
index 59d8ad3..ea64536 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
@@ -7,7 +7,6 @@
 XAPP_XVINFO_VERSION = 1.1.0
 XAPP_XVINFO_SOURCE = xvinfo-$(XAPP_XVINFO_VERSION).tar.bz2
 XAPP_XVINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XVINFO_AUTORECONF = NO
 XAPP_XVINFO_DEPENDENCIES = xlib_libX11 xlib_libXv
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xvinfo))
diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
index bdd6182..aa41bea 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ b/package/x11r7/xapp_xwd/xapp_xwd.mk
@@ -7,7 +7,6 @@
 XAPP_XWD_VERSION = 1.0.3
 XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.bz2
 XAPP_XWD_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XWD_AUTORECONF = NO
 XAPP_XWD_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xwd))
diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
index 36f11f7..fff70a6 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
@@ -7,7 +7,6 @@
 XAPP_XWININFO_VERSION = 1.0.5
 XAPP_XWININFO_SOURCE = xwininfo-$(XAPP_XWININFO_VERSION).tar.bz2
 XAPP_XWININFO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XWININFO_AUTORECONF = NO
 XAPP_XWININFO_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xwininfo))
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index 0640f78..db9ddde 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -7,7 +7,6 @@
 XAPP_XWUD_VERSION = 1.0.2
 XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.bz2
 XAPP_XWUD_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XWUD_AUTORECONF = NO
 XAPP_XWUD_DEPENDENCIES = xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xwud))
diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
index c1bb301..40f6144 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
@@ -7,7 +7,6 @@
 XDATA_XBITMAPS_VERSION = 1.1.0
 XDATA_XBITMAPS_SOURCE = xbitmaps-$(XDATA_XBITMAPS_VERSION).tar.bz2
 XDATA_XBITMAPS_SITE = http://xorg.freedesktop.org/releases/individual/data
-XDATA_XBITMAPS_AUTORECONF = NO
 XDATA_XBITMAPS_INSTALL_STAGING = YES
 XDATA_XBITMAPS_INSTALL_TARGET = YES
 
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index 3be96e5..f296962 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -6,7 +6,6 @@
 XDATA_XCURSOR_THEMES_VERSION = 1.0.2
 XDATA_XCURSOR_THEMES_SOURCE = xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.bz2
 XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
-XDATA_XCURSOR_THEMES_AUTORECONF = NO
 XDATA_XCURSOR_THEMES_INSTALL_STAGING = YES
 XDATA_XCURSOR_THEMES_INSTALL_TARGET = YES
 XDATA_XCURSOR_THEMES_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
diff --git a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
index d6f958c..6578832 100644
--- a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
+++ b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_INPUT_ACECAD_VERSION = 1.4.0
 XDRIVER_XF86_INPUT_ACECAD_SOURCE = xf86-input-acecad-$(XDRIVER_XF86_INPUT_ACECAD_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_ACECAD_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_ACECAD_AUTORECONF = NO
 XDRIVER_XF86_INPUT_ACECAD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-acecad))
diff --git a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
index aa93fdc..570be2c 100644
--- a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
+++ b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_INPUT_AIPTEK_VERSION = 1.3.0
 XDRIVER_XF86_INPUT_AIPTEK_SOURCE = xf86-input-aiptek-$(XDRIVER_XF86_INPUT_AIPTEK_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_AIPTEK_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_AIPTEK_AUTORECONF = NO
 XDRIVER_XF86_INPUT_AIPTEK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-aiptek))
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index bb5a1d7..894015f 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.3.0
 XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_EVDEV_AUTORECONF = NO
 XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = xproto_inputproto xserver_xorg-server xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-evdev))
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
index f6d5619..7ecdcc7 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_INPUT_JOYSTICK_VERSION = 1.4.99.2
 XDRIVER_XF86_INPUT_JOYSTICK_SOURCE = xf86-input-joystick-$(XDRIVER_XF86_INPUT_JOYSTICK_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_JOYSTICK_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_JOYSTICK_AUTORECONF = NO
 XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-joystick))
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
index 15b0715..3527887 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_INPUT_KEYBOARD_VERSION = 1.4.0
 XDRIVER_XF86_INPUT_KEYBOARD_SOURCE = xf86-input-keyboard-$(XDRIVER_XF86_INPUT_KEYBOARD_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_KEYBOARD_AUTORECONF = NO
 XDRIVER_XF86_INPUT_KEYBOARD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_kbproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-keyboard))
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 6be28c7..9210d30 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.5.0
 XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_MOUSE_AUTORECONF = NO
 XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-mouse))
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index 4cb16ea..3b0929e 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.2.0
 XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_SYNAPTICS_AUTORECONF = NO
 XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-synaptics))
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
index 3526236..8cd8b6c 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_INPUT_VMMOUSE_VERSION = 12.6.5
 XDRIVER_XF86_INPUT_VMMOUSE_SOURCE = xf86-input-vmmouse-$(XDRIVER_XF86_INPUT_VMMOUSE_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_VMMOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_VMMOUSE_AUTORECONF = NO
 XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-vmmouse))
diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
index fb16bb7..508dbbd 100644
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
+++ b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_INPUT_VOID_VERSION = 1.3.0
 XDRIVER_XF86_INPUT_VOID_SOURCE = xf86-input-void-$(XDRIVER_XF86_INPUT_VOID_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_VOID_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_VOID_AUTORECONF = NO
 XDRIVER_XF86_INPUT_VOID_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-void))
diff --git a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
index c0f4b82..3435337 100644
--- a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
+++ b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_APM_VERSION = 1.2.2
 XDRIVER_XF86_VIDEO_APM_SOURCE = xf86-video-apm-$(XDRIVER_XF86_VIDEO_APM_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_APM_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_APM_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_APM_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86rushproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-apm))
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
index 7442706..ae9165e 100644
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_ARK_VERSION = 0.7.2
 XDRIVER_XF86_VIDEO_ARK_SOURCE = xf86-video-ark-$(XDRIVER_XF86_VIDEO_ARK_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ARK_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_ARK_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_ARK_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-ark))
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
index daa94bb..27c4a91 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
@@ -7,6 +7,5 @@
 XDRIVER_XF86_VIDEO_AST_VERSION = 0.89.9
 XDRIVER_XF86_VIDEO_AST_SOURCE = xf86-video-ast-$(XDRIVER_XF86_VIDEO_AST_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AST_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_AST_AUTORECONF = NO
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-ast))
diff --git a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
index 0dc5dd1..52f9dc3 100644
--- a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
+++ b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_CHIPS_VERSION = 1.2.2
 XDRIVER_XF86_VIDEO_CHIPS_SOURCE = xf86-video-chips-$(XDRIVER_XF86_VIDEO_CHIPS_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_CHIPS_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_CHIPS_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_CHIPS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-chips))
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
index 47c3c9b..f10f842 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
+++ b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_CIRRUS_VERSION = 1.3.2
 XDRIVER_XF86_VIDEO_CIRRUS_SOURCE = xf86-video-cirrus-$(XDRIVER_XF86_VIDEO_CIRRUS_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_CIRRUS_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_CIRRUS_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_CIRRUS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-cirrus))
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
index 2121748..548a4cb 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.3.2
 XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_DUMMY_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_DUMMY_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xf86dgaproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-dummy))
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
index 97c20fa..2d51c8a 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_FBDEV_VERSION = 0.4.1
 XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_FBDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_FBDEV_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_FBDEV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-fbdev))
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index cd94246..52d1007 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.6
 XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_GEODE_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_GEODE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-geode))
diff --git a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
index 0115cec..7fc30aa 100644
--- a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
+++ b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_GLIDE_VERSION = 1.0.3
 XDRIVER_XF86_VIDEO_GLIDE_SOURCE = xf86-video-glide-$(XDRIVER_XF86_VIDEO_GLIDE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GLIDE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_GLIDE_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_GLIDE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-glide))
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
index 63c9ad7..fc75ba1 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_I128_VERSION = 1.3.3
 XDRIVER_XF86_VIDEO_I128_SOURCE = xf86-video-i128-$(XDRIVER_XF86_VIDEO_I128_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_I128_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_I128_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_I128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-i128))
diff --git a/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk b/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
index 493fd34..fd885fc 100644
--- a/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
+++ b/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_I740_VERSION = 1.3.2
 XDRIVER_XF86_VIDEO_I740_SOURCE = xf86-video-i740-$(XDRIVER_XF86_VIDEO_I740_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_I740_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_I740_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_I740_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-i740))
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
index db9c2c0..55a10a4 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION = 1.2.4
 XDRIVER_XF86_VIDEO_NEOMAGIC_SOURCE = xf86-video-neomagic-$(XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NEOMAGIC_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_NEOMAGIC_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_NEOMAGIC_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-neomagic))
diff --git a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
index b9bf3e7..4b58fdd 100644
--- a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
+++ b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_NEWPORT_VERSION = 0.2.3
 XDRIVER_XF86_VIDEO_NEWPORT_SOURCE = xf86-video-newport-$(XDRIVER_XF86_VIDEO_NEWPORT_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NEWPORT_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_NEWPORT_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_NEWPORT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-newport))
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index 9f969e5..ecd0992 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.15
 XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_NV_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_NV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-nv))
diff --git a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
index dc03a87..9720532 100644
--- a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
+++ b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_RENDITION_VERSION = 4.2.3
 XDRIVER_XF86_VIDEO_RENDITION_SOURCE = xf86-video-rendition-$(XDRIVER_XF86_VIDEO_RENDITION_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_RENDITION_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_RENDITION_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_RENDITION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-rendition))
diff --git a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk b/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
index d6f7327..76ac969 100644
--- a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
+++ b/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_S3_VERSION = 0.6.3
 XDRIVER_XF86_VIDEO_S3_SOURCE = xf86-video-s3-$(XDRIVER_XF86_VIDEO_S3_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_S3_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_S3_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_S3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-s3))
diff --git a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk b/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
index 9c7b2c2..a7e5068 100644
--- a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
+++ b/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_S3VIRGE_VERSION = 1.10.4
 XDRIVER_XF86_VIDEO_S3VIRGE_SOURCE = xf86-video-s3virge-$(XDRIVER_XF86_VIDEO_S3VIRGE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_S3VIRGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_S3VIRGE_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_S3VIRGE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-s3virge))
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index 97e416a..fd989bd 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.3
 XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SILICONMOTION_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-siliconmotion))
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
index 3cd6012..6336719 100644
--- a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
+++ b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_SISUSB_VERSION = 0.9.3
 XDRIVER_XF86_VIDEO_SISUSB_SOURCE = xf86-video-sisusb-$(XDRIVER_XF86_VIDEO_SISUSB_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SISUSB_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SISUSB_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SISUSB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xineramaproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sisusb))
diff --git a/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk b/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
index 6a0fb04..4caf3c6 100644
--- a/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_SUNCG14_VERSION = 1.1.1
 XDRIVER_XF86_VIDEO_SUNCG14_SOURCE = xf86-video-suncg14-$(XDRIVER_XF86_VIDEO_SUNCG14_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SUNCG14_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNCG14_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNCG14_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-suncg14))
diff --git a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk b/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
index 7ba7ecd..aece361 100644
--- a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_SUNCG3_VERSION = 1.1.1
 XDRIVER_XF86_VIDEO_SUNCG3_SOURCE = xf86-video-suncg3-$(XDRIVER_XF86_VIDEO_SUNCG3_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SUNCG3_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNCG3_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNCG3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-suncg3))
diff --git a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk b/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
index 7234e98..0f55677 100644
--- a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_SUNCG6_VERSION = 1.1.1
 XDRIVER_XF86_VIDEO_SUNCG6_SOURCE = xf86-video-suncg6-$(XDRIVER_XF86_VIDEO_SUNCG6_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SUNCG6_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNCG6_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNCG6_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-suncg6))
diff --git a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
index 7c6019b..eea82f6 100644
--- a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
+++ b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_SUNFFB_VERSION = 1.2.1
 XDRIVER_XF86_VIDEO_SUNFFB_SOURCE = xf86-video-sunffb-$(XDRIVER_XF86_VIDEO_SUNFFB_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SUNFFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNFFB_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNFFB_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sunffb))
diff --git a/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk b/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
index 38af6d0..4b3c705 100644
--- a/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
+++ b/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_SUNLEO_VERSION = 1.2.0
 XDRIVER_XF86_VIDEO_SUNLEO_SOURCE = xf86-video-sunleo-$(XDRIVER_XF86_VIDEO_SUNLEO_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SUNLEO_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNLEO_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNLEO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sunleo))
diff --git a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk b/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
index b26d659..dbf8560 100644
--- a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
+++ b/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_SUNTCX_VERSION = 1.1.1
 XDRIVER_XF86_VIDEO_SUNTCX_SOURCE = xf86-video-suntcx-$(XDRIVER_XF86_VIDEO_SUNTCX_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SUNTCX_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNTCX_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNTCX_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-suntcx))
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
index 68e58fb..46c0550 100644
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
+++ b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_TGA_VERSION = 1.2.1
 XDRIVER_XF86_VIDEO_TGA_SOURCE = xf86-video-tga-$(XDRIVER_XF86_VIDEO_TGA_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_TGA_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_TGA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-tga))
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
index da3edbb..249e66d 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_TRIDENT_VERSION = 1.3.3
 XDRIVER_XF86_VIDEO_TRIDENT_SOURCE = xf86-video-trident-$(XDRIVER_XF86_VIDEO_TRIDENT_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TRIDENT_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_TRIDENT_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_TRIDENT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-trident))
diff --git a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
index 6ad8023..0138a23 100644
--- a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
+++ b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_TSENG_VERSION = 1.2.3
 XDRIVER_XF86_VIDEO_TSENG_SOURCE = xf86-video-tseng-$(XDRIVER_XF86_VIDEO_TSENG_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TSENG_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_TSENG_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_TSENG_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-tseng))
diff --git a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
index dffcf13..8c09d43 100644
--- a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
+++ b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_V4L_VERSION = 0.2.0
 XDRIVER_XF86_VIDEO_V4L_SOURCE = xf86-video-v4l-$(XDRIVER_XF86_VIDEO_V4L_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_V4L_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_V4L_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_V4L_DEPENDENCIES = xserver_xorg-server xproto_randrproto xproto_videoproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-v4l))
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
index a92bc3b..ac2d78e 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_VMWARE_VERSION = 10.16.8
 XDRIVER_XF86_VIDEO_VMWARE_SOURCE = xf86-video-vmware-$(XDRIVER_XF86_VIDEO_VMWARE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_VMWARE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_VMWARE_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xineramaproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-vmware))
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
index dadd3f4..f721d20 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
+++ b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_VOODOO_VERSION = 1.2.3
 XDRIVER_XF86_VIDEO_VOODOO_SOURCE = xf86-video-voodoo-$(XDRIVER_XF86_VIDEO_VOODOO_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_VOODOO_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_VOODOO_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_VOODOO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-voodoo))
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
index e71715a..9354019 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
+++ b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
@@ -7,7 +7,6 @@
 XDRIVER_XF86_VIDEO_WSFB_VERSION = 0.3.0
 XDRIVER_XF86_VIDEO_WSFB_SOURCE = xf86-video-wsfb-$(XDRIVER_XF86_VIDEO_WSFB_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_WSFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_WSFB_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_WSFB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-wsfb))
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index ed94e49..9172867 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -7,7 +7,6 @@
 XFONT_ENCODINGS_VERSION = 1.0.3
 XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
 XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_ENCODINGS_AUTORECONF = NO
 XFONT_ENCODINGS_MAKE_OPT =
 XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
 HOST_XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
index 2b9c50c..4fab9a6 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_ADOBE_100DPI_VERSION = 1.0.1
 XFONT_FONT_ADOBE_100DPI_SOURCE = font-adobe-100dpi-$(XFONT_FONT_ADOBE_100DPI_VERSION).tar.bz2
 XFONT_FONT_ADOBE_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ADOBE_100DPI_AUTORECONF = NO
 XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index 2d7791a..7f25fe3 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_ADOBE_75DPI_VERSION = 1.0.1
 XFONT_FONT_ADOBE_75DPI_SOURCE = font-adobe-75dpi-$(XFONT_FONT_ADOBE_75DPI_VERSION).tar.bz2
 XFONT_FONT_ADOBE_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ADOBE_75DPI_AUTORECONF = NO
 XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index 2ed27f4..f5ec5c4 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION = 1.0.2
 XFONT_FONT_ADOBE_UTOPIA_100DPI_SOURCE = font-adobe-utopia-100dpi-$(XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION).tar.bz2
 XFONT_FONT_ADOBE_UTOPIA_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ADOBE_UTOPIA_100DPI_AUTORECONF = NO
 XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index ead4196..75f0a95 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION = 1.0.2
 XFONT_FONT_ADOBE_UTOPIA_75DPI_SOURCE = font-adobe-utopia-75dpi-$(XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION).tar.bz2
 XFONT_FONT_ADOBE_UTOPIA_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ADOBE_UTOPIA_75DPI_AUTORECONF = NO
 XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
index 983bab6..a662f97 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION = 1.0.2
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_SOURCE = font-adobe-utopia-type1-$(XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION).tar.bz2
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_AUTORECONF = NO
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index 1e85f3e..db26d8e 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_ALIAS_VERSION = 1.0.2
 XFONT_FONT_ALIAS_SOURCE = font-alias-$(XFONT_FONT_ALIAS_VERSION).tar.bz2
 XFONT_FONT_ALIAS_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ALIAS_AUTORECONF = NO
 XFONT_FONT_ALIAS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ALIAS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ALIAS_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index 5a1253a..b9d91a2 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_ARABIC_MISC_VERSION = 1.0.1
 XFONT_FONT_ARABIC_MISC_SOURCE = font-arabic-misc-$(XFONT_FONT_ARABIC_MISC_VERSION).tar.bz2
 XFONT_FONT_ARABIC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ARABIC_MISC_AUTORECONF = NO
 XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index f2f796a..240b886 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_BH_100DPI_VERSION = 1.0.1
 XFONT_FONT_BH_100DPI_SOURCE = font-bh-100dpi-$(XFONT_FONT_BH_100DPI_VERSION).tar.bz2
 XFONT_FONT_BH_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BH_100DPI_AUTORECONF = NO
 XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
index 4d08be4..2f8668a 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_BH_75DPI_VERSION = 1.0.1
 XFONT_FONT_BH_75DPI_SOURCE = font-bh-75dpi-$(XFONT_FONT_BH_75DPI_VERSION).tar.bz2
 XFONT_FONT_BH_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BH_75DPI_AUTORECONF = NO
 XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
index a7897c2..840d0ca 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_VERSION = 1.0.1
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SOURCE = font-bh-lucidatypewriter-100dpi-$(XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_VERSION).tar.bz2
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_AUTORECONF = NO
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
index 04a3246..75ead0b 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_VERSION = 1.0.1
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SOURCE = font-bh-lucidatypewriter-75dpi-$(XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_VERSION).tar.bz2
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_AUTORECONF = NO
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
index ea2c82a..a8e8381 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_BH_TTF_VERSION = 1.0.1
 XFONT_FONT_BH_TTF_SOURCE = font-bh-ttf-$(XFONT_FONT_BH_TTF_VERSION).tar.bz2
 XFONT_FONT_BH_TTF_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BH_TTF_AUTORECONF = NO
 XFONT_FONT_BH_TTF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BH_TTF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_TTF_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
index 3f5a025..fce4056 100644
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_BH_TYPE1_VERSION = 1.0.1
 XFONT_FONT_BH_TYPE1_SOURCE = font-bh-type1-$(XFONT_FONT_BH_TYPE1_VERSION).tar.bz2
 XFONT_FONT_BH_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BH_TYPE1_AUTORECONF = NO
 XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
index a89db53..34d9157 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_BITSTREAM_100DPI_VERSION = 1.0.1
 XFONT_FONT_BITSTREAM_100DPI_SOURCE = font-bitstream-100dpi-$(XFONT_FONT_BITSTREAM_100DPI_VERSION).tar.bz2
 XFONT_FONT_BITSTREAM_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BITSTREAM_100DPI_AUTORECONF = NO
 XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index ea2fd41..dd01534 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_BITSTREAM_75DPI_VERSION = 1.0.1
 XFONT_FONT_BITSTREAM_75DPI_SOURCE = font-bitstream-75dpi-$(XFONT_FONT_BITSTREAM_75DPI_VERSION).tar.bz2
 XFONT_FONT_BITSTREAM_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BITSTREAM_75DPI_AUTORECONF = NO
 XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk b/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
index f867c7e..65dfbaa 100644
--- a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
+++ b/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_BITSTREAM_SPEEDO_VERSION = 1.0.1
 XFONT_FONT_BITSTREAM_SPEEDO_SOURCE = font-bitstream-speedo-$(XFONT_FONT_BITSTREAM_SPEEDO_VERSION).tar.bz2
 XFONT_FONT_BITSTREAM_SPEEDO_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BITSTREAM_SPEEDO_AUTORECONF = NO
 XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_SPEEDO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
index 75a60de..5cde0c7 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_BITSTREAM_TYPE1_VERSION = 1.0.1
 XFONT_FONT_BITSTREAM_TYPE1_SOURCE = font-bitstream-type1-$(XFONT_FONT_BITSTREAM_TYPE1_VERSION).tar.bz2
 XFONT_FONT_BITSTREAM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BITSTREAM_TYPE1_AUTORECONF = NO
 XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index 484bf4b..5b0b191 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_CRONYX_CYRILLIC_VERSION = 1.0.1
 XFONT_FONT_CRONYX_CYRILLIC_SOURCE = font-cronyx-cyrillic-$(XFONT_FONT_CRONYX_CYRILLIC_VERSION).tar.bz2
 XFONT_FONT_CRONYX_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_CRONYX_CYRILLIC_AUTORECONF = NO
 XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index 755f6ec..9de0e43 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_CURSOR_MISC_VERSION = 1.0.1
 XFONT_FONT_CURSOR_MISC_SOURCE = font-cursor-misc-$(XFONT_FONT_CURSOR_MISC_VERSION).tar.bz2
 XFONT_FONT_CURSOR_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_CURSOR_MISC_AUTORECONF = NO
 XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index c66bbbb..02e1fba 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_DAEWOO_MISC_VERSION = 1.0.1
 XFONT_FONT_DAEWOO_MISC_SOURCE = font-daewoo-misc-$(XFONT_FONT_DAEWOO_MISC_VERSION).tar.bz2
 XFONT_FONT_DAEWOO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_DAEWOO_MISC_AUTORECONF = NO
 XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index 9c510a1..ae530b9 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_DEC_MISC_VERSION = 1.0.1
 XFONT_FONT_DEC_MISC_SOURCE = font-dec-misc-$(XFONT_FONT_DEC_MISC_VERSION).tar.bz2
 XFONT_FONT_DEC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_DEC_MISC_AUTORECONF = NO
 XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
index 075f4ba..561c317 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_IBM_TYPE1_VERSION = 1.0.1
 XFONT_FONT_IBM_TYPE1_SOURCE = font-ibm-type1-$(XFONT_FONT_IBM_TYPE1_VERSION).tar.bz2
 XFONT_FONT_IBM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_IBM_TYPE1_AUTORECONF = NO
 XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_IBM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 5635ff6..e7a16ee 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_ISAS_MISC_VERSION = 1.0.1
 XFONT_FONT_ISAS_MISC_SOURCE = font-isas-misc-$(XFONT_FONT_ISAS_MISC_VERSION).tar.bz2
 XFONT_FONT_ISAS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ISAS_MISC_AUTORECONF = NO
 XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index 4f1a74e..50fa87f 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_JIS_MISC_VERSION = 1.0.1
 XFONT_FONT_JIS_MISC_SOURCE = font-jis-misc-$(XFONT_FONT_JIS_MISC_VERSION).tar.bz2
 XFONT_FONT_JIS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_JIS_MISC_AUTORECONF = NO
 XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index 0b1f35c..0c343f6 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_MICRO_MISC_VERSION = 1.0.1
 XFONT_FONT_MICRO_MISC_SOURCE = font-micro-misc-$(XFONT_FONT_MICRO_MISC_VERSION).tar.bz2
 XFONT_FONT_MICRO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_MICRO_MISC_AUTORECONF = NO
 XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index 3ae408d..ac773e4 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_MISC_CYRILLIC_VERSION = 1.0.1
 XFONT_FONT_MISC_CYRILLIC_SOURCE = font-misc-cyrillic-$(XFONT_FONT_MISC_CYRILLIC_VERSION).tar.bz2
 XFONT_FONT_MISC_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_MISC_CYRILLIC_AUTORECONF = NO
 XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
index e093781..7786f9b 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_MISC_ETHIOPIC_VERSION = 1.0.1
 XFONT_FONT_MISC_ETHIOPIC_SOURCE = font-misc-ethiopic-$(XFONT_FONT_MISC_ETHIOPIC_VERSION).tar.bz2
 XFONT_FONT_MISC_ETHIOPIC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_MISC_ETHIOPIC_AUTORECONF = NO
 XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_ETHIOPIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
index e04f01d..312462d 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_MISC_MELTHO_VERSION = 1.0.1
 XFONT_FONT_MISC_MELTHO_SOURCE = font-misc-meltho-$(XFONT_FONT_MISC_MELTHO_VERSION).tar.bz2
 XFONT_FONT_MISC_MELTHO_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_MISC_MELTHO_AUTORECONF = NO
 XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MELTHO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index f6a5564..ca20bb0 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_MISC_MISC_VERSION = 1.1.0
 XFONT_FONT_MISC_MISC_SOURCE = font-misc-misc-$(XFONT_FONT_MISC_MISC_VERSION).tar.bz2
 XFONT_FONT_MISC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_MISC_MISC_AUTORECONF = NO
 XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index 28995ef..89e229a 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_MUTT_MISC_VERSION = 1.0.1
 XFONT_FONT_MUTT_MISC_SOURCE = font-mutt-misc-$(XFONT_FONT_MUTT_MISC_VERSION).tar.bz2
 XFONT_FONT_MUTT_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_MUTT_MISC_AUTORECONF = NO
 XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index 86dc54b..525a5d5 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_SCHUMACHER_MISC_VERSION = 1.1.0
 XFONT_FONT_SCHUMACHER_MISC_SOURCE = font-schumacher-misc-$(XFONT_FONT_SCHUMACHER_MISC_VERSION).tar.bz2
 XFONT_FONT_SCHUMACHER_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_SCHUMACHER_MISC_AUTORECONF = NO
 XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index d0db502..3f0dc7a 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_SCREEN_CYRILLIC_VERSION = 1.0.2
 XFONT_FONT_SCREEN_CYRILLIC_SOURCE = font-screen-cyrillic-$(XFONT_FONT_SCREEN_CYRILLIC_VERSION).tar.bz2
 XFONT_FONT_SCREEN_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_SCREEN_CYRILLIC_AUTORECONF = NO
 XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index 7fc9cbf..63e2f79 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_SONY_MISC_VERSION = 1.0.1
 XFONT_FONT_SONY_MISC_SOURCE = font-sony-misc-$(XFONT_FONT_SONY_MISC_VERSION).tar.bz2
 XFONT_FONT_SONY_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_SONY_MISC_AUTORECONF = NO
 XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index 9364e4a..0d0dfe1 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_SUN_MISC_VERSION = 1.0.1
 XFONT_FONT_SUN_MISC_SOURCE = font-sun-misc-$(XFONT_FONT_SUN_MISC_VERSION).tar.bz2
 XFONT_FONT_SUN_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_SUN_MISC_AUTORECONF = NO
 XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index 377f281..661fada 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_WINITZKI_CYRILLIC_VERSION = 1.0.1
 XFONT_FONT_WINITZKI_CYRILLIC_SOURCE = font-winitzki-cyrillic-$(XFONT_FONT_WINITZKI_CYRILLIC_VERSION).tar.bz2
 XFONT_FONT_WINITZKI_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_WINITZKI_CYRILLIC_AUTORECONF = NO
 XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
index 6e3e564..79cdbe6 100644
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
@@ -7,7 +7,6 @@
 XFONT_FONT_XFREE86_TYPE1_VERSION = 1.0.2
 XFONT_FONT_XFREE86_TYPE1_SOURCE = font-xfree86-type1-$(XFONT_FONT_XFREE86_TYPE1_VERSION).tar.bz2
 XFONT_FONT_XFREE86_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_XFREE86_TYPE1_AUTORECONF = NO
 XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_XFREE86_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index f5ad44d..e088aac 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -6,7 +6,6 @@
 XKEYBOARD_CONFIG_VERSION = 2.0
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
-XKEYBOARD_CONFIG_AUTORECONF = NO
 XKEYBOARD_CONFIG_INSTALL_STAGING = NO
 XKEYBOARD_CONFIG_INSTALL_TARGET = YES
 XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool host-xapp_xkbcomp
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index f121f24..3d54e96 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -7,7 +7,6 @@
 XLIB_LIBFS_VERSION = 1.0.2
 XLIB_LIBFS_SOURCE = libFS-$(XLIB_LIBFS_VERSION).tar.bz2
 XLIB_LIBFS_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBFS_AUTORECONF = NO
 XLIB_LIBFS_INSTALL_STAGING = YES
 XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xproto_xproto xproto_fontsproto
 XLIB_LIBFS_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index 168f899..0509edf 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -7,7 +7,6 @@
 XLIB_LIBICE_VERSION = 1.0.6
 XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.bz2
 XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBICE_AUTORECONF = NO
 XLIB_LIBICE_INSTALL_STAGING = YES
 XLIB_LIBICE_DEPENDENCIES = xlib_xtrans xproto_xproto
 
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index e22c04b..a6b2975 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -7,7 +7,6 @@
 XLIB_LIBSM_VERSION = 1.1.1
 XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.bz2
 XLIB_LIBSM_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBSM_AUTORECONF = NO
 XLIB_LIBSM_INSTALL_STAGING = YES
 XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
 XLIB_LIBSM_CONF_OPT = --without-libuuid
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 4b60fdc..2b49aa4 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXSCRNSAVER_VERSION = 1.2.0
 XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.bz2
 XLIB_LIBXSCRNSAVER_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXSCRNSAVER_AUTORECONF = NO
 XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
 XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_scrnsaverproto
 XLIB_LIBXSCRNSAVER_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 2b008e9..da99030 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXAU_VERSION = 1.0.5
 XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.bz2
 XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXAU_AUTORECONF = NO
 XLIB_LIBXAU_INSTALL_STAGING = YES
 XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
 
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index e1a1852..1aefc0f 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXCOMPOSITE_VERSION = 0.4.1
 XLIB_LIBXCOMPOSITE_SOURCE = libXcomposite-$(XLIB_LIBXCOMPOSITE_VERSION).tar.bz2
 XLIB_LIBXCOMPOSITE_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXCOMPOSITE_AUTORECONF = NO
 XLIB_LIBXCOMPOSITE_INSTALL_STAGING = YES
 XLIB_LIBXCOMPOSITE_DEPENDENCIES = xproto_compositeproto xlib_libX11 xlib_libXext xlib_libXfixes xproto_xproto
 
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index e5bdba5..e8bb66c 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXCURSOR_VERSION = 1.1.10
 XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.bz2
 XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXCURSOR_AUTORECONF = NO
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
 
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index 3240355..4ffe33b 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXDAMAGE_VERSION = 1.1.2
 XLIB_LIBXDAMAGE_SOURCE = libXdamage-$(XLIB_LIBXDAMAGE_VERSION).tar.bz2
 XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXDAMAGE_AUTORECONF = NO
 XLIB_LIBXDAMAGE_INSTALL_STAGING = YES
 XLIB_LIBXDAMAGE_DEPENDENCIES = xproto_damageproto xlib_libX11 xlib_libXfixes xproto_xproto
 
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 8d03fc8..d42f94b 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXDMCP_VERSION = 1.0.3
 XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.bz2
 XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXDMCP_AUTORECONF = NO
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
 
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 6b60042..dff21bc 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXEXT_VERSION = 1.1.1
 XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.bz2
 XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXEXT_AUTORECONF = NO
 XLIB_LIBXEXT_INSTALL_STAGING = YES
 XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xproto_xextproto xproto_xproto
 XLIB_LIBXEXT_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index 5c247a3..a527253 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXFIXES_VERSION = 4.0.4
 XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.bz2
 XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXFIXES_AUTORECONF = NO
 XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
 
diff --git a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
index bf64a4d..26c4cda 100644
--- a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
+++ b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXFONTCACHE_VERSION = 1.0.5
 XLIB_LIBXFONTCACHE_SOURCE = libXfontcache-$(XLIB_LIBXFONTCACHE_VERSION).tar.bz2
 XLIB_LIBXFONTCACHE_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXFONTCACHE_AUTORECONF = NO
 XLIB_LIBXFONTCACHE_INSTALL_STAGING = YES
 XLIB_LIBXFONTCACHE_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_fontcacheproto
 XLIB_LIBXFONTCACHE_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index 3cca1e6..bc04331 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXI_VERSION = 1.3
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
 XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXI_AUTORECONF = NO
 XLIB_LIBXI_INSTALL_STAGING = YES
 XLIB_LIBXI_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXext xproto_xproto
 XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index fe7c5ed..ae0b8e8 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXINERAMA_VERSION = 1.1
 XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.bz2
 XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXINERAMA_AUTORECONF = NO
 XLIB_LIBXINERAMA_INSTALL_STAGING = YES
 XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xineramaproto
 XLIB_LIBXINERAMA_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index c1c9503..734d655 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXMU_VERSION = 1.0.5
 XLIB_LIBXMU_SOURCE = libXmu-$(XLIB_LIBXMU_VERSION).tar.bz2
 XLIB_LIBXMU_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXMU_AUTORECONF = NO
 XLIB_LIBXMU_INSTALL_STAGING = YES
 XLIB_LIBXMU_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
 
diff --git a/package/x11r7/xlib_libXp/xlib_libXp.mk b/package/x11r7/xlib_libXp/xlib_libXp.mk
index f030082..dbd2c6b 100644
--- a/package/x11r7/xlib_libXp/xlib_libXp.mk
+++ b/package/x11r7/xlib_libXp/xlib_libXp.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXP_VERSION = 1.0.0
 XLIB_LIBXP_SOURCE = libXp-$(XLIB_LIBXP_VERSION).tar.bz2
 XLIB_LIBXP_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXP_AUTORECONF = NO
 XLIB_LIBXP_INSTALL_STAGING = YES
 XLIB_LIBXP_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xproto_printproto
 XLIB_LIBXP_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 459a299..758f545 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXPM_VERSION = 3.5.8
 XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.bz2
 XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXPM_AUTORECONF = NO
 XLIB_LIBXPM_INSTALL_STAGING = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
 
diff --git a/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk b/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
index f980594..65af2e0 100644
--- a/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
+++ b/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXPRINTAPPUTIL_VERSION = 1.0.1
 XLIB_LIBXPRINTAPPUTIL_SOURCE = libXprintAppUtil-$(XLIB_LIBXPRINTAPPUTIL_VERSION).tar.bz2
 XLIB_LIBXPRINTAPPUTIL_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXPRINTAPPUTIL_AUTORECONF = NO
 XLIB_LIBXPRINTAPPUTIL_INSTALL_STAGING = YES
 XLIB_LIBXPRINTAPPUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXprintUtil
 
diff --git a/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk b/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
index ed801ff..49056e7 100644
--- a/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
+++ b/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXPRINTUTIL_VERSION = 1.0.1
 XLIB_LIBXPRINTUTIL_SOURCE = libXprintUtil-$(XLIB_LIBXPRINTUTIL_VERSION).tar.bz2
 XLIB_LIBXPRINTUTIL_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXPRINTUTIL_AUTORECONF = NO
 XLIB_LIBXPRINTUTIL_INSTALL_STAGING = YES
 XLIB_LIBXPRINTUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXt xproto_printproto
 
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 20b61d1..96511dd 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXRANDR_VERSION = 1.3.0
 XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.bz2
 XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXRANDR_AUTORECONF = NO
 XLIB_LIBXRANDR_INSTALL_STAGING = YES
 XLIB_LIBXRANDR_DEPENDENCIES = xproto_randrproto xlib_libX11 xlib_libXext xlib_libXrender xproto_renderproto xproto_xproto
 XLIB_LIBXRANDR_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 4d5c0f8..5bfeddc 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXRENDER_VERSION = 0.9.5
 XLIB_LIBXRENDER_SOURCE = libXrender-$(XLIB_LIBXRENDER_VERSION).tar.bz2
 XLIB_LIBXRENDER_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXRENDER_AUTORECONF = NO
 XLIB_LIBXRENDER_INSTALL_STAGING = YES
 XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
 XLIB_LIBXRENDER_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 51451a0..515fd95 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXRES_VERSION = 1.0.4
 XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.bz2
 XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXRES_AUTORECONF = NO
 XLIB_LIBXRES_INSTALL_STAGING = YES
 XLIB_LIBXRES_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_resourceproto xproto_xproto
 XLIB_LIBXRES_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index c827938..5b619b4 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXV_VERSION = 1.0.5
 XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.bz2
 XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXV_AUTORECONF = NO
 XLIB_LIBXV_INSTALL_STAGING = YES
 XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_videoproto xproto_xproto
 XLIB_LIBXV_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index e2a5aed..cee46a0 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXVMC_VERSION = 1.0.5
 XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.bz2
 XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXVMC_AUTORECONF = NO
 XLIB_LIBXVMC_INSTALL_STAGING = YES
 XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xproto_videoproto xproto_xproto
 XLIB_LIBXVMC_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index 2a8ef9f..4ad4576 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXXF86DGA_VERSION = 1.1.1
 XLIB_LIBXXF86DGA_SOURCE = libXxf86dga-$(XLIB_LIBXXF86DGA_VERSION).tar.bz2
 XLIB_LIBXXF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXXF86DGA_AUTORECONF = NO
 XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
 XLIB_LIBXXF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86dgaproto xproto_xproto
 XLIB_LIBXXF86DGA_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index a73ba6b..fd5e59c 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXXF86VM_VERSION = 1.1.0
 XLIB_LIBXXF86VM_SOURCE = libXxf86vm-$(XLIB_LIBXXF86VM_VERSION).tar.bz2
 XLIB_LIBXXF86VM_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXXF86VM_AUTORECONF = NO
 XLIB_LIBXXF86VM_INSTALL_STAGING = YES
 XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86vidmodeproto xproto_xproto
 XLIB_LIBXXF86VM_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index 073005c..3f30e08 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -7,7 +7,6 @@
 XLIB_LIBDMX_VERSION = 1.1.0
 XLIB_LIBDMX_SOURCE = libdmx-$(XLIB_LIBDMX_VERSION).tar.bz2
 XLIB_LIBDMX_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBDMX_AUTORECONF = NO
 XLIB_LIBDMX_INSTALL_STAGING = YES
 XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
 XLIB_LIBDMX_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index c2ce11f..11832d6 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -7,7 +7,6 @@
 XLIB_LIBFONTENC_VERSION = 1.0.5
 XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.bz2
 XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBFONTENC_AUTORECONF = NO
 XLIB_LIBFONTENC_INSTALL_STAGING = YES
 XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
 
diff --git a/package/x11r7/xlib_liboldX/xlib_liboldX.mk b/package/x11r7/xlib_liboldX/xlib_liboldX.mk
index 94a38fa..7c4e1e7 100644
--- a/package/x11r7/xlib_liboldX/xlib_liboldX.mk
+++ b/package/x11r7/xlib_liboldX/xlib_liboldX.mk
@@ -7,7 +7,6 @@
 XLIB_LIBOLDX_VERSION = 1.0.1
 XLIB_LIBOLDX_SOURCE = liboldX-$(XLIB_LIBOLDX_VERSION).tar.bz2
 XLIB_LIBOLDX_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBOLDX_AUTORECONF = NO
 XLIB_LIBOLDX_INSTALL_STAGING = YES
 XLIB_LIBOLDX_DEPENDENCIES = xlib_libX11
 XLIB_LIBOLDX_CONF_OPT = --disable-malloc0returnsnull
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 96420c3..070fe81 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXKBFILE_VERSION = 1.0.6
 XLIB_LIBXKBFILE_SOURCE = libxkbfile-$(XLIB_LIBXKBFILE_VERSION).tar.bz2
 XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXKBFILE_AUTORECONF = NO
 XLIB_LIBXKBFILE_INSTALL_STAGING = YES
 XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xproto_kbproto
 
diff --git a/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk b/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
index 8253ac5..0806eec 100644
--- a/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
+++ b/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXKBUI_VERSION = 1.0.2
 XLIB_LIBXKBUI_SOURCE = libxkbui-$(XLIB_LIBXKBUI_VERSION).tar.bz2
 XLIB_LIBXKBUI_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXKBUI_AUTORECONF = NO
 XLIB_LIBXKBUI_INSTALL_STAGING = YES
 XLIB_LIBXKBUI_DEPENDENCIES = xlib_libxkbfile xlib_libXt xproto_kbproto
 
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index aaf2208..db8b79a 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -7,7 +7,6 @@
 XLIB_XTRANS_VERSION = 1.2.5
 XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
 XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_XTRANS_AUTORECONF = NO
 XLIB_XTRANS_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_xtrans))
diff --git a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
index 189c24f..17ca6b3 100644
--- a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
+++ b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
@@ -7,7 +7,6 @@
 XPROTO_APPLEWMPROTO_VERSION = 1.4.1
 XPROTO_APPLEWMPROTO_SOURCE = applewmproto-$(XPROTO_APPLEWMPROTO_VERSION).tar.bz2
 XPROTO_APPLEWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_APPLEWMPROTO_AUTORECONF = NO
 XPROTO_APPLEWMPROTO_INSTALL_STAGING = YES
 XPROTO_APPLEWMPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
index 7ae7795..b306277 100644
--- a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
+++ b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
@@ -7,7 +7,6 @@
 XPROTO_BIGREQSPROTO_VERSION = 1.1.0
 XPROTO_BIGREQSPROTO_SOURCE = bigreqsproto-$(XPROTO_BIGREQSPROTO_VERSION).tar.bz2
 XPROTO_BIGREQSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_BIGREQSPROTO_AUTORECONF = NO
 XPROTO_BIGREQSPROTO_INSTALL_STAGING = YES
 XPROTO_BIGREQSPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
index b176b69..d9e96b5 100644
--- a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
+++ b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
@@ -7,7 +7,6 @@
 XPROTO_COMPOSITEPROTO_VERSION = 0.4.1
 XPROTO_COMPOSITEPROTO_SOURCE = compositeproto-$(XPROTO_COMPOSITEPROTO_VERSION).tar.bz2
 XPROTO_COMPOSITEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_COMPOSITEPROTO_AUTORECONF = NO
 XPROTO_COMPOSITEPROTO_INSTALL_STAGING = YES
 XPROTO_COMPOSITEPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_damageproto/xproto_damageproto.mk b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
index a2f8c71..d52351b 100644
--- a/package/x11r7/xproto_damageproto/xproto_damageproto.mk
+++ b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
@@ -7,7 +7,6 @@
 XPROTO_DAMAGEPROTO_VERSION = 1.2.0
 XPROTO_DAMAGEPROTO_SOURCE = damageproto-$(XPROTO_DAMAGEPROTO_VERSION).tar.bz2
 XPROTO_DAMAGEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_DAMAGEPROTO_AUTORECONF = NO
 XPROTO_DAMAGEPROTO_INSTALL_STAGING = YES
 XPROTO_DAMAGEPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
index ff31e7e..cb58a7f 100644
--- a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
+++ b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
@@ -7,7 +7,6 @@
 XPROTO_DMXPROTO_VERSION = 2.3
 XPROTO_DMXPROTO_SOURCE = dmxproto-$(XPROTO_DMXPROTO_VERSION).tar.bz2
 XPROTO_DMXPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_DMXPROTO_AUTORECONF = NO
 XPROTO_DMXPROTO_INSTALL_STAGING = YES
 XPROTO_DMXPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
index f3b37c9..6e82e42 100644
--- a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
+++ b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
@@ -7,7 +7,6 @@
 XPROTO_DRI2PROTO_VERSION = 2.3
 XPROTO_DRI2PROTO_SOURCE = dri2proto-$(XPROTO_DRI2PROTO_VERSION).tar.bz2
 XPROTO_DRI2PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_DRI2PROTO_AUTORECONF = NO
 XPROTO_DRI2PROTO_INSTALL_STAGING = YES
 XPROTO_DRI2PROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
index c37e15f..0e3c492 100644
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
@@ -7,7 +7,6 @@
 XPROTO_FIXESPROTO_VERSION = 4.1.1
 XPROTO_FIXESPROTO_SOURCE = fixesproto-$(XPROTO_FIXESPROTO_VERSION).tar.bz2
 XPROTO_FIXESPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_FIXESPROTO_AUTORECONF = NO
 XPROTO_FIXESPROTO_INSTALL_STAGING = YES
 XPROTO_FIXESPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
index 40917cd..951c59d 100644
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
@@ -7,7 +7,6 @@
 XPROTO_FONTCACHEPROTO_VERSION = 0.1.3
 XPROTO_FONTCACHEPROTO_SOURCE = fontcacheproto-$(XPROTO_FONTCACHEPROTO_VERSION).tar.bz2
 XPROTO_FONTCACHEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_FONTCACHEPROTO_AUTORECONF = NO
 XPROTO_FONTCACHEPROTO_INSTALL_STAGING = YES
 XPROTO_FONTCACHEPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
index 5e2a64a..7eed4a6 100644
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
@@ -7,7 +7,6 @@
 XPROTO_FONTSPROTO_VERSION = 2.1.0
 XPROTO_FONTSPROTO_SOURCE = fontsproto-$(XPROTO_FONTSPROTO_VERSION).tar.bz2
 XPROTO_FONTSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_FONTSPROTO_AUTORECONF = NO
 XPROTO_FONTSPROTO_INSTALL_STAGING = YES
 XPROTO_FONTSPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_glproto/xproto_glproto.mk b/package/x11r7/xproto_glproto/xproto_glproto.mk
index 98c6b2f..42f6802 100644
--- a/package/x11r7/xproto_glproto/xproto_glproto.mk
+++ b/package/x11r7/xproto_glproto/xproto_glproto.mk
@@ -7,7 +7,6 @@
 XPROTO_GLPROTO_VERSION = 1.4.10
 XPROTO_GLPROTO_SOURCE = glproto-$(XPROTO_GLPROTO_VERSION).tar.bz2
 XPROTO_GLPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_GLPROTO_AUTORECONF = NO
 XPROTO_GLPROTO_INSTALL_STAGING = YES
 XPROTO_GLPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index 825ebed..141c5f8 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -7,7 +7,6 @@
 XPROTO_INPUTPROTO_VERSION = 2.0
 XPROTO_INPUTPROTO_SOURCE = inputproto-$(XPROTO_INPUTPROTO_VERSION).tar.bz2
 XPROTO_INPUTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_INPUTPROTO_AUTORECONF = NO
 XPROTO_INPUTPROTO_INSTALL_STAGING = YES
 XPROTO_INPUTPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
index ecdabf1..184ceec 100644
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
@@ -7,7 +7,6 @@
 XPROTO_KBPROTO_VERSION = 1.0.4
 XPROTO_KBPROTO_SOURCE = kbproto-$(XPROTO_KBPROTO_VERSION).tar.bz2
 XPROTO_KBPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_KBPROTO_AUTORECONF = NO
 XPROTO_KBPROTO_INSTALL_STAGING = YES
 XPROTO_KBPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_printproto/xproto_printproto.mk b/package/x11r7/xproto_printproto/xproto_printproto.mk
index c06c5c3..c47d7af 100644
--- a/package/x11r7/xproto_printproto/xproto_printproto.mk
+++ b/package/x11r7/xproto_printproto/xproto_printproto.mk
@@ -7,7 +7,6 @@
 XPROTO_PRINTPROTO_VERSION = 1.0.3
 XPROTO_PRINTPROTO_SOURCE = printproto-$(XPROTO_PRINTPROTO_VERSION).tar.bz2
 XPROTO_PRINTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_PRINTPROTO_AUTORECONF = NO
 XPROTO_PRINTPROTO_INSTALL_STAGING = YES
 XPROTO_PRINTPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
index e6befea..1b4a05a 100644
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.mk
+++ b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
@@ -7,7 +7,6 @@
 XPROTO_RANDRPROTO_VERSION = 1.3.1
 XPROTO_RANDRPROTO_SOURCE = randrproto-$(XPROTO_RANDRPROTO_VERSION).tar.bz2
 XPROTO_RANDRPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_RANDRPROTO_AUTORECONF = NO
 XPROTO_RANDRPROTO_INSTALL_STAGING = YES
 XPROTO_RANDRPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_recordproto/xproto_recordproto.mk b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
index 83178bd..fa831fe 100644
--- a/package/x11r7/xproto_recordproto/xproto_recordproto.mk
+++ b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
@@ -7,7 +7,6 @@
 XPROTO_RECORDPROTO_VERSION = 1.14
 XPROTO_RECORDPROTO_SOURCE = recordproto-$(XPROTO_RECORDPROTO_VERSION).tar.bz2
 XPROTO_RECORDPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_RECORDPROTO_AUTORECONF = NO
 XPROTO_RECORDPROTO_INSTALL_STAGING = YES
 XPROTO_RECORDPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
index a12faf0..90e440e 100644
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.mk
+++ b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
@@ -7,7 +7,6 @@
 XPROTO_RENDERPROTO_VERSION = 0.11
 XPROTO_RENDERPROTO_SOURCE = renderproto-$(XPROTO_RENDERPROTO_VERSION).tar.bz2
 XPROTO_RENDERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_RENDERPROTO_AUTORECONF = NO
 XPROTO_RENDERPROTO_INSTALL_STAGING = YES
 XPROTO_RENDERPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
index c5e0d47..565002a 100644
--- a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
+++ b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
@@ -7,7 +7,6 @@
 XPROTO_RESOURCEPROTO_VERSION = 1.1.0
 XPROTO_RESOURCEPROTO_SOURCE = resourceproto-$(XPROTO_RESOURCEPROTO_VERSION).tar.bz2
 XPROTO_RESOURCEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_RESOURCEPROTO_AUTORECONF = NO
 XPROTO_RESOURCEPROTO_INSTALL_STAGING = YES
 XPROTO_RESOURCEPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
index f7f53e6..2a010f7 100644
--- a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
+++ b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
@@ -7,7 +7,6 @@
 XPROTO_SCRNSAVERPROTO_VERSION = 1.2.0
 XPROTO_SCRNSAVERPROTO_SOURCE = scrnsaverproto-$(XPROTO_SCRNSAVERPROTO_VERSION).tar.bz2
 XPROTO_SCRNSAVERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_SCRNSAVERPROTO_AUTORECONF = NO
 XPROTO_SCRNSAVERPROTO_INSTALL_STAGING = YES
 XPROTO_SCRNSAVERPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.mk b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
index 3b98370..e66d2e1 100644
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.mk
+++ b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
@@ -7,7 +7,6 @@
 XPROTO_VIDEOPROTO_VERSION = 2.3.0
 XPROTO_VIDEOPROTO_SOURCE = videoproto-$(XPROTO_VIDEOPROTO_VERSION).tar.bz2
 XPROTO_VIDEOPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_VIDEOPROTO_AUTORECONF = NO
 XPROTO_VIDEOPROTO_INSTALL_STAGING = YES
 XPROTO_VIDEOPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
index 827d797..28af479 100644
--- a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
+++ b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
@@ -7,7 +7,6 @@
 XPROTO_WINDOWSWMPROTO_VERSION = 1.0.4
 XPROTO_WINDOWSWMPROTO_SOURCE = windowswmproto-$(XPROTO_WINDOWSWMPROTO_VERSION).tar.bz2
 XPROTO_WINDOWSWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_WINDOWSWMPROTO_AUTORECONF = NO
 XPROTO_WINDOWSWMPROTO_INSTALL_STAGING = YES
 XPROTO_WINDOWSWMPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
index 1846f20..2e3b0fc 100644
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -7,7 +7,6 @@
 XPROTO_XCMISCPROTO_VERSION = 1.2.0
 XPROTO_XCMISCPROTO_SOURCE = xcmiscproto-$(XPROTO_XCMISCPROTO_VERSION).tar.bz2
 XPROTO_XCMISCPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XCMISCPROTO_AUTORECONF = NO
 XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
 XPROTO_XCMISCPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index 1fd39c9..725d9dd 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -7,7 +7,6 @@
 XPROTO_XEXTPROTO_VERSION = 7.1.1
 XPROTO_XEXTPROTO_SOURCE = xextproto-$(XPROTO_XEXTPROTO_VERSION).tar.bz2
 XPROTO_XEXTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XEXTPROTO_AUTORECONF = NO
 XPROTO_XEXTPROTO_INSTALL_STAGING = YES
 XPROTO_XEXTPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
index 1872873..a2cf988 100644
--- a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
+++ b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
@@ -7,7 +7,6 @@
 XPROTO_XF86BIGFONTPROTO_VERSION = 1.2.0
 XPROTO_XF86BIGFONTPROTO_SOURCE = xf86bigfontproto-$(XPROTO_XF86BIGFONTPROTO_VERSION).tar.bz2
 XPROTO_XF86BIGFONTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86BIGFONTPROTO_AUTORECONF = NO
 XPROTO_XF86BIGFONTPROTO_INSTALL_STAGING = YES
 XPROTO_XF86BIGFONTPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
index d654a1c..0b251e3 100644
--- a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
+++ b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
@@ -7,7 +7,6 @@
 XPROTO_XF86DGAPROTO_VERSION = 2.1
 XPROTO_XF86DGAPROTO_SOURCE = xf86dgaproto-$(XPROTO_XF86DGAPROTO_VERSION).tar.bz2
 XPROTO_XF86DGAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86DGAPROTO_AUTORECONF = NO
 XPROTO_XF86DGAPROTO_INSTALL_STAGING = YES
 XPROTO_XF86DGAPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
index 4c37fa1..c993122 100644
--- a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
+++ b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
@@ -7,7 +7,6 @@
 XPROTO_XF86DRIPROTO_VERSION = 2.1.0
 XPROTO_XF86DRIPROTO_SOURCE = xf86driproto-$(XPROTO_XF86DRIPROTO_VERSION).tar.bz2
 XPROTO_XF86DRIPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86DRIPROTO_AUTORECONF = NO
 XPROTO_XF86DRIPROTO_INSTALL_STAGING = YES
 XPROTO_XF86DRIPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk b/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
index 032b839..fe4d98a 100644
--- a/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
+++ b/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
@@ -7,7 +7,6 @@
 XPROTO_XF86RUSHPROTO_VERSION = 1.1.2
 XPROTO_XF86RUSHPROTO_SOURCE = xf86rushproto-$(XPROTO_XF86RUSHPROTO_VERSION).tar.bz2
 XPROTO_XF86RUSHPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86RUSHPROTO_AUTORECONF = NO
 XPROTO_XF86RUSHPROTO_INSTALL_STAGING = YES
 XPROTO_XF86RUSHPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
index c3f3fe5..efba2e9 100644
--- a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
+++ b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
@@ -7,7 +7,6 @@
 XPROTO_XF86VIDMODEPROTO_VERSION = 2.3
 XPROTO_XF86VIDMODEPROTO_SOURCE = xf86vidmodeproto-$(XPROTO_XF86VIDMODEPROTO_VERSION).tar.bz2
 XPROTO_XF86VIDMODEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86VIDMODEPROTO_AUTORECONF = NO
 XPROTO_XF86VIDMODEPROTO_INSTALL_STAGING = YES
 XPROTO_XF86VIDMODEPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
index bca3c8f..81276c3 100644
--- a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
+++ b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
@@ -7,7 +7,6 @@
 XPROTO_XINERAMAPROTO_VERSION = 1.2
 XPROTO_XINERAMAPROTO_SOURCE = xineramaproto-$(XPROTO_XINERAMAPROTO_VERSION).tar.bz2
 XPROTO_XINERAMAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XINERAMAPROTO_AUTORECONF = NO
 XPROTO_XINERAMAPROTO_INSTALL_STAGING = YES
 XPROTO_XINERAMAPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index c1e2449..f541253 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -7,7 +7,6 @@
 XPROTO_XPROTO_VERSION = 7.0.16
 XPROTO_XPROTO_SOURCE = xproto-$(XPROTO_XPROTO_VERSION).tar.bz2
 XPROTO_XPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XPROTO_AUTORECONF = NO
 XPROTO_XPROTO_INSTALL_STAGING = YES
 XPROTO_XPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 70ba8b2..e27ba0a 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -8,7 +8,6 @@ XSERVER_XORG_SERVER_VERSION = 1.7.5
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_MAKE = $(MAKE1) # make install fails with parallel make
-XSERVER_XORG_SERVER_AUTORECONF = NO
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
 
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 660323d..d134981 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -7,7 +7,6 @@
 XUTIL_MAKEDEPEND_VERSION = 1.0.2
 XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.bz2
 XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
-XUTIL_MAKEDEPEND_AUTORECONF = NO
 XUTIL_MAKEDEPEND_INSTALL_STAGING = NO
 XUTIL_MAKEDEPEND_INSTALL_TARGET = YES
 
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
index b600a46..c6b35e9 100644
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
@@ -7,7 +7,6 @@
 XUTIL_UTIL_MACROS_VERSION = 1.3.0
 XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
 XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
-XUTIL_UTIL_MACROS_AUTORECONF = NO
 XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
 XUTIL_UTIL_MACROS_INSTALL_TARGET = NO
 
-- 
1.7.4.1
