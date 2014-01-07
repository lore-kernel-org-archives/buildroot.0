From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Jan 2014 21:17:49 +0100
Subject: [Buildroot] [git commit] xorg: Bump xlib_libXres to version 1.0.7
Message-ID: <20140107202441.D04769C16E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c9c4b4ab2f8cd3dffc596dd5eb2ceef1d68a0e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

thanks to Jerzy Grzegorek for the hint

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXres/xlib_libXres.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 8d5b79b..b75ddd9 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRES_VERSION = 1.0.6
+XLIB_LIBXRES_VERSION = 1.0.7
 XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.bz2
 XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRES_LICENSE = MIT
