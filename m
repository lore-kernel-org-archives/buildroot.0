From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump compositeproto to 0.4.1
Message-ID: <20100308133659.D4C94776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9df487f2fc969d891350b43dea591cd4e9786a9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_compositeproto/Config.in      |    2 +-
 .../xproto_compositeproto/xproto_compositeproto.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_compositeproto/Config.in b/package/x11r7/xproto_compositeproto/Config.in
index c592f2e..899a499 100644
--- a/package/x11r7/xproto_compositeproto/Config.in
+++ b/package/x11r7/xproto_compositeproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_COMPOSITEPROTO
 	bool "compositeproto"
 	help
-	  compositeproto 0.3.1
+	  compositeproto 0.4.1
 	  X.Org Composite protocol headers
diff --git a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
index 8dfe276..b176b69 100644
--- a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
+++ b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_COMPOSITEPROTO_VERSION = 0.4
+XPROTO_COMPOSITEPROTO_VERSION = 0.4.1
 XPROTO_COMPOSITEPROTO_SOURCE = compositeproto-$(XPROTO_COMPOSITEPROTO_VERSION).tar.bz2
 XPROTO_COMPOSITEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_COMPOSITEPROTO_AUTORECONF = NO
-- 
1.6.3.3
