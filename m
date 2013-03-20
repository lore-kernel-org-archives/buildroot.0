From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:10:59 +0100
Subject: [Buildroot] [git commit] xapp_xset: bump revision to X11R7.7
Message-ID: <20130324225139.6A7799B2B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98080f2ffec460be5c8ea9cdd5465c481924798e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xapp_xset/Config.in    |    1 -
 package/x11r7/xapp_xset/xapp_xset.mk |    4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xset/Config.in b/package/x11r7/xapp_xset/Config.in
index ff697e5..71497ab 100644
--- a/package/x11r7/xapp_xset/Config.in
+++ b/package/x11r7/xapp_xset/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XAPP_XSET
 	bool "xset"
-	select BR2_PACKAGE_XLIB_LIBXFONTCACHE
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
 	  X.Org xset application
diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
index 088cebc..afa6b53 100644
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ b/package/x11r7/xapp_xset/xapp_xset.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XSET_VERSION = 1.2.1
+XAPP_XSET_VERSION = 1.2.2
 XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.bz2
 XAPP_XSET_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XSET_DEPENDENCIES = xlib_libXfontcache xlib_libXmu
+XAPP_XSET_DEPENDENCIES = xlib_libXmu
 
 $(eval $(autotools-package))
