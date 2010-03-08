From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xcursorgen to 1.0.3
Message-ID: <20100308133644.9863B7774C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=50256d0700faef0ce1e681080c7b7f30f2e24f25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xcursorgen/Config.in          |    2 +-
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xcursorgen/Config.in b/package/x11r7/xapp_xcursorgen/Config.in
index 890f52d..51e23c1 100644
--- a/package/x11r7/xapp_xcursorgen/Config.in
+++ b/package/x11r7/xapp_xcursorgen/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XAPP_XCURSORGEN
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	help
-	  xcursorgen 1.0.1
+	  xcursorgen 1.0.3
 	  create an X cursor file from a collection of PNG images
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index 543dcda..c42ffa4 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCURSORGEN_VERSION = 1.0.2
+XAPP_XCURSORGEN_VERSION = 1.0.3
 XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.bz2
 XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCURSORGEN_AUTORECONF = NO
-- 
1.6.3.3
