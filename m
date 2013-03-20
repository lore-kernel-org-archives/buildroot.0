From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:00 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-tdfx: bump revision to
	X11R7.7
Message-ID: <20130324225145.A13119B20D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58e16644b2f9031fd8890b151f1e86860e754ac7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 .../xdriver_xf86-video-tdfx.mk                     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index 5031319..db3ba8c 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TDFX_VERSION = 1.4.3
+XDRIVER_XF86_VIDEO_TDFX_VERSION = 1.4.4
 XDRIVER_XF86_VIDEO_TDFX_SOURCE = xf86-video-tdfx-$(XDRIVER_XF86_VIDEO_TDFX_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TDFX_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
