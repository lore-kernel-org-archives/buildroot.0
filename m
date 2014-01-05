From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 22:20:47 +0100
Subject: [Buildroot] [git commit] xorg: Bump xlib_libpciaccess version to
	0.13.2
Message-ID: <20140105230942.9AC6C9C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1a0144039daf9db3f52553c7bfdb6b28e1c1549
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
index 9196e47..d065bf1 100644
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
+++ b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBPCIACCESS_VERSION = 0.13.1
+XLIB_LIBPCIACCESS_VERSION = 0.13.2
 XLIB_LIBPCIACCESS_SOURCE = libpciaccess-$(XLIB_LIBPCIACCESS_VERSION).tar.bz2
 XLIB_LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBPCIACCESS_LICENSE = MIT
