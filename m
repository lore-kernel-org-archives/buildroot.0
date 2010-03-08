From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86vidmodeproto to 2.3
Message-ID: <20100308133658.C25C4776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b7bc06748fe543466fa83b7ecb46cfa01824833d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_xf86vidmodeproto/Config.in    |    2 +-
 .../xproto_xf86vidmodeproto.mk                     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_xf86vidmodeproto/Config.in b/package/x11r7/xproto_xf86vidmodeproto/Config.in
index 4bf7f20..49a6476 100644
--- a/package/x11r7/xproto_xf86vidmodeproto/Config.in
+++ b/package/x11r7/xproto_xf86vidmodeproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	bool "xf86vidmodeproto"
 	help
-	  xf86vidmodeproto 2.2.2
+	  xf86vidmodeproto 2.3
 	  X.Org XF86VidMode protocol headers
diff --git a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
index 35acfa0..c3f3fe5 100644
--- a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
+++ b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XF86VIDMODEPROTO_VERSION = 2.2.2
+XPROTO_XF86VIDMODEPROTO_VERSION = 2.3
 XPROTO_XF86VIDMODEPROTO_SOURCE = xf86vidmodeproto-$(XPROTO_XF86VIDMODEPROTO_VERSION).tar.bz2
 XPROTO_XF86VIDMODEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XF86VIDMODEPROTO_AUTORECONF = NO
-- 
1.6.3.3
