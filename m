From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:53:16 +0100
Subject: [Buildroot] [PATCH 036/120] xapp_xset: bump revision to X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-37-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
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
-- 
1.7.10.4
