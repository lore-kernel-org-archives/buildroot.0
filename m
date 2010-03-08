From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xproto to 7.0.16
Message-ID: <20100308133620.99366776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1d05188170af72a1a96ca5057f87866f1294bfe6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_xproto/Config.in        |    2 +-
 package/x11r7/xproto_xproto/xproto_xproto.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_xproto/Config.in b/package/x11r7/xproto_xproto/Config.in
index 960d00f..449d7bc 100644
--- a/package/x11r7/xproto_xproto/Config.in
+++ b/package/x11r7/xproto_xproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_XPROTO
 	bool "xproto"
 	help
-	  xproto 7.0.10
+	  xproto 7.0.16
 	  X.Org xproto protocol headers
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index ff2a042..c1e2449 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XPROTO_VERSION = 7.0.13
+XPROTO_XPROTO_VERSION = 7.0.16
 XPROTO_XPROTO_SOURCE = xproto-$(XPROTO_XPROTO_VERSION).tar.bz2
 XPROTO_XPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XPROTO_AUTORECONF = NO
-- 
1.6.3.3
