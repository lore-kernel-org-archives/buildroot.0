From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xwud to 1.0.2
Message-ID: <20100308133650.DF6CC776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b52b679aef33427aee0df3db67c9e7524dfe7a0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xwud/Config.in    |    2 +-
 package/x11r7/xapp_xwud/xapp_xwud.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xwud/Config.in b/package/x11r7/xapp_xwud/Config.in
index 1dfa3e1..888ee18 100644
--- a/package/x11r7/xapp_xwud/Config.in
+++ b/package/x11r7/xapp_xwud/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_XAPP_XWUD
 	bool "xwud"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xwud 1.0.1
+	  xwud 1.0.2
 	  image displayer for X
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index efd2cab..0640f78 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XWUD_VERSION = 1.0.1
+XAPP_XWUD_VERSION = 1.0.2
 XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.bz2
 XAPP_XWUD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWUD_AUTORECONF = NO
-- 
1.6.3.3
