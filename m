From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:52:40 +0100
Subject: [Buildroot] [PATCH 000/120] x11: update to R7.7
Message-ID: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following the work of Will Wagner: http://lists.busybox.net/pipermail/buildroot/2013-February/066605.html
I have tried to update x11 components to R7.7, now based on the latest master. 
I have not included patches that delete xapp_* packages even though they are not a part of R7.7 release since they are released individually.
These patches can also be fetched as a branch here: https://bitbucket.org/baekdahl/buildroot/src/b8db03aa6921/?at=x11r77

Looking forward to your feedback.


Regards, Jesper

Jesper Baekdahl (1):
  xproto_dri2proto: bump version

Will Wagner (119):
  xlib_liboldX: removed in X11R7.7
  xlib_libXfontcache: removed in X11R7.7
  xlib_libxkbui: removed in X11R7.7
  xlib_libXp: removed in X11R7.7
  xlib_libXprintAppUtil: removed in X11R7.7
  xlib_lixXprintUtil: removed in X11R7.7
  xcb-util: removed in X11R7.7
  xfont_font-bitstream-speedo: removed in X11R7.7
  xproto_fontcacheproto: removed in X11R7.7
  xproto_printproto: removed in X11R7.7
  xproto_xf86rushproto: removed in X11R7.7
  xapp_xinit: removed in X11R7.7
  libxcb: bump revision to X11R7.7
  xapp_iceauth: bump revision to X11R7.7
  xapp_luit: bump revision to X11R7.7
  xapp_makefontscale: bump revision to X11R7.7
  xapp_sessreg: bump revision to X11R7.7
  xapp_setxkbmap: bump revision to X11R7.7
  xapp_smproxy: bump revision to X11R7.7
  xapp_xauth: bump revision to X11R7.7
  xapp_xcmsdb: bump revision to X11R7.7
  xapp_xdpyinfo: bump revision to X11R7.7
  xapp_xev: bump revision to X11R7.7
  xapp_xgamma: bump revision to X11R7.7
  xapp_xhost: bump revision to X11R7.7
  xapp_xinput: bump revision to X11R7.7
  xapp_xkbcomp: bump revision to X11R7.7
  xapp_xkbevd: bump revision to X11R7.7
  xpp_xlsatoms: bump revision to X11R7.7
  xpp_xlsclients: bump revision to X11R7.7
  xapp_xmodmap: bump revision to X11R7.7
  xapp_xpr: bump revision to X11R7.7
  xapp_xprop: bump revision to X11R7.7
  xapp_xrandr: bump revision to X11R7.7
  xapp_xrdb: bump revision to X11R7.7
  xapp_xset: bump revision to X11R7.7
  xapp_xwd: bump revision to X11R7.7
  xapp_xwininfo: bump revision to X11R7.7
  xapp_xwud: bump revision to X11R7.7
  xcb-proto: bump revision to X11R7.7
  xdriver_xf86-input-evdev: bump revision to X11R7.7
  xdriver_xf86-input-joystick: bump revision to X11R7.7
  xdriver_xf86-input-keyboard: bump revision to X11R7.7
  xdriver_xf86-input-mouse: bump revision to X11R7.7
  xdriver_xf86-input-synaptics: bump revision to X11R7.7
  xdriver_xf86-input-vmmouse: bump revision to X11R7.7
  xdriver_xf86-input-void: bump revision to X11R7.7
  xdriver_xf86-video-ark: bump revision to X11R7.7
  xdriver_xf86-video-ast: bump revision to X11R7.7
  xdriver_xf86-video-ati: bump revision to X11R7.7
  xdriver_xf86-video-cirrus: bump revision to X11R7.7
  xdriver_xf86-video-dummy: bump revision to X11R7.7
  xdriver_xf86-video-geode: bump revision to X11R7.7
  xdriver_xf86-video-glide: bump revision to X11R7.7
  xdriver_xf86-video-glint: bump revision to X11R7.7
  xdriver_xf86-video-i128: bump revision to X11R7.7
  xdriver_xf86-video-intel: bump revision to X11R7.7
  xdriver_xf86-video-mach64: bump revision to X11R7.7
  xdriver_xf86-video-mga: bump revision to X11R7.7
  xdriver_xf86-video-neomagic: bump revision to X11R7.7
  xdriver_xf86-video-newport: bump revision to X11R7.7
  xdriver_xf86-video-openchrome: bump revision to X11R7.7
  xdriver_xf86-video-r128: bump revision to X11R7.7
  xdriver_xf86-video-savage: bump revision to X11R7.7
  xdriver_xf86-video-siliconmotion: bump revision to X11R7.7
  xdriver_xf86-video-sis: bump revision to X11R7.7
  xdriver_xf86-video-tdfx: bump revision to X11R7.7
  xdriver_xf86-video-trident: bump revision to X11R7.7
  xdriver_xf86-video-vesa: bump revision to X11R7.7
  xdriver_xf86-video-vmware: bump revision to X11R7.7
  xdriver_xf86-video-wsfb: bump revision to X11R7.7
  xfont: bump revision to X11R7.7
  xkeyboard-config: bump revision to X11R7.7
  xlib_libFS: bump revision to X11R7.7
  xlib_libICE: bump revision to X11R7.7
  xlib_libSM: bump revision to X11R7.7
  xlib_libX11: bump revision to X11R7.7
  xlib_libXScrnSaver: bump revision to X11R7.7
  xlib_libXau: bump revision to X11R7.7
  xlib_libXaw: bump revision to X11R7.7
  xlib_libXcursor: bump revision to X11R7.7
  xlib_libXdmcp: bump revision to X11R7.7
  xlib_libXext: bump revision to X11R7.7
  xlib_libXfixes: bump revision to X11R7.7
  xlib_libXfont: bump revision to X11R7.7
  xlib_libXft: bump revision to X11R7.7
  xlib_libXi: bump revision to X11R7.7
  xlib_libXinerama: bump revision to X11R7.7
  xlib_libXmu: bump revision to X11R7.7
  xlib_libXpm: bump revision to X11R7.7
  xlib_libXrandr: bump revision to X11R7.7
  xlib_libXres: bump revision to X11R7.7
  xlib_libXtst: bump revision to X11R7.7
  xlib_libXv: bump revision to X11R7.7
  xlib_libXvMC: bump revision to X11R7.7
  xlib_libXxf86dga: bump revision to X11R7.7
  xlib_libXxf86vm: bump revision to X11R7.7
  xlib_libdmx: bump revision to X11R7.7
  xlib_libfontenc: bump revision to X11R7.7
  xlib_libpciaccess: bump revision to X11R7.7
  xlib_libxkbfile: bump revision to X11R7.7
  xlib_xtrans: bump revision to X11R7.7
  xproto_applewmproto: bump revision to X11R7.7
  xproto_bigreqsproto: bump revision to X11R7.7
  xproto_fontsproto: bump revision to X11R7.7
  xproto_glproto: bump revision to X11R7.7
  xproto_inputproto: bump revision to X11R7.7
  xproto_kbproto: bump revision to X11R7.7
  xproto_recordproto: bump revision to X11R7.7
  proto_resourceproto: bump revision to X11R7.7
  xproto_scrnsaverproto: bump revision to X11R7.7
  xproto_xcmiscproto: bump revision to X11R7.7
  xproto_xextproto: bump revision to X11R7.7
  xproto_xproto: bump revision to X11R7.7
  xutil_makedepend: bump revision to X11R7.7
  xutil_util-macros: bump revision to X11R7.7
  xserver_xorg-server: bump revision to X11R7.7
  libdrm: bump version and add lib_pciaccess dependancy
  mesa3d: bump version

 package/libdrm/Config.in                           |    1 +
 package/libdrm/libdrm.mk                           |    3 +-
 package/x11r7/Config.in                            |   12 --------
 package/x11r7/libxcb/libxcb.mk                     |    2 +-
 package/x11r7/mesa3d/mesa3d.mk                     |    2 +-
 package/x11r7/xapp_iceauth/xapp_iceauth.mk         |    2 +-
 package/x11r7/xapp_luit/xapp_luit.mk               |    2 +-
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |    2 +-
 package/x11r7/xapp_sessreg/xapp_sessreg.mk         |    2 +-
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk     |    2 +-
 package/x11r7/xapp_smproxy/xapp_smproxy.mk         |    2 +-
 package/x11r7/xapp_xauth/xapp_xauth.mk             |    2 +-
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk           |    2 +-
 package/x11r7/xapp_xdpyinfo/Config.in              |    2 --
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk       |    4 +--
 package/x11r7/xapp_xev/xapp_xev.mk                 |    2 +-
 package/x11r7/xapp_xgamma/xapp_xgamma.mk           |    2 +-
 package/x11r7/xapp_xhost/xapp_xhost.mk             |    2 +-
 package/x11r7/xapp_xinit/Config.in                 |   10 -------
 package/x11r7/xapp_xinit/xapp_xinit.mk             |   12 --------
 package/x11r7/xapp_xinput/xapp_xinput.mk           |    2 +-
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk         |    2 +-
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk           |    2 +-
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk       |    2 +-
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk   |    2 +-
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk         |    2 +-
 package/x11r7/xapp_xpr/xapp_xpr.mk                 |    2 +-
 package/x11r7/xapp_xprop/xapp_xprop.mk             |    2 +-
 package/x11r7/xapp_xrandr/xapp_xrandr.mk           |    2 +-
 package/x11r7/xapp_xrdb/xapp_xrdb.mk               |    2 +-
 package/x11r7/xapp_xset/Config.in                  |    1 -
 package/x11r7/xapp_xset/xapp_xset.mk               |    4 +--
 package/x11r7/xapp_xwd/xapp_xwd.mk                 |    2 +-
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk       |    2 +-
 package/x11r7/xapp_xwud/xapp_xwud.mk               |    2 +-
 package/x11r7/xcb-proto/xcb-proto.mk               |    2 +-
 package/x11r7/xcb-util/Config.in                   |    8 ------
 package/x11r7/xcb-util/xcb-util.mk                 |   13 ---------
 .../xdriver_xf86-input-evdev.mk                    |    2 +-
 .../xdriver_xf86-input-joystick.mk                 |    2 +-
 .../xdriver_xf86-input-keyboard.mk                 |    2 +-
 .../xdriver_xf86-input-mouse.mk                    |    2 +-
 .../xdriver_xf86-input-synaptics.mk                |    2 +-
 .../xdriver_xf86-input-vmmouse.mk                  |    2 +-
 .../xdriver_xf86-input-void.mk                     |    2 +-
 .../xdriver_xf86-video-ark.mk                      |    2 +-
 .../xdriver_xf86-video-ast.mk                      |    2 +-
 .../xdriver_xf86-video-ati.mk                      |    2 +-
 .../xdriver_xf86-video-cirrus.mk                   |    2 +-
 .../xdriver_xf86-video-dummy.mk                    |    2 +-
 .../xdriver_xf86-video-geode.mk                    |    2 +-
 .../xdriver_xf86-video-glide.mk                    |    2 +-
 ...iver_xf86-video-glint-1.2.1-cross-compile.patch |   29 -------------------
 .../xdriver_xf86-video-glint.mk                    |    2 +-
 .../xdriver_xf86-video-i128.mk                     |    2 +-
 .../xdriver_xf86-video-intel.mk                    |    2 +-
 .../xdriver_xf86-video-mach64.mk                   |    2 +-
 .../xdriver_xf86-video-mga.mk                      |    2 +-
 .../xdriver_xf86-video-neomagic.mk                 |    2 +-
 .../xdriver_xf86-video-newport.mk                  |    2 +-
 .../xdriver_xf86-video-openchrome.mk               |    2 +-
 .../xdriver_xf86-video-r128.mk                     |    2 +-
 .../xdriver_xf86-video-savage.mk                   |    2 +-
 .../xdriver_xf86-video-siliconmotion.mk            |    2 +-
 .../xdriver_xf86-video-sis.mk                      |    2 +-
 .../xdriver_xf86-video-tdfx.mk                     |    2 +-
 .../xdriver_xf86-video-trident.mk                  |    2 +-
 .../xdriver_xf86-video-vesa.mk                     |    2 +-
 .../xdriver_xf86-video-vmware.mk                   |    2 +-
 .../xdriver_xf86-video-wsfb.mk                     |    2 +-
 .../x11r7/xfont_font-bitstream-speedo/Config.in    |    4 ---
 .../xfont_font-bitstream-speedo.mk                 |   15 ----------
 package/x11r7/xfont_font-util/xfont_font-util.mk   |    2 +-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 +-
 package/x11r7/xlib_libFS/xlib_libFS.mk             |    2 +-
 package/x11r7/xlib_libICE/xlib_libICE.mk           |    2 +-
 package/x11r7/xlib_libSM/xlib_libSM.mk             |    2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    2 +-
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |    2 +-
 package/x11r7/xlib_libXau/xlib_libXau.mk           |    2 +-
 package/x11r7/xlib_libXaw/Config.in                |    1 -
 package/x11r7/xlib_libXaw/xlib_libXaw.mk           |    4 +--
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |    2 +-
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |    2 +-
 package/x11r7/xlib_libXext/xlib_libXext.mk         |    2 +-
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |    2 +-
 package/x11r7/xlib_libXfont/Config.in              |    1 -
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    4 +--
 package/x11r7/xlib_libXfontcache/Config.in         |    7 -----
 .../x11r7/xlib_libXfontcache/xlib_libXfontcache.mk |   14 ---------
 package/x11r7/xlib_libXft/xlib_libXft.mk           |    2 +-
 package/x11r7/xlib_libXi/xlib_libXi.mk             |    2 +-
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    2 +-
 package/x11r7/xlib_libXmu/xlib_libXmu.mk           |    2 +-
 package/x11r7/xlib_libXp/Config.in                 |    8 ------
 package/x11r7/xlib_libXp/xlib_libXp.mk             |   14 ---------
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |    2 +-
 package/x11r7/xlib_libXprintAppUtil/Config.in      |    7 -----
 .../xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk |   13 ---------
 package/x11r7/xlib_libXprintUtil/Config.in         |    8 ------
 .../x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk |   13 ---------
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk     |    2 +-
 package/x11r7/xlib_libXres/xlib_libXres.mk         |    2 +-
 package/x11r7/xlib_libXtst/xlib_libXtst.mk         |    2 +-
 package/x11r7/xlib_libXv/xlib_libXv.mk             |    2 +-
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk         |    2 +-
 .../xlib_libXxf86dga-fix-compilation.patch         |   30 ++++++++++++++++++++
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    2 +-
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |    2 +-
 package/x11r7/xlib_libdmx/xlib_libdmx.mk           |    2 +-
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |    2 +-
 package/x11r7/xlib_liboldX/Config.in               |    5 ----
 package/x11r7/xlib_liboldX/xlib_liboldX.mk         |   14 ---------
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    2 +-
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |    2 +-
 package/x11r7/xlib_libxkbui/Config.in              |    7 -----
 package/x11r7/xlib_libxkbui/xlib_libxkbui.mk       |   13 ---------
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |    2 +-
 .../xproto_applewmproto/xproto_applewmproto.mk     |    2 +-
 .../xproto_bigreqsproto/xproto_bigreqsproto.mk     |    2 +-
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |    2 +-
 package/x11r7/xproto_fontcacheproto/Config.in      |    4 ---
 .../xproto_fontcacheproto/xproto_fontcacheproto.mk |   14 ---------
 .../x11r7/xproto_fontsproto/xproto_fontsproto.mk   |    2 +-
 package/x11r7/xproto_glproto/xproto_glproto.mk     |    2 +-
 .../x11r7/xproto_inputproto/xproto_inputproto.mk   |    2 +-
 package/x11r7/xproto_kbproto/xproto_kbproto.mk     |    2 +-
 package/x11r7/xproto_printproto/Config.in          |    4 ---
 .../x11r7/xproto_printproto/xproto_printproto.mk   |   13 ---------
 .../x11r7/xproto_recordproto/xproto_recordproto.mk |    2 +-
 .../xproto_resourceproto/xproto_resourceproto.mk   |    2 +-
 .../xproto_scrnsaverproto/xproto_scrnsaverproto.mk |    2 +-
 .../x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |    2 +-
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    2 +-
 package/x11r7/xproto_xf86rushproto/Config.in       |    4 ---
 .../xproto_xf86rushproto/xproto_xf86rushproto.mk   |   13 ---------
 package/x11r7/xproto_xproto/xproto_xproto.mk       |    2 +-
 package/x11r7/xserver_xorg-server/Config.in        |    1 -
 .../xserver_xorg-server/xserver_xorg-server.mk     |    3 +-
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |    2 +-
 .../xutil_util-macros/xutil_util-macros-1.17.patch |    9 ++++++
 141 files changed, 152 insertions(+), 396 deletions(-)
 delete mode 100644 package/x11r7/xapp_xinit/Config.in
 delete mode 100644 package/x11r7/xapp_xinit/xapp_xinit.mk
 delete mode 100644 package/x11r7/xcb-util/Config.in
 delete mode 100644 package/x11r7/xcb-util/xcb-util.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.1-cross-compile.patch
 delete mode 100644 package/x11r7/xfont_font-bitstream-speedo/Config.in
 delete mode 100644 package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
 delete mode 100644 package/x11r7/xlib_libXfontcache/Config.in
 delete mode 100644 package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
 delete mode 100644 package/x11r7/xlib_libXp/Config.in
 delete mode 100644 package/x11r7/xlib_libXp/xlib_libXp.mk
 delete mode 100644 package/x11r7/xlib_libXprintAppUtil/Config.in
 delete mode 100644 package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
 delete mode 100644 package/x11r7/xlib_libXprintUtil/Config.in
 delete mode 100644 package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
 create mode 100644 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-fix-compilation.patch
 delete mode 100644 package/x11r7/xlib_liboldX/Config.in
 delete mode 100644 package/x11r7/xlib_liboldX/xlib_liboldX.mk
 delete mode 100644 package/x11r7/xlib_libxkbui/Config.in
 delete mode 100644 package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
 delete mode 100644 package/x11r7/xproto_fontcacheproto/Config.in
 delete mode 100644 package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
 delete mode 100644 package/x11r7/xproto_printproto/Config.in
 delete mode 100644 package/x11r7/xproto_printproto/xproto_printproto.mk
 delete mode 100644 package/x11r7/xproto_xf86rushproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
 create mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros-1.17.patch

-- 
1.7.10.4
