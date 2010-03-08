From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libXdamage to 1.1.2
Message-ID: <20100308133653.D5294776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0708a48cb08bfb543e28d51647aa1667b05a2e3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libXdamage/Config.in          |    2 +-
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXdamage/Config.in b/package/x11r7/xlib_libXdamage/Config.in
index 3da6b43..b1d2e1c 100644
--- a/package/x11r7/xlib_libXdamage/Config.in
+++ b/package/x11r7/xlib_libXdamage/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXdamage 1.0.4
+	  libXdamage 1.1.2
 	  X.Org Xdamage library
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index 957c52c..92f92e5 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXDAMAGE_VERSION = 1.1.1
+XLIB_LIBXDAMAGE_VERSION = 1.1.2
 XLIB_LIBXDAMAGE_SOURCE = libXdamage-$(XLIB_LIBXDAMAGE_VERSION).tar.bz2
 XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDAMAGE_AUTORECONF = NO
-- 
1.6.3.3
