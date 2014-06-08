From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 18:48:23 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfont: Bump version
	to 1.4.8
Message-ID: <20140608164829.63B219CF36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=431fdde8198ff10f698ea94744ffd2f5053f9529
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-0209, CVE-2014-0210 & CVE-2014-0211
http://lists.x.org/archives/xorg-announce/2014-May/002431.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXfont/xlib_libXfont.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index b692d08..5f2b1e1 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT_VERSION = 1.4.7
+XLIB_LIBXFONT_VERSION = 1.4.8
 XLIB_LIBXFONT_SOURCE = libXfont-$(XLIB_LIBXFONT_VERSION).tar.bz2
 XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT_LICENSE = MIT
