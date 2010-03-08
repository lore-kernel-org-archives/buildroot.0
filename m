From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump iceauth to 1.0.3
Message-ID: <20100308133641.8C873776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f962d03471321bcac28465f003ac26fdfa869b31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_iceauth/Config.in       |    2 +-
 package/x11r7/xapp_iceauth/xapp_iceauth.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_iceauth/Config.in b/package/x11r7/xapp_iceauth/Config.in
index c748870..81acb96 100644
--- a/package/x11r7/xapp_iceauth/Config.in
+++ b/package/x11r7/xapp_iceauth/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_ICEAUTH
 	select BR2_PACKAGE_XLIB_LIBICE
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  iceauth 1.0.1
+	  iceauth 1.0.3
 	  ICE authority file utility
diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
index 9e8b9a4..3b9e373 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.mk
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_ICEAUTH_VERSION = 1.0.2
+XAPP_ICEAUTH_VERSION = 1.0.3
 XAPP_ICEAUTH_SOURCE = iceauth-$(XAPP_ICEAUTH_VERSION).tar.bz2
 XAPP_ICEAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_ICEAUTH_AUTORECONF = NO
-- 
1.6.3.3
