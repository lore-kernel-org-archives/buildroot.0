From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  6 Nov 2012 09:07:52 +0100
Subject: [Buildroot] [PATCH 1/3] xapp_x11perf: bump to 1.5.4
Message-ID: <1352189274-7000-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/x11r7/xapp_x11perf/xapp_x11perf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index d58a45c..33e8628 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_X11PERF_VERSION = 1.5.2
+XAPP_X11PERF_VERSION = 1.5.4
 XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.bz2
 XAPP_X11PERF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_X11PERF_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXft
-- 
1.7.7
