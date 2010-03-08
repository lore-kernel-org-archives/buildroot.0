From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump x11perf to 1.5.1
Message-ID: <20100308133643.B299A7774C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e2ed22e256ffe7d6d127553ab04dc7680a5edebe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_x11perf/Config.in       |    2 +-
 package/x11r7/xapp_x11perf/xapp_x11perf.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_x11perf/Config.in b/package/x11r7/xapp_x11perf/Config.in
index 15621f2..860a9c9 100644
--- a/package/x11r7/xapp_x11perf/Config.in
+++ b/package/x11r7/xapp_x11perf/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XAPP_X11PERF
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXFT
 	help
-	  x11perf 1.4.1
+	  x11perf 1.5.1
 	  summarize x11perf results
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index d2e9f1c..ac8cd7a 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_X11PERF_VERSION = 1.5
+XAPP_X11PERF_VERSION = 1.5.1
 XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.bz2
 XAPP_X11PERF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_X11PERF_AUTORECONF = NO
-- 
1.6.3.3
