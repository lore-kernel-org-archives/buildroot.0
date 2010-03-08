From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xbitmaps to 1.1.0
Message-ID: <20100308133640.3F0AC776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a6c937a793ff9b527bf1c62e8d555227fd3b5e84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdata_xbitmaps/Config.in         |    2 +-
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdata_xbitmaps/Config.in b/package/x11r7/xdata_xbitmaps/Config.in
index f3bb58c..cfadd9c 100644
--- a/package/x11r7/xdata_xbitmaps/Config.in
+++ b/package/x11r7/xdata_xbitmaps/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XDATA_XBITMAPS
 	bool "xbitmaps"
 	help
-	  xbitmaps 1.0.1
+	  xbitmaps 1.1.0
 	  No description available
diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
index 9303b8c..c1bb301 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDATA_XBITMAPS_VERSION = 1.0.1
+XDATA_XBITMAPS_VERSION = 1.1.0
 XDATA_XBITMAPS_SOURCE = xbitmaps-$(XDATA_XBITMAPS_VERSION).tar.bz2
 XDATA_XBITMAPS_SITE = http://xorg.freedesktop.org/releases/individual/data
 XDATA_XBITMAPS_AUTORECONF = NO
-- 
1.6.3.3
