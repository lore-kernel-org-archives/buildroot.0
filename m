From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 22:38:41 +0100
Subject: [Buildroot] [git commit] xorg: Bump xlib_libXinerama version to
	1.1.3
Message-ID: <20140105230942.CE43E9C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=981e7ce01977c6e0973b96a42d134a30d7a21c9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index ce660ed..9336a22 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXINERAMA_VERSION = 1.1.2
+XLIB_LIBXINERAMA_VERSION = 1.1.3
 XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.bz2
 XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXINERAMA_LICENSE = MIT
