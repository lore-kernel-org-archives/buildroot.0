From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXmu to 1.0.5
Message-ID: <20100308133655.632EA776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6916776850af2b1bdd5e05c56ee796fc23f395c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXmu/Config.in      |    2 +-
 package/x11r7/xlib_libXmu/xlib_libXmu.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXmu/Config.in b/package/x11r7/xlib_libXmu/Config.in
index 9fcd3d0..a698eb1 100644
--- a/package/x11r7/xlib_libXmu/Config.in
+++ b/package/x11r7/xlib_libXmu/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXmu 1.0.3
+	  libXmu 1.0.5
 	  X.Org Xmu library
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index e6c01b5..8ad7280 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXMU_VERSION = 1.0.4
+XLIB_LIBXMU_VERSION = 1.0.5
 XLIB_LIBXMU_SOURCE = libXmu-$(XLIB_LIBXMU_VERSION).tar.bz2
 XLIB_LIBXMU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXMU_AUTORECONF = NO
-- 
1.6.3.3
