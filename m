From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xset to 1.1.0
Message-ID: <20100308133649.B99CC776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e7ae841064871c7d184bfab0b3be18cb8569c50e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xset/Config.in    |    2 +-
 package/x11r7/xapp_xset/xapp_xset.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xset/Config.in b/package/x11r7/xapp_xset/Config.in
index 644c227..c61a4a9 100644
--- a/package/x11r7/xapp_xset/Config.in
+++ b/package/x11r7/xapp_xset/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_XSET
 	select BR2_PACKAGE_XLIB_LIBXFONTCACHE
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xset 1.0.2
+	  xset 1.1.0
 	  X.Org xset application
diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
index 70396e5..51ddd98 100644
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ b/package/x11r7/xapp_xset/xapp_xset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XSET_VERSION = 1.0.4
+XAPP_XSET_VERSION = 1.1.0
 XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.bz2
 XAPP_XSET_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSET_AUTORECONF = NO
-- 
1.6.3.3
