From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXres to 1.0.4
Message-ID: <20100308133656.0E491776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a047a0a6c54f911eab2a2577ace60d1971c09867
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXres/Config.in       |    2 +-
 package/x11r7/xlib_libXres/xlib_libXres.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXres/Config.in b/package/x11r7/xlib_libXres/Config.in
index 7940971..44ca4c9 100644
--- a/package/x11r7/xlib_libXres/Config.in
+++ b/package/x11r7/xlib_libXres/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XLIB_LIBXRES
 	select BR2_PACKAGE_XPROTO_RESOURCEPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXres 1.0.3
+	  libXres 1.0.4
 	  X.Org XRes library
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index c5171c3..155cbfb 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRES_VERSION = 1.0.3
+XLIB_LIBXRES_VERSION = 1.0.4
 XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.bz2
 XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRES_AUTORECONF = NO
-- 
1.6.3.3
