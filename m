From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xlsclients to 1.0.2
Message-ID: <20100308133647.DFD36776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6d50ebd0d26561c920374135ac30d81d82f7b959
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xlsclients/Config.in          |    2 +-
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xlsclients/Config.in b/package/x11r7/xapp_xlsclients/Config.in
index 35dd633..5b469f5 100644
--- a/package/x11r7/xapp_xlsclients/Config.in
+++ b/package/x11r7/xapp_xlsclients/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_XLSCLIENTS
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xlsclients 1.0.1
+	  xlsclients 1.0.2
 	  X.Org xlsclients application
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
index cd08c9c..cd522db 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSCLIENTS_VERSION = 1.0.1
+XAPP_XLSCLIENTS_VERSION = 1.0.2
 XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.bz2
 XAPP_XLSCLIENTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSCLIENTS_AUTORECONF = NO
-- 
1.6.3.3
