From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:10:58 +0100
Subject: [Buildroot] [git commit] xapp_xgamma: bump revision to X11R7.7
Message-ID: <20130324225136.BE1D39B2B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d10f1bd792041a97b0ac84ce40c9587a82d250c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xapp_xgamma/xapp_xgamma.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
index b755c85..6e2197d 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.mk
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XGAMMA_VERSION = 1.0.4
+XAPP_XGAMMA_VERSION = 1.0.5
 XAPP_XGAMMA_SOURCE = xgamma-$(XAPP_XGAMMA_VERSION).tar.bz2
 XAPP_XGAMMA_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XGAMMA_DEPENDENCIES = xlib_libXxf86vm
