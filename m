From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 22:28:40 +0100
Subject: [Buildroot] [git commit] xorg: Bump xlib_libXcomposite version to
	0.4.4
Message-ID: <20140105230942.B85E29C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11851a59a1feb375e6f558cafe49f5664e4d53ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index e097e3c..f0e59cb 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXCOMPOSITE_VERSION = 0.4.3
+XLIB_LIBXCOMPOSITE_VERSION = 0.4.4
 XLIB_LIBXCOMPOSITE_SOURCE = libXcomposite-$(XLIB_LIBXCOMPOSITE_VERSION).tar.bz2
 XLIB_LIBXCOMPOSITE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCOMPOSITE_LICENSE = MIT
