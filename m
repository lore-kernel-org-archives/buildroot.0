From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 16 May 2014 05:51:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfont: Bump version
	to 1.4.8
Message-ID: <1400212297-14833-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-0209, CVE-2014-0210 & CVE-2014-0211
http://lists.x.org/archives/xorg-announce/2014-May/002431.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXfont/xlib_libXfont.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.10.4
