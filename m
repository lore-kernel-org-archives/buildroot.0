From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 6 Jan 2014 21:40:03 +0100
Subject: [Buildroot] [PATCH 0/8] Update more xorg packages
Message-ID: <BLU0-SMTP34C682EA8AFD076C66C8C5D9B70@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls (8):
  xorg: Bump xlib_libFS to version 1.0.5
  xorg: Bump xlib_libXaw to version 1.0.12
  xorg: Bump xlib_libXcursor to version 1.1.14
  xorg: Bump xlib_libXpm to version 3.5.11
  xorg: Bump xlib_libXres to version 1.0.7
  xorg: Bump xlib_libXv to version 1.0.10
  xorg: Bump xlib_libXxf86dga to version 1.1.4
  xorg: Bump xlib_libdmx to version 1.1.3

 package/x11r7/xlib_libFS/xlib_libFS.mk             |    2 +-
 package/x11r7/xlib_libXaw/xlib_libXaw.mk           |    2 +-
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |    2 +-
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |    2 +-
 package/x11r7/xlib_libXres/xlib_libXres.mk         |    2 +-
 package/x11r7/xlib_libXv/xlib_libXv.mk             |    2 +-
 .../xlib_libXxf86dga-0001-fix-compilation.patch    |   27 -------------------
 .../xlib_libXxf86dga-0002-fix-compilation.patch    |   28 --------------------
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    2 +-
 package/x11r7/xlib_libdmx/xlib_libdmx.mk           |    2 +-
 10 files changed, 8 insertions(+), 63 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-0001-fix-compilation.patch
 delete mode 100644 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-0002-fix-compilation.patch

-- 
1.7.9.5
