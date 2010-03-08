From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xextproto to 7.1.1
Message-ID: <20100308133615.22186776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e3795dfad6752e01bbcff82a6e5e07242c58a5c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_xextproto/Config.in           |    2 +-
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_xextproto/Config.in b/package/x11r7/xproto_xextproto/Config.in
index 14328cd..e1bf62f 100644
--- a/package/x11r7/xproto_xextproto/Config.in
+++ b/package/x11r7/xproto_xextproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_XEXTPROTO
 	bool "xextproto"
 	help
-	  xextproto 7.0.2
+	  xextproto 7.1.1
 	  X.Org XExt protocol headers
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index 80c9e10..6b880b4 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XEXTPROTO_VERSION = 7.0.3
+XPROTO_XEXTPROTO_VERSION = 7.1.1
 XPROTO_XEXTPROTO_SOURCE = xextproto-$(XPROTO_XEXTPROTO_VERSION).tar.bz2
 XPROTO_XEXTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XEXTPROTO_AUTORECONF = NO
-- 
1.6.3.3
