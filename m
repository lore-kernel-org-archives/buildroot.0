From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 4 Jan 2014 14:38:29 +0100
Subject: [Buildroot] [PATCH 00/36] Update xorg packages
Message-ID: <BLU0-SMTP322F0B0DA043619A8E91DA1D9B50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump xorg packages to current versions

Bernd Kuhls (36):
  xorg: New package xproto_presentproto
  xorg: Bump xcb-proto & libxcb version to 1.10
  xorg: xapp_xdpyinfo also depends on xlib_libXinerama &
    xlib_libXcomposite
  xorg: Bump xapp_xrandr version to 1.4.1
  xorg: Bump xdriver_xf86-video-intel version to 2.99.907
  xorg: Bump xkeyboard-config version to 2.10.1
  xorg: Bump xlib_libfontenc version to 1.1.2
  xorg: Bump xlib_libpciaccess version to 0.13.2
  xorg: Bump xlib_libSM version to 1.2.2
  xorg: Bump xlib_libX11 version to 1.6.2
  xorg: Bump xlib_libXau version to 1.0.8
  xorg: Bump xlib_libXcomposite version to 0.4.4
  xorg: Bump xlib_libXdamage version to 1.1.4
  xorg: Bump xlib_libXext version to 1.3.2
  xorg: Bump xlib_libXfixes version to 5.0.1
  xorg: Bump xlib_libXfont version to 1.4.6
  xorg: Bump xlib_libXi version to 1.7.2
  xorg: Bump xlib_libXinerama version to 1.1.3
  xorg: Bump xlib_libXmu version to 1.1.2
  xorg: xlib_libXpm depends on libiconv & gettext if appropriate
  xorg: Bump xlib_libXrandr version to 1.4.2
  xorg: Bump xlib_libXrender version to 0.9.8
  xorg: Bump xlib_libXt version to 1.1.4
  xorg: Bump xlib_libXtst version to 1.2.2
  xorg: Bump xlib_libXxf86vm version to 1.1.3
  xorg: Bump xlib_xtrans version to 1.3.2
  xorg: Bump xproto_dri2proto version to 2.8
  xorg: Bump xproto_glproto version to 1.4.17
  xorg: Bump xproto_inputproto version to 2.3
  xorg: Bump xproto_randrproto version to 1.4.0
  xorg: Bump xproto_videoproto version to 2.3.2
  xorg: Bump xproto_xextproto version to 7.3.0
  xorg: Bump xproto_xproto version to 7.0.25
  xorg: Bump xutil_makedepend version to 1.0.5
  xorg: Bump xutil_util-macros version to 1.18.0
  xorg: Bump xserver_xorg-server version to 1.15.0

 package/x11r7/Config.in                            |    1 +
 package/x11r7/libxcb/libxcb.mk                     |   10 ++--
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk       |    2 +-
 package/x11r7/xapp_xrandr/xapp_xrandr.mk           |    2 +-
 package/x11r7/xcb-proto/xcb-proto.mk               |    2 +-
 .../xdriver_xf86-video-intel.mk                    |   20 +++++--
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    4 +-
 package/x11r7/xlib_libSM/xlib_libSM.mk             |    2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    2 +-
 package/x11r7/xlib_libXau/xlib_libXau.mk           |    2 +-
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |    2 +-
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   |    2 +-
 package/x11r7/xlib_libXext/xlib_libXext.mk         |    2 +-
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |    2 +-
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    2 +-
 package/x11r7/xlib_libXi/xlib_libXi.mk             |    2 +-
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    2 +-
 package/x11r7/xlib_libXmu/xlib_libXmu.mk           |    2 +-
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |    2 +
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk     |    2 +-
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |    2 +-
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    2 +-
 package/x11r7/xlib_libXtst/xlib_libXtst.mk         |    2 +-
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |    2 +-
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |    2 +-
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    2 +-
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |    2 +-
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |    2 +-
 package/x11r7/xproto_glproto/xproto_glproto.mk     |    2 +-
 .../x11r7/xproto_inputproto/xproto_inputproto.mk   |    2 +-
 package/x11r7/xproto_presentproto/Config.in        |    4 ++
 .../xproto_presentproto/xproto_presentproto.mk     |   15 +++++
 .../x11r7/xproto_randrproto/xproto_randrproto.mk   |    2 +-
 .../x11r7/xproto_videoproto/xproto_videoproto.mk   |    2 +-
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    2 +-
 package/x11r7/xproto_xproto/xproto_xproto.mk       |    2 +-
 package/x11r7/xserver_xorg-server/Config.in        |    1 +
 .../xserver_xorg-server-02-cve-2013-1940.patch     |   34 -----------
 ...ut-allocate-enough-space-for-null-charact.patch |   59 --------------------
 .../xserver_xorg-server/xserver_xorg-server.mk     |    3 +-
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |    2 +-
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    2 +-
 42 files changed, 80 insertions(+), 135 deletions(-)
 create mode 100644 package/x11r7/xproto_presentproto/Config.in
 create mode 100644 package/x11r7/xproto_presentproto/xproto_presentproto.mk
 delete mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-02-cve-2013-1940.patch
 delete mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-03-Revert-kinput-allocate-enough-space-for-null-charact.patch

-- 
1.7.9.5
