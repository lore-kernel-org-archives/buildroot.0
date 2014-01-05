From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 22:05:21 +0100
Subject: [Buildroot] [git commit] xorg: Bump xlib_libXext version to 1.3.2
Message-ID: <20140105230942.278349BE33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63ab80e49a7c6f7e684d3f3dcd86cbddcb5e5081
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXext/xlib_libXext.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 3fc19e2..ebfa4bc 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXEXT_VERSION = 1.3.1
+XLIB_LIBXEXT_VERSION = 1.3.2
 XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.bz2
 XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXEXT_LICENSE = MIT
