From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86driproto to 2.1.0
Message-ID: <20100308133613.C119E776E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=450ace360203e8554023b1e4ffa5c5590c126c5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_xf86driproto/Config.in        |    2 +-
 .../xproto_xf86driproto/xproto_xf86driproto.mk     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_xf86driproto/Config.in b/package/x11r7/xproto_xf86driproto/Config.in
index 3d7fd91..1fd1ab9 100644
--- a/package/x11r7/xproto_xf86driproto/Config.in
+++ b/package/x11r7/xproto_xf86driproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	bool "xf86driproto"
 	help
-	  xf86driproto 2.0.3
+	  xf86driproto 2.1.0
 	  X.Org XF86DRI protocol headers
diff --git a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
index 264c28e..4c37fa1 100644
--- a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
+++ b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XF86DRIPROTO_VERSION = 2.0.4
+XPROTO_XF86DRIPROTO_VERSION = 2.1.0
 XPROTO_XF86DRIPROTO_SOURCE = xf86driproto-$(XPROTO_XF86DRIPROTO_VERSION).tar.bz2
 XPROTO_XF86DRIPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XF86DRIPROTO_AUTORECONF = NO
-- 
1.6.3.3
