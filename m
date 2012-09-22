From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:59 +0200
Subject: [Buildroot] [git commit] xapp_xsetroot: bump version
Message-ID: <20120922194208.ECD479963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4db3d59b264dde31c81009d85316da9bbc34fcf1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
index 94fbdaf..881e408 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XSETROOT_VERSION = 1.0.3
+XAPP_XSETROOT_VERSION = 1.1.0
 XAPP_XSETROOT_SOURCE = xsetroot-$(XAPP_XSETROOT_VERSION).tar.bz2
 XAPP_XSETROOT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSETROOT_DEPENDENCIES = xlib_libX11 xlib_libXmu xdata_xbitmaps
