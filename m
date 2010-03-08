From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXfixes to 4.0.4
Message-ID: <20100308133654.67CAD776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=82fa434e39eecea58949f4010d62ba4d7236088e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXfixes/Config.in         |    2 +-
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXfixes/Config.in b/package/x11r7/xlib_libXfixes/Config.in
index db7cb95..e0b941c 100644
--- a/package/x11r7/xlib_libXfixes/Config.in
+++ b/package/x11r7/xlib_libXfixes/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXfixes 4.0.3
+	  libXfixes 4.0.4
 	  X.Org Xfixes library
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index bfa1f6a..f2fd1f8 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFIXES_VERSION = 4.0.3
+XLIB_LIBXFIXES_VERSION = 4.0.4
 XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.bz2
 XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFIXES_AUTORECONF = NO
-- 
1.6.3.3
