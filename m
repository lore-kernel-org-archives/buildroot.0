From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu,  6 Jun 2013 11:53:29 +0200
Subject: [Buildroot] [PATCH 6/7] Remove description and url from header
In-Reply-To: <1370512410-8553-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1370512410-8553-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1370512410-8553-7-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 package/avahi/avahi.mk                                                | 2 +-
 package/berkeleydb/berkeleydb.mk                                      | 2 +-
 package/connman/connman.mk                                            | 2 +-
 package/ctorrent/ctorrent.mk                                          | 2 +-
 package/gsl/gsl.mk                                                    | 2 +-
 package/libarchive/libarchive.mk                                      | 2 +-
 package/libdaemon/libdaemon.mk                                        | 2 +-
 package/libfslcodec/libfslcodec.mk                                    | 2 +-
 package/libfslparser/libfslparser.mk                                  | 2 +-
 package/libfslvpuwrap/libfslvpuwrap.mk                                | 2 +-
 package/libiqrf/libiqrf.mk                                            | 2 +-
 package/libjpeg/libjpeg.mk                                            | 2 +-
 package/libpng/libpng.mk                                              | 2 +-
 package/liburcu/liburcu.mk                                            | 2 +-
 package/live555/live555.mk                                            | 2 +-
 package/lrzsz/lrzsz.mk                                                | 2 +-
 package/lttng-libust/lttng-libust.mk                                  | 2 +-
 package/lttng-modules/lttng-modules.mk                                | 2 +-
 package/lttng-tools/lttng-tools.mk                                    | 2 +-
 package/mtd/mtd.mk                                                    | 2 +-
 package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk                 | 2 +-
 package/ncftp/ncftp.mk                                                | 2 +-
 package/ncurses/Config.in                                             | 2 ++
 package/ncurses/ncurses.mk                                            | 1 -
 package/ngircd/ngircd.mk                                              | 2 +-
 package/opencv/opencv.mk                                              | 2 +-
 package/pv/pv.mk                                                      | 2 +-
 package/quagga/quagga.mk                                              | 2 +-
 package/readline/readline.mk                                          | 2 +-
 package/sqlcipher/Config.in                                           | 1 +
 package/sqlcipher/sqlcipher.mk                                        | 3 +--
 package/stress/stress.mk                                              | 4 +---
 package/tremor/tremor.mk                                              | 2 +-
 package/urg/urg.mk                                                    | 2 +-
 package/vtun/Config.in                                                | 3 +++
 package/vtun/vtun.mk                                                  | 3 ---
 package/x11r7/xapp_appres/xapp_appres.mk                              | 2 +-
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk                          | 2 +-
 package/x11r7/xapp_beforelight/xapp_beforelight.mk                    | 2 +-
 package/x11r7/xapp_bitmap/xapp_bitmap.mk                              | 2 +-
 package/x11r7/xapp_editres/xapp_editres.mk                            | 2 +-
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk                      | 2 +-
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk                        | 2 +-
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk                            | 2 +-
 package/x11r7/xapp_iceauth/xapp_iceauth.mk                            | 2 +-
 package/x11r7/xapp_ico/xapp_ico.mk                                    | 2 +-
 package/x11r7/xapp_listres/xapp_listres.mk                            | 2 +-
 package/x11r7/xapp_luit/xapp_luit.mk                                  | 2 +-
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk                        | 2 +-
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk                    | 2 +-
 package/x11r7/xapp_oclock/xapp_oclock.mk                              | 2 +-
 package/x11r7/xapp_rgb/xapp_rgb.mk                                    | 2 +-
 package/x11r7/xapp_rstart/xapp_rstart.mk                              | 2 +-
 package/x11r7/xapp_scripts/xapp_scripts.mk                            | 2 +-
 package/x11r7/xapp_sessreg/xapp_sessreg.mk                            | 2 +-
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk                        | 2 +-
 package/x11r7/xapp_showfont/xapp_showfont.mk                          | 2 +-
 package/x11r7/xapp_smproxy/xapp_smproxy.mk                            | 2 +-
 package/x11r7/xapp_twm/xapp_twm.mk                                    | 2 +-
 package/x11r7/xapp_viewres/xapp_viewres.mk                            | 2 +-
 package/x11r7/xapp_x11perf/xapp_x11perf.mk                            | 2 +-
 package/x11r7/xapp_xauth/xapp_xauth.mk                                | 2 +-
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk                      | 2 +-
 package/x11r7/xapp_xbiff/xapp_xbiff.mk                                | 2 +-
 package/x11r7/xapp_xcalc/xapp_xcalc.mk                                | 2 +-
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk                      | 2 +-
 package/x11r7/xapp_xclock/xapp_xclock.mk                              | 2 +-
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk                              | 2 +-
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk                      | 2 +-
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk                        | 2 +-
 package/x11r7/xapp_xditview/xapp_xditview.mk                          | 2 +-
 package/x11r7/xapp_xdm/xapp_xdm.mk                                    | 2 +-
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk                          | 2 +-
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk                          | 2 +-
 package/x11r7/xapp_xedit/xapp_xedit.mk                                | 2 +-
 package/x11r7/xapp_xev/xapp_xev.mk                                    | 2 +-
 package/x11r7/xapp_xeyes/xapp_xeyes.mk                                | 2 +-
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk                            | 2 +-
 package/x11r7/xapp_xfd/xapp_xfd.mk                                    | 2 +-
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk                          | 2 +-
 package/x11r7/xapp_xfs/xapp_xfs.mk                                    | 2 +-
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk                            | 2 +-
 package/x11r7/xapp_xgamma/xapp_xgamma.mk                              | 2 +-
 package/x11r7/xapp_xgc/xapp_xgc.mk                                    | 2 +-
 package/x11r7/xapp_xhost/xapp_xhost.mk                                | 2 +-
 package/x11r7/xapp_xinit/xapp_xinit.mk                                | 2 +-
 package/x11r7/xapp_xinput/xapp_xinput.mk                              | 2 +-
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk                            | 2 +-
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk                              | 2 +-
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk                          | 2 +-
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk                          | 2 +-
 package/x11r7/xapp_xkill/xapp_xkill.mk                                | 2 +-
 package/x11r7/xapp_xload/xapp_xload.mk                                | 2 +-
 package/x11r7/xapp_xlogo/xapp_xlogo.mk                                | 2 +-
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk                          | 2 +-
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk                      | 2 +-
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk                          | 2 +-
 package/x11r7/xapp_xmag/xapp_xmag.mk                                  | 2 +-
 package/x11r7/xapp_xman/xapp_xman.mk                                  | 2 +-
 package/x11r7/xapp_xmessage/xapp_xmessage.mk                          | 2 +-
 package/x11r7/xapp_xmh/xapp_xmh.mk                                    | 2 +-
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk                            | 2 +-
 package/x11r7/xapp_xmore/xapp_xmore.mk                                | 2 +-
 package/x11r7/xapp_xpr/xapp_xpr.mk                                    | 2 +-
 package/x11r7/xapp_xprop/xapp_xprop.mk                                | 2 +-
 package/x11r7/xapp_xrandr/xapp_xrandr.mk                              | 2 +-
 package/x11r7/xapp_xrdb/xapp_xrdb.mk                                  | 2 +-
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk                          | 2 +-
 package/x11r7/xapp_xset/xapp_xset.mk                                  | 2 +-
 package/x11r7/xapp_xsetmode/xapp_xsetmode.mk                          | 2 +-
 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk                    | 2 +-
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk                          | 2 +-
 package/x11r7/xapp_xsm/xapp_xsm.mk                                    | 2 +-
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk                          | 2 +-
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk                          | 2 +-
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk                              | 2 +-
 package/x11r7/xapp_xwd/xapp_xwd.mk                                    | 2 +-
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk                          | 2 +-
 package/x11r7/xapp_xwud/xapp_xwud.mk                                  | 2 +-
 package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk  | 2 +-
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk                        | 2 +-
 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk            | 2 +-
 package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk    | 2 +-
 .../x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk  | 2 +-
 .../x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk  | 2 +-
 package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk    | 2 +-
 .../xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk      | 2 +-
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk    | 2 +-
 .../x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk    | 2 +-
 package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk      | 2 +-
 package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk        | 2 +-
 package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk        | 2 +-
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk        | 2 +-
 package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk  | 2 +-
 package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk    | 2 +-
 package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk    | 2 +-
 package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk    | 2 +-
 package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk    | 2 +-
 package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk    | 2 +-
 package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk      | 2 +-
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk    | 2 +-
 package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk  | 2 +-
 package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk        | 2 +-
 .../x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk  | 2 +-
 .../x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk    | 2 +-
 package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk          | 2 +-
 package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk      | 2 +-
 package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk  | 2 +-
 .../xdriver_xf86-video-siliconmotion.mk                               | 2 +-
 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk        | 2 +-
 package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk      | 2 +-
 package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk        | 2 +-
 .../x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk    | 2 +-
 package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk        | 2 +-
 package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk      | 2 +-
 package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk  | 2 +-
 package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk  | 2 +-
 package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk      | 2 +-
 package/x11r7/xfont_encodings/xfont_encodings.mk                      | 2 +-
 package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk      | 2 +-
 package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk        | 2 +-
 .../xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk  | 2 +-
 .../xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk    | 2 +-
 .../xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk    | 2 +-
 package/x11r7/xfont_font-alias/xfont_font-alias.mk                    | 2 +-
 package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk        | 2 +-
 package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk            | 2 +-
 package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk              | 2 +-
 .../xfont_font-bh-lucidatypewriter-100dpi.mk                          | 2 +-
 .../xfont_font-bh-lucidatypewriter-75dpi.mk                           | 2 +-
 package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk                  | 2 +-
 package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk              | 2 +-
 .../x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk  | 2 +-
 .../x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk    | 2 +-
 .../x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk    | 2 +-
 .../x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk    | 2 +-
 package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk        | 2 +-
 package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk        | 2 +-
 package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk              | 2 +-
 package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk            | 2 +-
 package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk            | 2 +-
 package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk              | 2 +-
 package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk          | 2 +-
 package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk    | 2 +-
 package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk    | 2 +-
 package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk        | 2 +-
 package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk            | 2 +-
 package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk            | 2 +-
 .../x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk    | 2 +-
 .../x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk    | 2 +-
 package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk            | 2 +-
 package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk              | 2 +-
 package/x11r7/xfont_font-util/xfont_font-util.mk                      | 2 +-
 .../xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk      | 2 +-
 package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk    | 2 +-
 package/x11r7/xlib_libFS/xlib_libFS.mk                                | 2 +-
 package/x11r7/xlib_libICE/xlib_libICE.mk                              | 2 +-
 package/x11r7/xlib_libSM/xlib_libSM.mk                                | 2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk                              | 2 +-
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk                | 2 +-
 package/x11r7/xlib_libXau/xlib_libXau.mk                              | 2 +-
 package/x11r7/xlib_libXaw/xlib_libXaw.mk                              | 2 +-
 package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk                | 2 +-
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk                      | 2 +-
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk                      | 2 +-
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk                          | 2 +-
 package/x11r7/xlib_libXext/xlib_libXext.mk                            | 2 +-
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk                        | 2 +-
 package/x11r7/xlib_libXfont/xlib_libXfont.mk                          | 2 +-
 package/x11r7/xlib_libXft/xlib_libXft.mk                              | 2 +-
 package/x11r7/xlib_libXi/xlib_libXi.mk                                | 2 +-
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk                    | 2 +-
 package/x11r7/xlib_libXmu/xlib_libXmu.mk                              | 2 +-
 package/x11r7/xlib_libXpm/xlib_libXpm.mk                              | 2 +-
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk                        | 2 +-
 package/x11r7/xlib_libXrender/xlib_libXrender.mk                      | 2 +-
 package/x11r7/xlib_libXres/xlib_libXres.mk                            | 2 +-
 package/x11r7/xlib_libXt/xlib_libXt.mk                                | 2 +-
 package/x11r7/xlib_libXtst/xlib_libXtst.mk                            | 2 +-
 package/x11r7/xlib_libXv/xlib_libXv.mk                                | 2 +-
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk                            | 2 +-
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk                    | 2 +-
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk                      | 2 +-
 package/x11r7/xlib_libdmx/xlib_libdmx.mk                              | 2 +-
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk                      | 2 +-
 package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk                  | 2 +-
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk                      | 2 +-
 package/x11r7/xlib_xtrans/xlib_xtrans.mk                              | 2 +-
 package/x11r7/xproto_applewmproto/xproto_applewmproto.mk              | 2 +-
 package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk              | 2 +-
 package/x11r7/xproto_compositeproto/xproto_compositeproto.mk          | 2 +-
 package/x11r7/xproto_damageproto/xproto_damageproto.mk                | 2 +-
 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk                      | 2 +-
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk                    | 2 +-
 package/x11r7/xproto_fixesproto/xproto_fixesproto.mk                  | 2 +-
 package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk          | 2 +-
 package/x11r7/xproto_fontsproto/xproto_fontsproto.mk                  | 2 +-
 package/x11r7/xproto_glproto/xproto_glproto.mk                        | 2 +-
 package/x11r7/xproto_inputproto/xproto_inputproto.mk                  | 2 +-
 package/x11r7/xproto_kbproto/xproto_kbproto.mk                        | 2 +-
 package/x11r7/xproto_randrproto/xproto_randrproto.mk                  | 2 +-
 package/x11r7/xproto_recordproto/xproto_recordproto.mk                | 2 +-
 package/x11r7/xproto_renderproto/xproto_renderproto.mk                | 2 +-
 package/x11r7/xproto_resourceproto/xproto_resourceproto.mk            | 2 +-
 package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk          | 2 +-
 package/x11r7/xproto_videoproto/xproto_videoproto.mk                  | 2 +-
 package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk          | 2 +-
 package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk                | 2 +-
 package/x11r7/xproto_xextproto/xproto_xextproto.mk                    | 2 +-
 package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk      | 2 +-
 package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk              | 2 +-
 package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk              | 2 +-
 package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk      | 2 +-
 package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk            | 2 +-
 package/x11r7/xproto_xproto/xproto_xproto.mk                          | 2 +-
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk              | 2 +-
 package/x11r7/xutil_makedepend/xutil_makedepend.mk                    | 2 +-
 package/x11r7/xutil_util-macros/xutil_util-macros.mk                  | 2 +-
 package/xenomai/xenomai.mk                                            | 3 +--
 259 files changed, 260 insertions(+), 262 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 5240e26..fac3be8 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# avahi (zeroconf implementation)
+# avahi
 #
 #############################################################
 
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 9a2e5f0..e303434 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# berkeley db
+# berkeleydb
 #
 #############################################################
 
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index f29ff3b..1b7548a 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -1,6 +1,6 @@
 #######################################################
 #
-# connman - open source connection manager
+# connman
 #
 #######################################################
 
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index e67fbe9..216b142 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# enhanced ctorrent
+# ctorrent
 #
 #############################################################
 
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index fafb49b..a63753d 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# gnu gsl
+# gsl
 #
 #############################################################
 
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 4c5bd9e..98dd486 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# libarchive (reusable C library for archive formats)
+# libarchive
 #
 #############################################################
 
diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index eab9c34..419692a 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# libdaemon (UNIX daemon library)
+# libdaemon
 #
 #############################################################
 
diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index a2b57b8..0ff0bc1 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# buildroot makefile for libfslcodec
+# libfslcodec
 #
 #############################################################
 
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 66f48cc..de83832 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# buildroot makefile for libfslparser
+# libfslparser
 #
 #############################################################
 
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index 3ad33f9..d49cae4 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# buildroot makefile for libfslvpuwrap
+# libfslvpuwrap
 #
 #############################################################
 
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index d7603ae..0592762 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# libiqrf library
+# libiqrf
 #
 #############################################################
 
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index 0df2b3a..cee3408 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# libjpeg (libraries needed by some apps)
+# libjpeg
 #
 #############################################################
 
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 2c18fde..55567cb 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# libpng (Portable Network Graphic library)
+# libpng
 #
 #############################################################
 
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 32a7167..b6bca65 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# liburc: userspace RCU (read-copy-update) library
+# liburc
 #
 #############################################################
 
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index b727d94..ecbac60 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# live555 streaming media
+# live555
 #
 #############################################################
 
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 14545d1..c579215 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# lrzsz (provides zmodem)
+# lrzsz
 #
 #############################################################
 
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index aab2dd6..59d3963 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# LTTng-UST: the userspace tracing library
+# LTTng-UST
 #
 #############################################################
 
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 80ac105..f01d529 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# LTTng-modules: the kernel modules (requires at least Linux 2.6.38)
+# LTTng-modules
 #
 #############################################################
 
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 97df1cf..6142666 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# LTTng-Tools: the trace control client
+# LTTng-Tools
 #
 #############################################################
 
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 5c5eadc..4411544 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# mtd provides jffs2 utilities
+# mtd
 #
 #############################################################
 
diff --git a/package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk b/package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk
index 639fd52..405374a 100644
--- a/package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# buildroot makefile for gst-fsl-plugins
+# gst-fsl-plugins
 #
 #############################################################
 
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 4056397..bfb878a 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# ncftp client
+# ncftp
 #
 #############################################################
 
diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index d80f573..613b5b5 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_NCURSES
 	  The Ncurses (new curses) library is a free software emulation of
 	  curses in System V Release 4.0, and more.
 
+	  This package installs only a few vital termcap entries
+
 	  http://www.gnu.org/software/ncurses/
 
 config BR2_PACKAGE_NCURSES_TARGET_PANEL
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index eb47c36..8d5463c 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -1,7 +1,6 @@
 #############################################################
 #
 # ncurses
-# this installs only a few vital termcap entries
 #
 #############################################################
 
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 0121727..7300911 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# ngIRCd: Next Generation IRC Daemon
+# ngircd
 #
 #############################################################
 
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index e42f654..f9be0d7 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# OpenCV (Open Source Computer Vision)
+# opencv
 #
 #############################################################
 
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 284b388..a47d8d3 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -1,6 +1,6 @@
 #######################
 #
-# pv - Pipe Viewer
+# pv
 #
 #######################
 
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 347ec4d..25e17e3 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# quagga suite
+# quagga
 #
 #############################################################
 
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 505f1e3..4de1476 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# build GNU readline
+# readline
 #
 #############################################################
 
diff --git a/package/sqlcipher/Config.in b/package/sqlcipher/Config.in
index 8970115..af41eb2 100644
--- a/package/sqlcipher/Config.in
+++ b/package/sqlcipher/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_SQLCIPHER
 	  SQLCipher is an SQLite extension that provides 256 bits AES
 	  encryption of database files.  Note that it is a fork of SQLite
 	  and they cannot be installed side-by-side.
+
 	  http://sqlcipher.net
 
 config BR2_PACKAGE_SQLCIPHER_READLINE
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 510d4af..033cd33 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -1,7 +1,6 @@
 #############################################################
 #
-# sqlcipher extension of sqlite
-# http://sqlcipher.net
+# sqlcipher
 #
 #############################################################
 
diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index a20b0c6..fb6835c 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -1,8 +1,6 @@
 #############################################################
 #
-# stress - a workload generator
-#
-# http://weather.ou.edu/~apw/projects/stress/
+# stress
 #
 #############################################################
 
diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index cd1d323..cb12ba0 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -1,6 +1,6 @@
 ############################################################
 #
-# Tremor (Integer decoder for Vorbis)
+# Tremor
 #
 ############################################################
 
diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index 99f63a9..18326f4 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# urg library
+# urg
 #
 #############################################################
 
diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index fc35212..fe1f0d0 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -9,4 +9,7 @@ config BR2_PACKAGE_VTUN
 
 	  It supports IP, PPP, SLIP, Ethernet and other tunnel types.
 
+	  NOTE: It uses start-stop-daemon in init script, so be sure
+	  to enable that within busybox
+
 	  http://vtun.sourceforge.net/
diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 6aeca65..0f0b5ce 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -2,9 +2,6 @@
 #
 # vtun
 #
-# NOTE: Uses start-stop-daemon in init script, so be sure
-# to enable that within busybox
-#
 #############################################################
 
 VTUN_VERSION = 3.0.3
diff --git a/package/x11r7/xapp_appres/xapp_appres.mk b/package/x11r7/xapp_appres/xapp_appres.mk
index c9d7fe9..c2f8d99 100644
--- a/package/x11r7/xapp_appres/xapp_appres.mk
+++ b/package/x11r7/xapp_appres/xapp_appres.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_appres -- list X application resource database
+# xapp_appres
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index 1e2f81a..b03f80e 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_bdftopcf -- X.Org bdftopcf application
+# xapp_bdftopcf
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.mk b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
index e07696d..e92f056 100644
--- a/package/x11r7/xapp_beforelight/xapp_beforelight.mk
+++ b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_beforelight -- screen saver
+# xapp_beforelight
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
index 8c73fe2..bfe7246 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_bitmap -- X.Org bitmap application
+# xapp_bitmap
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_editres/xapp_editres.mk b/package/x11r7/xapp_editres/xapp_editres.mk
index a4807b8..fc439f5 100644
--- a/package/x11r7/xapp_editres/xapp_editres.mk
+++ b/package/x11r7/xapp_editres/xapp_editres.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_editres -- a dynamic resource editor for X Toolkit applications
+# xapp_editres
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index 719077c..f935e54 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_fonttosfnt -- X.Org fonttosfnt application
+# xapp_fonttosfnt
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
index 1815779..14623c9 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_fslsfonts -- list fonts served by X font server
+# xapp_fslsfonts
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
index 2d00af0..b93f7dd 100644
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
+++ b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_fstobdf -- generate BDF font from X font server
+# xapp_fstobdf
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
index bf0445e..28b111d 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.mk
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_iceauth -- ICE authority file utility
+# xapp_iceauth
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_ico/xapp_ico.mk b/package/x11r7/xapp_ico/xapp_ico.mk
index 6628efe..aecd95a 100644
--- a/package/x11r7/xapp_ico/xapp_ico.mk
+++ b/package/x11r7/xapp_ico/xapp_ico.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_ico -- animate an icosahedron or other polyhedron
+# xapp_ico
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_listres/xapp_listres.mk b/package/x11r7/xapp_listres/xapp_listres.mk
index 7b7e364..88cdd4f 100644
--- a/package/x11r7/xapp_listres/xapp_listres.mk
+++ b/package/x11r7/xapp_listres/xapp_listres.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_listres -- list resources in widgets
+# xapp_listres
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_luit/xapp_luit.mk b/package/x11r7/xapp_luit/xapp_luit.mk
index 2420897..d3217fe 100644
--- a/package/x11r7/xapp_luit/xapp_luit.mk
+++ b/package/x11r7/xapp_luit/xapp_luit.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_luit -- Locale and ISO 2022 support for Unicode terminals
+# xapp_luit
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index 15e65c1..b74f993 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_mkfontdir -- create an index of X font files in a directory
+# xapp_mkfontdir
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index b15fc56..067f380 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_mkfontscale -- create an index of scalable font files for X
+# xapp_mkfontscale
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.mk b/package/x11r7/xapp_oclock/xapp_oclock.mk
index 5d40ab9..d3949de 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.mk
+++ b/package/x11r7/xapp_oclock/xapp_oclock.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_oclock -- round X clock
+# xapp_oclock
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
index 2fd8c17..f597c8c 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.mk
+++ b/package/x11r7/xapp_rgb/xapp_rgb.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_rgb -- uncompile an rgb color-name database
+# xapp_rgb
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_rstart/xapp_rstart.mk b/package/x11r7/xapp_rstart/xapp_rstart.mk
index 9f08f17..aa6a4b3 100644
--- a/package/x11r7/xapp_rstart/xapp_rstart.mk
+++ b/package/x11r7/xapp_rstart/xapp_rstart.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_rstart -- X.Org rstart application
+# xapp_rstart
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_scripts/xapp_scripts.mk b/package/x11r7/xapp_scripts/xapp_scripts.mk
index d444344..5146db5 100644
--- a/package/x11r7/xapp_scripts/xapp_scripts.mk
+++ b/package/x11r7/xapp_scripts/xapp_scripts.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_scripts -- start an X program on a remote machine
+# xapp_scripts
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index c9de815..ba2a07b 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_sessreg -- manage utmp/wtmp entries for non-init clients
+# xapp_sessreg
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
index 77e271d..9ecf953 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_setxkbmap -- Controls the keyboard layout of a running X server.
+# xapp_setxkbmap
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
index b183e91..413786a 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ b/package/x11r7/xapp_showfont/xapp_showfont.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_showfont -- font dumper for X font server
+# xapp_showfont
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
index 8e822cf..863e4f6 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_smproxy -- Session Manager Proxy
+# xapp_smproxy
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index 6e348a9..f566e10 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_twm -- No description available
+# xapp_twm
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index 8c8bdd1..6a7fe51 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_viewres -- graphical class browser for Xt
+# xapp_viewres
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index e1a50e6..a871486 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_x11perf -- summarize x11perf results
+# xapp_x11perf
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index d7a871c..0c13463 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xauth -- X authority file utility
+# xapp_xauth
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index 33ae12e..96bffe7 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_backlight -- xbacklight
+# xapp_backlight
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
index 8192d6d..73e0350 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.mk
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xbiff -- mailbox flag for X
+# xapp_xbiff
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.mk b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
index ecadec7..b53684b 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.mk
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xcalc -- scientific calculator for X
+# xapp_xcalc
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index 8accd7e..1d45970 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xclipboard -- interchange between cut buffer and selection
+# xapp_xclipboard
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xclock/xapp_xclock.mk b/package/x11r7/xapp_xclock/xapp_xclock.mk
index e8ca932..5f4eb31 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.mk
+++ b/package/x11r7/xapp_xclock/xapp_xclock.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xclock -- analog / digital clock for X
+# xapp_xclock
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
index 889e1ea..d08dfaa 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xcmsdb -- Device Color Characterization utility for X Color Management System
+# xapp_xcmsdb
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index e4be4c6..174fa17 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xcursorgen -- create an X cursor file from a collection of PNG images
+# xapp_xcursorgen
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
index 201990a..e732dc4 100644
--- a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
+++ b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xdbedizzy -- X.Org xdbedizzy application
+# xapp_xdbedizzy
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
index f228f0b..2ead9a5 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ b/package/x11r7/xapp_xditview/xapp_xditview.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xditview -- display ditroff output
+# xapp_xditview
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index c131d22..42c93dd 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xdm -- X.Org xdm application
+# xapp_xdm
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index a47879a..2143988 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xdpyinfo -- display information utility for X
+# xapp_xdpyinfo
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index e88e0bf..d37ec32 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xdriinfo -- query configuration information of DRI drivers
+# xapp_xdriinfo
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index 4c70002..f180ad2 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xedit -- simple text editor for X
+# xapp_xedit
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index 7e7a1b5..f98868c 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xev -- print contents of X events
+# xapp_xev
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 3458c57..2bed751 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xeyes -- X.Org xeyes application
+# xapp_xeyes
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
index e185466..07b6ac9 100644
--- a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
+++ b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xf86dga -- test program for the XFree86-DGA extension
+# xapp_xf86dga
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index 47a274c..5308a5c 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xfd -- X.Org xfd application
+# xapp_xfd
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index 6b685e8..1a64763 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xfontsel -- point and click selection of X11 font names
+# xapp_xfontsel
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 83cb59a..3c63906 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xfs -- X font server
+# xapp_xfs
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
index c45fa52..738b28a 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xfsinfo -- X font server information utility
+# xapp_xfsinfo
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
index 73c8426..bd87f52 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.mk
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xgamma -- Alter a monitor's gamma correction through the X server
+# xapp_xgamma
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index 400b1a7..69c464f 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xgc -- X graphics demo
+# xapp_xgc
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index 232a112..b81e1b9 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xhost -- Controls host and/or user access to a running X server.
+# xapp_xhost
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index fc9218d..da167ec 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xinit -- X Window System initializer
+# xapp_xinit
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index 4206d21..790f2c0 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xinput -- xinput
+# xapp_xinput
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index 86053ca..94fbd68 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xkbcomp -- compile XKB keyboard description
+# xapp_xkbcomp
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
index 1537b09..eb8a387 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xkbevd -- XKB event daemon
+# xapp_xkbevd
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
index fd3757e..8d2efbc 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xkbprint -- print an XKB keyboard description
+# xapp_xkbprint
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
index 64fe877..eaabea5 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xkbutils -- X.Org xkbutils application
+# xapp_xkbutils
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xkill/xapp_xkill.mk b/package/x11r7/xapp_xkill/xapp_xkill.mk
index 200d87a..092c0d3 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.mk
+++ b/package/x11r7/xapp_xkill/xapp_xkill.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xkill -- kill a client by its X resource
+# xapp_xkill
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index ef88333..6b4207a 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xload -- system load average display for X
+# xapp_xload
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index cee7487..af5b222 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xlogo -- X Window System logo
+# xapp_xlogo
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
index aa70b56..13c93d5 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xlsatoms -- list interned atoms defined on server
+# xapp_xlsatoms
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
index d07fd33..a5af935 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xlsclients -- X.Org xlsclients application
+# xapp_xlsclients
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
index 93fd926..619b7c5 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xlsfonts -- X.Org xlsfonts application
+# xapp_xlsfonts
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
index b55f4f3..bd98695 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ b/package/x11r7/xapp_xmag/xapp_xmag.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xmag -- X.Org xmag application
+# xapp_xmag
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index 634b9ea..62a9782 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# xapp_xman - Manual page display program for the X Window System
+# xapp_xman
 #
 #############################################################
 
diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
index 34f5433..61b8a08 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xmessage -- display a message or query in a window (X-based /bin/echo)
+# xapp_xmessage
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index 3a77648..ada1df5 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xmh -- send and read mail with an X interface to MH
+# xapp_xmh
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
index 3ffbb58..c5bce07 100644
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xmodmap -- utility for modifying keymaps and pointer button mappings in X
+# xapp_xmodmap
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index c9a1984..05dfdce 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xmore -- plain text display program for the X Window System
+# xapp_xmore
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
index 2950afd..b2c4e04 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ b/package/x11r7/xapp_xpr/xapp_xpr.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xpr -- X.Org xpr application
+# xapp_xpr
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index 3f7b9e1..956e484 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xprop -- property displayer for X
+# xapp_xprop
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index 3a1feed..9ba7332 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xrandr -- primitive command line interface to RandR extension
+# xapp_xrandr
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.mk b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
index 72ce0e1..4101d84 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.mk
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xrdb -- X server resource database utility
+# xapp_xrdb
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
index 2b0fe29..5578e46 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xrefresh -- refresh all or part of an X screen
+# xapp_xrefresh
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
index 5a6679f..9a37588 100644
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ b/package/x11r7/xapp_xset/xapp_xset.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xset -- X.Org xset application
+# xapp_xset
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
index 9808aa0..c4599a9 100644
--- a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
+++ b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xsetmode -- set the mode for an X Input device
+# xapp_xsetmode
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
index 7707b60..f56cdd5 100644
--- a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
+++ b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xsetpointer -- set an X Input device as the main pointer
+# xapp_xsetpointer
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
index b9bb794..0f23128 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xsetroot -- X.Org xsetroot application
+# xapp_xsetroot
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xsm/xapp_xsm.mk b/package/x11r7/xapp_xsm/xapp_xsm.mk
index cdc27a9..9229bbe 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.mk
+++ b/package/x11r7/xapp_xsm/xapp_xsm.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xsm -- X Session Manager
+# xapp_xsm
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
index 19c105e..8a21080 100644
--- a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
+++ b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xstdcmap -- X standard colormap utility
+# xapp_xstdcmap
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
index 3e3d50e..41c9dfe 100644
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
+++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xvidtune -- video mode tuner for Xorg
+# xapp_xvidtune
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
index 28c2cda..2db7840 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xvinfo -- Print out X-Video extension adaptor information
+# xapp_xvinfo
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
index a98b132..87cf256 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ b/package/x11r7/xapp_xwd/xapp_xwd.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xwd -- dump an image of an X window
+# xapp_xwd
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
index acbd7b3..a6d7c46 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xwininfo -- window information utility for X
+# xapp_xwininfo
 #
 ################################################################################
 
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index 911ac21..60afd86 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xapp_xwud -- image displayer for X
+# xapp_xwud
 #
 ################################################################################
 
diff --git a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
index 70f9887..c3b1b9c 100644
--- a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
+++ b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# xcursor-transparent-theme - No description available
+# xcursor-transparent-theme
 #
 #############################################################
 
diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
index ae964b4..9767f2c 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdata_xbitmaps -- No description available
+# xdata_xbitmaps
 #
 ################################################################################
 
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index 68c3ae2..5c86f50 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# xdata_xcursor-themes - No description available
+# xdata_xcursor-themes
 #
 #############################################################
 
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 58aa6db..61f0ce7 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-input-evdev -- Generic Linux input driver
+# xdriver_xf86-input-evdev
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
index 2c0e025..9ab47cd 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-input-joystick -- X.Org driver for joystick input devices
+# xdriver_xf86-input-joystick
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
index c78273d..f93652c 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-input-keyboard -- Keyboard input driver
+# xdriver_xf86-input-keyboard
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 35aad28..d9001f5 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-input-mouse -- X.Org driver for mouse input devices
+# xdriver_xf86-input-mouse
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index a6ec931..af63036 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-input-synaptics -- X.Org driver for synaptics input devices
+# xdriver_xf86-input-synaptics
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
index 43a5e8a..c9a1995 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-input-tslib -- Touch screen library input driver
+# xdriver_xf86-input-tslib
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
index d07fc4c..05374ef 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-input-vmmouse -- VMWare mouse input driver
+# xdriver_xf86-input-vmmouse
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
index e04cb13..cab3753 100644
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
+++ b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-input-void -- null input driver
+# xdriver_xf86-input-void
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
index 9c7cc1e..9b94b2a 100644
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-ark -- X.Org driver for ark cards
+# xdriver_xf86-video-ark
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
index 83e2b1f..887dc91 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-ast -- No description available
+# xdriver_xf86-video-ast
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 06cd53b..b90f10a 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-ati -- ATI video driver
+# xdriver_xf86-video-ati
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
index 5bc12ff..9e38115 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
+++ b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-cirrus -- Cirrus Logic video driver
+# xdriver_xf86-video-cirrus
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
index 9d6e61d..ee2aedb 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-dummy -- X.Org driver for dummy cards
+# xdriver_xf86-video-dummy
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
index f5a478e..12eb315 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-fbdev -- video driver for framebuffer device
+# xdriver_xf86-video-fbdev
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index fee8b53..7c7feb2 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-geode -- video driver for geode device
+# xdriver_xf86-video-geode
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
index 21a6ebd..c120aee 100644
--- a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
+++ b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-glide -- video driver for glide device
+# xdriver_xf86-video-glide
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
index 91176a9..396a162 100644
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
+++ b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-glint -- GLINT/Permedia video driver
+# xdriver_xf86-video-glint
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
index 71b3858..d18beb3 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-i128 -- Number 9 I128 video driver
+# xdriver_xf86-video-i128
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index ef7f390..97fef99 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-intel -- Intel video driver
+# xdriver_xf86-video-intel
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 2957190..7534d29 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-mach64 -- mach64 video driver
+# xdriver_xf86-video-mach64
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index 81f842b..916a098 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-mga -- Matrox video driver
+# xdriver_xf86-video-mga
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
index 33c3602..0c1ece4 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-neomagic -- Neomagic video driver
+# xdriver_xf86-video-neomagic
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
index 693303d..cacf39f 100644
--- a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
+++ b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-newport -- Newport video driver
+# xdriver_xf86-video-newport
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index a17aaec..8f9d6e8 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-nv -- NVIDIA video driver
+# xdriver_xf86-video-nv
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index ab1c652..d55d1a6 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-r128 -- R128 video driver
+# xdriver_xf86-video-r128
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index 8bc259a..e0faf07 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-savage -- S3 Savage video driver
+# xdriver_xf86-video-savage
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index 86bc8b6..91c8453 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-siliconmotion -- Silicon Motion video driver
+# xdriver_xf86-video-siliconmotion
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index 7ca185d..03276bb 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-sis -- SiS and XGI video driver
+# xdriver_xf86-video-sis
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index f4ae85f..7c06fb8 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-tdfx -- 3Dfx video driver
+# xdriver_xf86-video-tdfx
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
index c38c4ff..16423a2 100644
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
+++ b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-tga -- X.Org driver for tga cards
+# xdriver_xf86-video-tga
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
index 837279e..ea73f1b 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-trident -- Trident video driver
+# xdriver_xf86-video-trident
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
index f41822c..607b605 100644
--- a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
+++ b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-v4l -- video4linux driver
+# xdriver_xf86-video-v4l
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
index 580b4f2..3c69276 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-vesa -- Generic VESA video driver
+# xdriver_xf86-video-vesa
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
index 15eaac6..53a87be 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-vmware -- VMware SVGA video driver
+# xdriver_xf86-video-vmware
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
index 6c25557..d394403 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
+++ b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-voodoo -- Voodoo video driver
+# xdriver_xf86-video-voodoo
 #
 ################################################################################
 
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
index 664ce2a..c2d7d4d 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
+++ b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xdriver_xf86-video-wsfb -- WSFB video driver
+# xdriver_xf86-video-wsfb
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 8c84ee5..568dbcb 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xfont_encodings -- No description available
+# xfont_encodings
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
index 370286c..58a9fd7 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-adobe-100dpi -- No description available
+# font-adobe-100dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index fa0621e..02e6714 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-adobe-75dpi -- No description available
+# font-adobe-75dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index a27bce3..6692c24 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-adobe-utopia-100dpi -- No description available
+# font-adobe-utopia-100dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index c7295fa..7af3bd0 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-adobe-utopia-75dpi -- No description available
+# font-adobe-utopia-75dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
index 977899b..5826db8 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-adobe-utopia-type1 -- No description available
+# font-adobe-utopia-type1
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index 4a95dfb..2e8792a 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-alias -- No description available
+# font-alias
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index efa24ec..e24c834 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-arabic-misc -- No description available
+# font-arabic-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index 6fae9e6..8baa0cb 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bh-100dpi -- No description available
+# font-bh-100dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
index 68094bb..ae55fd3 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bh-75dpi -- No description available
+# font-bh-75dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
index 5c3fb38..b652a37 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bh-lucidatypewriter-100dpi -- No description available
+# font-bh-lucidatypewriter-100dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
index 54dff33..12c71e1 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bh-lucidatypewriter-75dpi -- No description available
+# font-bh-lucidatypewriter-75dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
index 8ff7481..fac6434 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bh-ttf -- No description available
+# font-bh-ttf
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
index 23f5739..1244cc9 100644
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bh-type1 -- No description available
+# font-bh-type1
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
index 01b0e23..a1c89aa 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bitstream-100dpi -- No description available
+# font-bitstream-100dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index 0b685e0..335f660 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bitstream-75dpi -- No description available
+# font-bitstream-75dpi
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
index 3c91300..c68db7e 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-bitstream-type1 -- No description available
+# font-bitstream-type1
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index f04dcb6..c41f0db 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-cronyx-cyrillic -- No description available
+# font-cronyx-cyrillic
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index 95a18c1..5cd312d 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-cursor-misc -- No description available
+# font-cursor-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index 93b8af6..8c267bc 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-daewoo-misc -- No description available
+# font-daewoo-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index 17fce1a..77242fe 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-dec-misc -- No description available
+# font-dec-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
index d9b4b9d..094781e 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-ibm-type1 -- No description available
+# font-ibm-type1
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 9534f1c..967303d 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-isas-misc -- No description available
+# font-isas-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index 2b017c7..eabb969 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-jis-misc -- No description available
+# font-jis-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index 8c11700..1f82f26 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-micro-misc -- No description available
+# font-micro-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index 8cec696..464f0be 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-misc-cyrillic -- No description available
+# font-misc-cyrillic
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
index 4275d08..0378907 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-misc-ethiopic -- No description available
+# font-misc-ethiopic
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
index 35d4a72..acc4338 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-misc-meltho -- No description available
+# font-misc-meltho
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index 12aabe1..a249edf 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-misc-misc -- No description available
+# font-misc-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index fe7593e..f89a63d 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-mutt-misc -- No description available
+# font-mutt-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index e310606..04b662c 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-schumacher-misc -- No description available
+# font-schumacher-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index 903a073..9196cd8 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-screen-cyrillic -- No description available
+# font-screen-cyrillic
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index 641f650..5a69dbc 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-sony-misc -- No description available
+# font-sony-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index 7c038f3..fb8ee4a 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-sun-misc -- No description available
+# font-sun-misc
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 0b79d80..b359f82 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-util -- No description available
+# font-util
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index 7ca7201..aec5a90 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-winitzki-cyrillic -- No description available
+# font-winitzki-cyrillic
 #
 ################################################################################
 
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
index 4bd6bd4..88da7aa 100644
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# font-xfree86-type1 -- No description available
+# font-xfree86-type1
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index 884d68d..c8ca83e 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libFS -- X.Org FS library
+# xlib_libFS
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index a0f2357..dd6814e 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libICE -- X.Org ICE library
+# xlib_libICE
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index ecc57c6..ac3bd37 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libSM -- X.Org SM library
+# xlib_libSM
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 5d0607b..f8b19e4 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libX11 -- X.Org X11 library
+# xlib_libX11
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 2781a14..2a648c9 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXScrnSaver -- X.Org XScrnSaver library
+# xlib_libXScrnSaver
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 1f838de..83deb75 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXau -- X.Org Xau library
+# xlib_libXau
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index c8be85c..fd4c573 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXaw -- X.Org Xaw library
+# xlib_libXaw
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index 8e6c5e2..e097e3c 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXcomposite -- X.Org Xcomposite library
+# xlib_libXcomposite
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 9a73f59..37afa5d 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXcursor -- X.Org Xcursor library
+# xlib_libXcursor
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index 431248e..69014f5 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXdamage -- X.Org Xdamage library
+# xlib_libXdamage
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index fe6fb6c..866f10b 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXdmcp -- X.Org Xdmcp library
+# xlib_libXdmcp
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 28150ab..3fc19e2 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXext -- X.Org Xext library
+# xlib_libXext
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index 70abf9a..7e956a6 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXfixes -- X.Org Xfixes library
+# xlib_libXfixes
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 0d93468..cf27aad 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXfont -- X.Org Xfont library
+# xlib_libXfont
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index 2c5281a..37f4434 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXft -- X.Org Xft library
+# xlib_libXft
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index 193fb97..cac3787 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXi -- X.Org Xi library
+# xlib_libXi
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index 98ac136..ce660ed 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXinerama -- X.Org Xinerama library
+# xlib_libXinerama
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index b067f8d..eda4151 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXmu -- X.Org Xmu library
+# xlib_libXmu
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 1d1d017..6e72281 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXpm -- X.Org Xpm library
+# xlib_libXpm
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index e5673c8..7986611 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXrandr -- X.Org Xrandr library
+# xlib_libXrandr
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 4398af5..4515b82 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXrender -- X.Org Xrender library
+# xlib_libXrender
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index a272841..8d5b79b 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXres -- X.Org XRes library
+# xlib_libXres
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 76c0489..f186df0 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXt -- X.Org Xt library
+# xlib_libXt
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index 055b4c3..46d58e2 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXtst -- X.Org Xtst library
+# xlib_libXtst
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index a64d980..8bf06c5 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXv -- X.Org Xv library
+# xlib_libXv
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index 18bfbef..2be5840 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXvMC -- X.Org XvMC library
+# xlib_libXvMC
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index ba2aed4..95e2d17 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXxf86dga -- X.Org Xxf86dga library
+# xlib_libXxf86dga
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index 2ed7eda..8ec1cf7 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libXxf86vm -- X.Org Xxf86vm library
+# xlib_libXxf86vm
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index 71a49c9..73c4b65 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libdmx -- X.Org dmx library
+# xlib_libdmx
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index 4169e90..d47a7d3 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libfontenc -- X.Org fontenc library
+# xlib_libfontenc
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
index 64224b1..9196e47 100644
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
+++ b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libpciaccess -- X.Org pciaccess library
+# xlib_libpciaccess
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 00395c5..2d5e574 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_libxkbfile -- X.Org xkbfile library
+# xlib_libxkbfile
 #
 ################################################################################
 
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index 7cb1a58..9e02d21 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xlib_xtrans -- X.Org xtrans library
+# xlib_xtrans
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
index 99f0839..998d0aa 100644
--- a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
+++ b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_applewmproto -- No description available
+# xproto_applewmproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
index 958908c..bca5a3c 100644
--- a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
+++ b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_bigreqsproto -- X.Org BigReqs protocol headers
+# xproto_bigreqsproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
index 4b5d1bb..2161358 100644
--- a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
+++ b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_compositeproto -- X.Org Composite protocol headers
+# xproto_compositeproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_damageproto/xproto_damageproto.mk b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
index 5c9782a..0311ea4 100644
--- a/package/x11r7/xproto_damageproto/xproto_damageproto.mk
+++ b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_damageproto -- X.Org Damage protocol headers
+# xproto_damageproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
index b551e0c..4cc795c 100644
--- a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
+++ b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_dmxproto -- X.Org DMX protocol headers
+# xproto_dmxproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
index 2d354c2..9b56bb1 100644
--- a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
+++ b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_dri2proto -- X.Org DRI2 protocol headers
+# xproto_dri2proto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
index c02b6bd..55212b2 100644
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_fixesproto -- X.Org Fixes protocol headers
+# xproto_fixesproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
index 88c0e67..0cb205a 100644
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_fontcacheproto -- X.Org Fontcache protocol headers
+# xproto_fontcacheproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
index 37dafea..64d7bea 100644
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_fontsproto -- X.Org Fonts protocol headers
+# xproto_fontsproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_glproto/xproto_glproto.mk b/package/x11r7/xproto_glproto/xproto_glproto.mk
index 78a38aa..7c4b13a 100644
--- a/package/x11r7/xproto_glproto/xproto_glproto.mk
+++ b/package/x11r7/xproto_glproto/xproto_glproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_glproto -- X.Org GL protocol headers
+# xproto_glproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index 83b9283..11316c3 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_inputproto -- X.Org Input protocol headers
+# xproto_inputproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
index a6facdf..868e518 100644
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_kbproto -- X.Org KB protocol headers
+# xproto_kbproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
index d8c61e6..b12653e 100644
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.mk
+++ b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_randrproto -- X.Org Randr protocol headers
+# xproto_randrproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_recordproto/xproto_recordproto.mk b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
index 0eef453..2d2ccea 100644
--- a/package/x11r7/xproto_recordproto/xproto_recordproto.mk
+++ b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_recordproto -- X.Org Record protocol headers
+# xproto_recordproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
index cc05f69..41a8445 100644
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.mk
+++ b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_renderproto -- X.Org Render protocol headers
+# xproto_renderproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
index bb25e06..960ca13 100644
--- a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
+++ b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_resourceproto -- X.Org Resource protocol headers
+# xproto_resourceproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
index 51e5a25..57047cf 100644
--- a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
+++ b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_scrnsaverproto -- X.Org ScrnSaver protocol headers
+# xproto_scrnsaverproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.mk b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
index 19c3902..2861c91 100644
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.mk
+++ b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_videoproto -- X.Org Video protocol headers
+# xproto_videoproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
index 9282b4d..067bccf 100644
--- a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
+++ b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_windowswmproto -- No description available
+# xproto_windowswmproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
index bafadec..fd3cb07 100644
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_xcmiscproto -- X.Org XCMisc protocol headers
+# xproto_xcmiscproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index 75a87d5..b78ba4a 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_xextproto -- X.Org XExt protocol headers
+# xproto_xextproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
index 5e802b0..f88f5ec 100644
--- a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
+++ b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_xf86bigfontproto -- X.Org XF86BigFont protocol headers
+# xproto_xf86bigfontproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
index 3cb69bc..d671bf0 100644
--- a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
+++ b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_xf86dgaproto -- X.Org XF86DGA protocol headers
+# xproto_xf86dgaproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
index 3663ff1..e6bb0f1 100644
--- a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
+++ b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_xf86driproto -- X.Org XF86DRI protocol headers
+# xproto_xf86driproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
index 815e10d..4163798 100644
--- a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
+++ b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_xf86vidmodeproto -- X.Org XF86VidMode protocol headers
+# xproto_xf86vidmodeproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
index 7136c9d..4c9ae11 100644
--- a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
+++ b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_xineramaproto -- X.Org Xinerama protocol headers
+# xproto_xineramaproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index a0a9d01..bfff3be 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xproto_xproto -- X.Org xproto protocol headers
+# xproto_xproto
 #
 ################################################################################
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index a2bc056..4089aab 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xserver_xorg-server -- No description available
+# xserver_xorg-server
 #
 ################################################################################
 
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 4f0e23f..0a436d1 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xutil_makedepend -- No description available
+# xutil_makedepend
 #
 ################################################################################
 
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
index 08b823a..f2656c2 100644
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# xutil_util-macros -- No description available
+# xutil_util-macros
 #
 ################################################################################
 
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 720b22d..b423195 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -1,7 +1,6 @@
 #############################################################
+#
 # Xenomai
-# URL  : http://xenomai.org
-# NOTE : Real-Time Framework for Linux
 #
 #############################################################
 
-- 
1.8.1.2
