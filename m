From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xineramaproto to 1.2
Message-ID: <20100308133656.96B89776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0214fcfee594d0b64cecd72abe704d88062ee230
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_xineramaproto/Config.in       |    2 +-
 .../xproto_xineramaproto/xproto_xineramaproto.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_xineramaproto/Config.in b/package/x11r7/xproto_xineramaproto/Config.in
index da609d7..c2662ad 100644
--- a/package/x11r7/xproto_xineramaproto/Config.in
+++ b/package/x11r7/xproto_xineramaproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	bool "xineramaproto"
 	help
-	  xineramaproto 1.1.2
+	  xineramaproto 1.2
 	  X.Org Xinerama protocol headers
diff --git a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
index ec6bc50..bca3c8f 100644
--- a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
+++ b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XINERAMAPROTO_VERSION = 1.1.2
+XPROTO_XINERAMAPROTO_VERSION = 1.2
 XPROTO_XINERAMAPROTO_SOURCE = xineramaproto-$(XPROTO_XINERAMAPROTO_VERSION).tar.bz2
 XPROTO_XINERAMAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XINERAMAPROTO_AUTORECONF = NO
-- 
1.6.3.3
