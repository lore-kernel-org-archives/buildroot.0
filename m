From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:55 +0200
Subject: [Buildroot] [git commit] xdriver_x86-driver-xgixp: bump version
Message-ID: <20120922194157.C093F9963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ca752dce9494874149bb83106192d5ed4dab0cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xdriver_xf86-video-xgixp.mk                    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
index f1e518a..4a9a2a2 100644
--- a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
+++ b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_XGIXP_VERSION = 1.7.99.4
+XDRIVER_XF86_VIDEO_XGIXP_VERSION = 1.8.0
 XDRIVER_XF86_VIDEO_XGIXP_SOURCE = xf86-video-xgixp-$(XDRIVER_XF86_VIDEO_XGIXP_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_XGIXP_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_XGIXP_AUTORECONF = YES
