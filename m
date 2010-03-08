From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xwininfo to 1.0.5
Message-ID: <20100308133650.A83B6776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f334c8a960b5265f31fa2d90d0376a9aea53f30f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xwininfo/Config.in        |    2 +-
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xwininfo/Config.in b/package/x11r7/xapp_xwininfo/Config.in
index bb7ba16..4261a92 100644
--- a/package/x11r7/xapp_xwininfo/Config.in
+++ b/package/x11r7/xapp_xwininfo/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_XWININFO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xwininfo 1.0.2
+	  xwininfo 1.0.5
 	  window information utility for X
diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
index e2afbf2..36f11f7 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XWININFO_VERSION = 1.0.4
+XAPP_XWININFO_VERSION = 1.0.5
 XAPP_XWININFO_SOURCE = xwininfo-$(XAPP_XWININFO_VERSION).tar.bz2
 XAPP_XWININFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWININFO_AUTORECONF = NO
-- 
1.6.3.3
