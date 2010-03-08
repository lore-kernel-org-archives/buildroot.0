From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86bigfontproto to 1.2.0
Message-ID: <20100308133701.C5038776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d3ecf4dc0fdbd47da7f876b4a78ec9dfd6322b9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_xf86bigfontproto/Config.in    |    2 +-
 .../xproto_xf86bigfontproto.mk                     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_xf86bigfontproto/Config.in b/package/x11r7/xproto_xf86bigfontproto/Config.in
index 162dfb9..1699ebf 100644
--- a/package/x11r7/xproto_xf86bigfontproto/Config.in
+++ b/package/x11r7/xproto_xf86bigfontproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
 	bool "xf86bigfontproto"
 	help
-	  xf86bigfontproto 1.1.2
+	  xf86bigfontproto 1.2.0
 	  X.Org XF86BigFont protocol headers
diff --git a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
index fdb16c2..fda78e2 100644
--- a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
+++ b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XF86BIGFONTPROTO_VERSION = 1.1.2
+XPROTO_XF86BIGFONTPROTO_VERSION = 1.2.0
 XPROTO_XF86BIGFONTPROTO_SOURCE = xf86bigfontproto-$(XPROTO_XF86BIGFONTPROTO_VERSION).tar.bz2
 XPROTO_XF86BIGFONTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XF86BIGFONTPROTO_AUTORECONF = NO
-- 
1.6.3.3
