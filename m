From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xauth to 1.0.4
Message-ID: <20100308133620.58E61776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=82a121dde731cb4992a2d0b62509fcbe6141f9d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xauth/Config.in     |    2 +-
 package/x11r7/xapp_xauth/xapp_xauth.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xauth/Config.in b/package/x11r7/xapp_xauth/Config.in
index e716fc9..d4dc731 100644
--- a/package/x11r7/xapp_xauth/Config.in
+++ b/package/x11r7/xapp_xauth/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XAPP_XAUTH
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xauth 1.0.2
+	  xauth 1.0.4
 	  X authority file utility
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index 06c90c1..c0ab92d 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XAUTH_VERSION = 1.0.3
+XAPP_XAUTH_VERSION = 1.0.4
 XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
 XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XAUTH_AUTORECONF = NO
-- 
1.6.3.3
