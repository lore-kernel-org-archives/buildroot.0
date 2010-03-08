From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump renderproto to 0.11
Message-ID: <20100308133614.688D2776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ebd78a912d7edf111af71a7fd55c7c682c6544ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_renderproto/Config.in         |    2 +-
 .../x11r7/xproto_renderproto/xproto_renderproto.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_renderproto/Config.in b/package/x11r7/xproto_renderproto/Config.in
index 248ae49..6fed61b 100644
--- a/package/x11r7/xproto_renderproto/Config.in
+++ b/package/x11r7/xproto_renderproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_RENDERPROTO
 	bool "renderproto"
 	help
-	  renderproto 0.9.2
+	  renderproto 0.11
 	  X.Org Render protocol headers
diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
index 5157d55..1763efd 100644
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.mk
+++ b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_RENDERPROTO_VERSION = 0.9.3
+XPROTO_RENDERPROTO_VERSION = 0.11
 XPROTO_RENDERPROTO_SOURCE = renderproto-$(XPROTO_RENDERPROTO_VERSION).tar.bz2
 XPROTO_RENDERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RENDERPROTO_AUTORECONF = NO
-- 
1.6.3.3
