From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Apr 2016 19:15:01 +0200
Subject: [Buildroot] [PATCH 5/6] package/x11r7/xdriver_xf86-video-ast: bump
	version to 1.1.5
In-Reply-To: <1460308502-14157-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460308502-14157-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460308502-14157-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash | 2 +-
 package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash
index a4e3439..cf877d5 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	e778f1824f5eed7e3197f00f39418de1525e310fd78e0335f6178c26b9b0495b	xf86-video-ast-1.0.1.tar.bz2
+sha256	1edbbc55d47d3fd71dec99b15c2483e22738c642623a0fb86ef4a81a9067a2de	xf86-video-ast-1.1.5.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
index d040ccd..3c9eb91 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AST_VERSION = 1.0.1
+XDRIVER_XF86_VIDEO_AST_VERSION = 1.1.5
 XDRIVER_XF86_VIDEO_AST_SOURCE = xf86-video-ast-$(XDRIVER_XF86_VIDEO_AST_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AST_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AST_LICENSE = MIT
-- 
2.8.0.rc3
