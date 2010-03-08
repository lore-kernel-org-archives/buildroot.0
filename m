From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86dgaproto to 2.1
Message-ID: <20100308133659.06F66776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=59e240d46cdfcbeddd0fad68c85a4f4e646dd335
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_xf86dgaproto/Config.in        |    2 +-
 .../xproto_xf86dgaproto/xproto_xf86dgaproto.mk     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_xf86dgaproto/Config.in b/package/x11r7/xproto_xf86dgaproto/Config.in
index 83e1e4d..0ff27e0 100644
--- a/package/x11r7/xproto_xf86dgaproto/Config.in
+++ b/package/x11r7/xproto_xf86dgaproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	bool "xf86dgaproto"
 	help
-	  xf86dgaproto 2.0.2
+	  xf86dgaproto 2.1
 	  X.Org XF86DGA protocol headers
diff --git a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
index 418c3c4..d654a1c 100644
--- a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
+++ b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XF86DGAPROTO_VERSION = 2.0.3
+XPROTO_XF86DGAPROTO_VERSION = 2.1
 XPROTO_XF86DGAPROTO_SOURCE = xf86dgaproto-$(XPROTO_XF86DGAPROTO_VERSION).tar.bz2
 XPROTO_XF86DGAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XF86DGAPROTO_AUTORECONF = NO
-- 
1.6.3.3
