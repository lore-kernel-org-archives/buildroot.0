From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 15:22:40 +0200
Subject: [Buildroot] [git commit] normalize separator size to 80
Message-ID: <20130727132236.E116D99C90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03882d45b2dbf1ed0be759284d812d5f3cf3e917
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.mk                               |    2 +-
 package/elf2flt/elf2flt.mk                         |    4 ++--
 package/multimedia/gst-omx/gst-omx.mk              |    4 ++--
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |    4 ++--
 .../gst1-plugins-good/gst1-plugins-good.mk         |    4 ++--
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |    4 ++--
 package/multimedia/gstreamer1/gstreamer1.mk        |    4 ++--
 package/ramsmp/ramsmp.mk                           |    4 ++--
 package/ti-gfx/ti-gfx.mk                           |    4 ++--
 package/w_scan/w_scan.mk                           |    4 ++--
 10 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 93fc9fb..306284b 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -1,4 +1,4 @@
-###############################################################################
+################################################################################
 #
 # bind
 #
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index cd1c21d..27dd807 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # elf2flt
 #
-#############################################################
+################################################################################
 
 ELF2FLT_SOURCE =
 HOST_ELF2FLT_SOURCE =
diff --git a/package/multimedia/gst-omx/gst-omx.mk b/package/multimedia/gst-omx/gst-omx.mk
index 1127ed8..4b92584 100644
--- a/package/multimedia/gst-omx/gst-omx.mk
+++ b/package/multimedia/gst-omx/gst-omx.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gst-omx
 #
-#############################################################
+################################################################################
 
 GST_OMX_VERSION = 1.0.0
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
diff --git a/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk b/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
index ac77392..732cddf 100644
--- a/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # gst1-plugins-bad
 #
-###############################################################################
+################################################################################
 
 GST1_PLUGINS_BAD_VERSION = 1.0.8
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
diff --git a/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk b/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
index 23fbd80..614a006 100644
--- a/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # gst1-plugins-good
 #
-###############################################################################
+################################################################################
 
 GST1_PLUGINS_GOOD_VERSION = 1.0.8
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
diff --git a/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 4fcc3d4..c6c927b 100644
--- a/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # gst1-plugins-ugly
 #
-###############################################################################
+################################################################################
 
 GST1_PLUGINS_UGLY_VERSION = 1.0.8
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
diff --git a/package/multimedia/gstreamer1/gstreamer1.mk b/package/multimedia/gstreamer1/gstreamer1.mk
index 1e1564f..d3db119 100644
--- a/package/multimedia/gstreamer1/gstreamer1.mk
+++ b/package/multimedia/gstreamer1/gstreamer1.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gstreamer1
 #
-#############################################################
+################################################################################
 
 GSTREAMER1_VERSION = 1.0.8
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
diff --git a/package/ramsmp/ramsmp.mk b/package/ramsmp/ramsmp.mk
index 7d4eee7..6098376 100644
--- a/package/ramsmp/ramsmp.mk
+++ b/package/ramsmp/ramsmp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ramsmp
 #
-#############################################################
+################################################################################
 
 RAMSMP_VERSION = 3.5.0
 RAMSMP_SITE = http://www.alasir.com/software/ramspeed
diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index 7713990..44a3c1d 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # ti-gfx
 #
-###############################################################################
+################################################################################
 
 TI_GFX_VERSION = 4_09_00_01
 TI_GFX_SO_VERSION = 1.9.2188537
diff --git a/package/w_scan/w_scan.mk b/package/w_scan/w_scan.mk
index d2f3e4a..5ca02b8 100644
--- a/package/w_scan/w_scan.mk
+++ b/package/w_scan/w_scan.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # w_scan
 #
-###############################################################################
+################################################################################
 
 W_SCAN_VERSION              = 20130331
 W_SCAN_SOURCE               = w_scan-$(W_SCAN_VERSION).tar.bz2
