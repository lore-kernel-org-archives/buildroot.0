From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:37:37 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-ast: bump
	version to 1.1.5
Message-ID: <20160413203800.E638B81E27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0b28b776f4e8b74c43a60e86e279941ce84c4da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
