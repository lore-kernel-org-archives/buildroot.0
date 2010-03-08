From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump glproto to 1.4.10
Message-ID: <20100308133700.92AEB776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8f749d66ce9f831ff732640361389fa2b0576fa9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_glproto/Config.in         |    2 +-
 package/x11r7/xproto_glproto/xproto_glproto.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_glproto/Config.in b/package/x11r7/xproto_glproto/Config.in
index 28b059a..dad2bbc 100644
--- a/package/x11r7/xproto_glproto/Config.in
+++ b/package/x11r7/xproto_glproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_GLPROTO
 	bool "glproto"
 	help
-	  glproto 1.4.8
+	  glproto 1.4.10
 	  X.Org GL protocol headers
diff --git a/package/x11r7/xproto_glproto/xproto_glproto.mk b/package/x11r7/xproto_glproto/xproto_glproto.mk
index 339a711..98c6b2f 100644
--- a/package/x11r7/xproto_glproto/xproto_glproto.mk
+++ b/package/x11r7/xproto_glproto/xproto_glproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_GLPROTO_VERSION = 1.4.9
+XPROTO_GLPROTO_VERSION = 1.4.10
 XPROTO_GLPROTO_SOURCE = glproto-$(XPROTO_GLPROTO_VERSION).tar.bz2
 XPROTO_GLPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_GLPROTO_AUTORECONF = NO
-- 
1.6.3.3
