From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xrefresh to 1.0.3
Message-ID: <20100308133649.7C4B6776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=40b881227f6a3620c460a9c88a197787ea703f1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xrefresh/Config.in        |    2 +-
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xrefresh/Config.in b/package/x11r7/xapp_xrefresh/Config.in
index ab9db25..7febcba 100644
--- a/package/x11r7/xapp_xrefresh/Config.in
+++ b/package/x11r7/xapp_xrefresh/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_XAPP_XREFRESH
 	bool "xrefresh"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xrefresh 1.0.2
+	  xrefresh 1.0.3
 	  refresh all or part of an X screen
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
index 2b8a7e8..9a9022c 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XREFRESH_VERSION = 1.0.2
+XAPP_XREFRESH_VERSION = 1.0.3
 XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.bz2
 XAPP_XREFRESH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XREFRESH_AUTORECONF = NO
-- 
1.6.3.3
