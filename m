From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Jan 2014 21:23:11 +0100
Subject: [Buildroot] [git commit] xorg: Bump xlib_libdmx to version 1.1.3
Message-ID: <20140107202442.07CE49C16E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6149ab48412b8cf47e69a084b102872e8f763c03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

thanks to Jerzy Grzegorek for the hint

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libdmx/xlib_libdmx.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index 73c4b65..c720db6 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBDMX_VERSION = 1.1.2
+XLIB_LIBDMX_VERSION = 1.1.3
 XLIB_LIBDMX_SOURCE = libdmx-$(XLIB_LIBDMX_VERSION).tar.bz2
 XLIB_LIBDMX_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBDMX_LICENSE = MIT
