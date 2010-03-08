From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-ast to 0.89.9
Message-ID: <20100308133625.D1AF1776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6e5da04b02d48408a863c574c80ca4f1a1ba0aa9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-ast/Config.in     |    2 +-
 .../xdriver_xf86-video-ast.mk                      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ast/Config.in b/package/x11r7/xdriver_xf86-video-ast/Config.in
index 4b6bf31..b8a0b1e 100644
--- a/package/x11r7/xdriver_xf86-video-ast/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ast/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AST
 	bool "xf86-video-ast"
 	help
-	  xf86-video-ast 0.81.0
+	  xf86-video-ast 0.89.9
 	  No description available
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
index 60ff7cd..bb2d6b6 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AST_VERSION = 0.85.0
+XDRIVER_XF86_VIDEO_AST_VERSION = 0.89.9
 XDRIVER_XF86_VIDEO_AST_SOURCE = xf86-video-ast-$(XDRIVER_XF86_VIDEO_AST_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AST_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AST_AUTORECONF = NO
-- 
1.6.3.3
