From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump windowswmproto to 1.0.4
Message-ID: <20100308133701.7FF3B776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9f85c6c56c393a620d39f2527ff3ed307c43b685
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_windowswmproto/Config.in      |    2 +-
 .../xproto_windowswmproto/xproto_windowswmproto.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_windowswmproto/Config.in b/package/x11r7/xproto_windowswmproto/Config.in
index 2598e6e..1a7476f 100644
--- a/package/x11r7/xproto_windowswmproto/Config.in
+++ b/package/x11r7/xproto_windowswmproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_WINDOWSWMPROTO
 	bool "windowswmproto"
 	help
-	  windowswmproto 1.0.3
+	  windowswmproto 1.0.4
 	  No description available
diff --git a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
index 456c661..827d797 100644
--- a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
+++ b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_WINDOWSWMPROTO_VERSION = 1.0.3
+XPROTO_WINDOWSWMPROTO_VERSION = 1.0.4
 XPROTO_WINDOWSWMPROTO_SOURCE = windowswmproto-$(XPROTO_WINDOWSWMPROTO_VERSION).tar.bz2
 XPROTO_WINDOWSWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_WINDOWSWMPROTO_AUTORECONF = NO
-- 
1.6.3.3
