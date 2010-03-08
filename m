From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xkill to 1.0.2
Message-ID: <20100308133647.59311776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b0bb8aa9394eadf2cd003a5df1ca0866e4aa5314
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xkill/Config.in     |    2 +-
 package/x11r7/xapp_xkill/xapp_xkill.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xkill/Config.in b/package/x11r7/xapp_xkill/Config.in
index 3ddb3b0..946e172 100644
--- a/package/x11r7/xapp_xkill/Config.in
+++ b/package/x11r7/xapp_xkill/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_XKILL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xkill 1.0.1
+	  xkill 1.0.2
 	  kill a client by its X resource
diff --git a/package/x11r7/xapp_xkill/xapp_xkill.mk b/package/x11r7/xapp_xkill/xapp_xkill.mk
index 765ed62..894c552 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.mk
+++ b/package/x11r7/xapp_xkill/xapp_xkill.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKILL_VERSION = 1.0.1
+XAPP_XKILL_VERSION = 1.0.2
 XAPP_XKILL_SOURCE = xkill-$(XAPP_XKILL_VERSION).tar.bz2
 XAPP_XKILL_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKILL_AUTORECONF = NO
-- 
1.6.3.3
