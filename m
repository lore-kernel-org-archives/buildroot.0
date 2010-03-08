From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXfont to 1.4.1
Message-ID: <20100308133654.AC794776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=71a17ed8638b1a75e17f4a0a3dd2ffb1b67907c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXfont/Config.in        |    2 +-
 package/x11r7/xlib_libXfont/xlib_libXfont.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXfont/Config.in b/package/x11r7/xlib_libXfont/Config.in
index cf8d2de..0cb57ce 100644
--- a/package/x11r7/xlib_libXfont/Config.in
+++ b/package/x11r7/xlib_libXfont/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XFONT_ENCODINGS
 	help
-	  libXfont 1.2.7
+	  libXfont 1.4.1
 	  X.Org Xfont library
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index a64b74e..ba22805 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT_VERSION = 1.3.3
+XLIB_LIBXFONT_VERSION = 1.4.1
 XLIB_LIBXFONT_SOURCE = libXfont-$(XLIB_LIBXFONT_VERSION).tar.bz2
 XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT_AUTORECONF = YES
-- 
1.6.3.3
