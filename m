From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xhost to 1.0.3
Message-ID: <20100308133646.0495A776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0e4783c6e01af59602774ac2a105e8fec1958ee1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xhost/Config.in     |    2 +-
 package/x11r7/xapp_xhost/xapp_xhost.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xhost/Config.in b/package/x11r7/xapp_xhost/Config.in
index 4694dbd..b2a40c8 100644
--- a/package/x11r7/xapp_xhost/Config.in
+++ b/package/x11r7/xapp_xhost/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_XHOST
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xhost 1.0.1
+	  xhost 1.0.3
 	  Controls host and/or user access to a running X server.
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index 742f1b0..fd81537 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XHOST_VERSION = 1.0.2
+XAPP_XHOST_VERSION = 1.0.3
 XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.bz2
 XAPP_XHOST_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XHOST_AUTORECONF = NO
-- 
1.6.3.3
