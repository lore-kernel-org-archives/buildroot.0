From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXv to 1.0.5
Message-ID: <20100308133656.D2581776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8100718bda2f5398bf4424f7336a6f90b7ede594
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXv/Config.in     |    2 +-
 package/x11r7/xlib_libXv/xlib_libXv.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXv/Config.in b/package/x11r7/xlib_libXv/Config.in
index dd1b24e..5c586d9 100644
--- a/package/x11r7/xlib_libXv/Config.in
+++ b/package/x11r7/xlib_libXv/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XLIB_LIBXV
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXv 1.0.3
+	  libXv 1.0.5
 	  X.Org Xv library
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index be38208..df47f79 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXV_VERSION = 1.0.4
+XLIB_LIBXV_VERSION = 1.0.5
 XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.bz2
 XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXV_AUTORECONF = NO
-- 
1.6.3.3
