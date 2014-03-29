From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:15:35 +0100
Subject: [Buildroot] [git commit] xapp_xbacklight: Bump version to 1.2.1
Message-ID: <20140329222158.DFE5A9C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=849beadf67a232e92f8c81185c2b5da4d445a2be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index d4325aa..88c4bc5 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-XAPP_XBACKLIGHT_VERSION = 1.1.2
+XAPP_XBACKLIGHT_VERSION = 1.2.1
 XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.bz2
 XAPP_XBACKLIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XBACKLIGHT_LICENSE = MIT
 XAPP_XBACKLIGHT_LICENSE_FILES = COPYING
-XAPP_XBACKLIGHT_DEPENDENCIES = xlib_libX11 xlib_libXrandr xlib_libXrender
+XAPP_XBACKLIGHT_DEPENDENCIES = xlib_libX11 xlib_libXrandr xlib_libXrender xcb-util
 
 $(eval $(autotools-package))
