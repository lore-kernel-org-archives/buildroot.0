From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 22:31:40 +0100
Subject: [Buildroot] [git commit] xorg: Bump xlib_libXdamage version to 1.1.4
Message-ID: <20140105230942.BEC7F9C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=132efcd2c80b8ac8b8cc4e6ddd5b31967553b10c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index 69014f5..9f982ee 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXDAMAGE_VERSION = 1.1.3
+XLIB_LIBXDAMAGE_VERSION = 1.1.4
 XLIB_LIBXDAMAGE_SOURCE = libXdamage-$(XLIB_LIBXDAMAGE_VERSION).tar.bz2
 XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDAMAGE_LICENSE = MIT
