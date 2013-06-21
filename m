From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Jun 2013 11:00:31 +0200
Subject: [Buildroot] [git commit] Add header to packages where missing
Message-ID: <20130621143539.323C89B075@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23ac7255c89a67d171a16f3ee1d4d160a43a305f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cifs-utils/cifs-utils.mk                   |    6 ++++++
 package/classpath/classpath.mk                     |    6 ++++++
 package/cloop/cloop.mk                             |    6 ++++++
 package/crosstool-ng/crosstool-ng.mk               |    6 ++++++
 package/dsp-tools/dsp-tools.mk                     |    6 ++++++
 package/explorercanvas/explorercanvas.mk           |    6 ++++++
 package/fbgrab/fbgrab.mk                           |    6 ++++++
 package/feh/feh.mk                                 |    6 ++++++
 package/flot/flot.mk                               |    6 ++++++
 package/hiawatha/hiawatha.mk                       |    6 ++++++
 package/igh-ethercat/igh-ethercat.mk               |    6 ++++++
 package/jamvm/jamvm.mk                             |    6 ++++++
 package/jquery-sparkline/jquery-sparkline.mk       |    6 ++++++
 package/jquery-validation/jquery-validation.mk     |    6 ++++++
 package/jquery/jquery.mk                           |    6 ++++++
 package/jsmin/jsmin.mk                             |    6 ++++++
 package/lpc3250loader/lpc3250loader.mk             |    6 ++++++
 package/lttng-babeltrace/lttng-babeltrace.mk       |    6 ++++++
 package/multimedia/gst-dsp/gst-dsp.mk              |    6 ++++++
 package/multimedia/gst-omapfb/gst-omapfb.mk        |    6 ++++++
 .../multimedia/tidsp-binaries/tidsp-binaries.mk    |    6 ++++++
 package/nettle/nettle.mk                           |    6 ++++++
 package/ortp/ortp.mk                               |    6 ++++++
 package/polarssl/polarssl.mk                       |    6 ++++++
 package/rt-tests/rt-tests.mk                       |    6 ++++++
 package/rtai/rtai.mk                               |    6 ++++++
 package/scons/scons.mk                             |    6 ++++++
 package/squashfs/squashfs.mk                       |    6 ++++++
 package/squashfs3/squashfs3.mk                     |    6 ++++++
 .../webrtc-audio-processing.mk                     |    6 ++++++
 30 files changed, 180 insertions(+), 0 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 3e221e8..6f8d651 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# cifs-utils
+#
+################################################################################
+
 CIFS_UTILS_VERSION = 6.0
 CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
diff --git a/package/classpath/classpath.mk b/package/classpath/classpath.mk
index 61a1034..62167aa 100644
--- a/package/classpath/classpath.mk
+++ b/package/classpath/classpath.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# classpath
+#
+################################################################################
+
 CLASSPATH_VERSION = 0.98
 CLASSPATH_SITE = $(BR2_GNU_MIRROR)/classpath
 CLASSPATH_CONF_OPT = \
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index 809e531..1e9b723 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# cloop
+#
+################################################################################
+
 CLOOP_VERSION=2.634-1
 CLOOP_SOURCE=cloop_$(CLOOP_VERSION).tar.gz
 CLOOP_SITE=http://debian-knoppix.alioth.debian.org/packages/sources/cloop
diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index b533396..d3ee5f8 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# crosstool-ng
+#
+################################################################################
+
 CROSSTOOL_NG_VERSION           = 1.18.0
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
index 42aac05..e91c7bc 100644
--- a/package/dsp-tools/dsp-tools.mk
+++ b/package/dsp-tools/dsp-tools.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# dsp-tools
+#
+################################################################################
+
 DSP_TOOLS_VERSION = 2.0
 DSP_TOOLS_SOURCE = dsp-tools-$(DSP_TOOLS_VERSION).tar.gz
 DSP_TOOLS_SITE = http://gst-dsp.googlecode.com/files/
diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
index 968843c..976082a 100644
--- a/package/explorercanvas/explorercanvas.mk
+++ b/package/explorercanvas/explorercanvas.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# explorercanvas
+#
+################################################################################
+
 EXPLORERCANVAS_VERSION = r3
 EXPLORERCANVAS_SITE = http://explorercanvas.googlecode.com/files/
 EXPLORERCANVAS_SOURCE = excanvas_$(EXPLORERCANVAS_VERSION).zip
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index b0b46cb..7645a6b 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# fbgrab
+#
+################################################################################
+
 FBGRAB_VERSION = 1.0
 FBGRAB_SOURCE = fbgrab-$(FBGRAB_VERSION).tar.gz
 FBGRAB_SITE = http://hem.bredband.net/gmogmo/fbgrab
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 97a272d..360d03a 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# feh
+#
+################################################################################
+
 FEH_VERSION = 2.9.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org/
diff --git a/package/flot/flot.mk b/package/flot/flot.mk
index a0ba6c2..dfa6c55 100644
--- a/package/flot/flot.mk
+++ b/package/flot/flot.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# flot
+#
+################################################################################
+
 FLOT_VERSION = 0.8.1
 FLOT_SITE = http://www.flotcharts.org/downloads
 FLOT_LICENSE = MIT
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 3348d53..1ecb0e8 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# hiawatha
+#
+################################################################################
+
 HIAWATHA_VERSION = 9.1
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files
 HIAWATHA_LICENSE = GPLv2
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index a531cab..63bda2f 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# igh-ethercat
+#
+################################################################################
+
 IGH_ETHERCAT_VERSION = 1.5.1
 IGH_ETHERCAT_SITE    = http://etherlab.org/download/ethercat/
 IGH_ETHERCAT_SOURCE  = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
diff --git a/package/jamvm/jamvm.mk b/package/jamvm/jamvm.mk
index 3f05361..34f1b9f 100644
--- a/package/jamvm/jamvm.mk
+++ b/package/jamvm/jamvm.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# jamvm
+#
+################################################################################
+
 JAMVM_VERSION = 1.5.4
 JAMVM_SITE = http://downloads.sourceforge.net/project/jamvm/jamvm/JamVM%20$(JAMVM_VERSION)
 JAMVM_DEPENDENCIES = zlib classpath
diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
index aa6395c..af05045 100644
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# jquery-sparkline
+#
+################################################################################
+
 JQUERY_SPARKLINE_VERSION = 2.1.1
 JQUERY_SPARKLINE_SITE = http://www.omnipotent.net/jquery.sparkline/$(JQUERY_SPARKLINE_VERSION)
 JQUERY_SPARKLINE_SOURCE = jquery.sparkline.min.js
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 423d7f1..71acaff 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# jquery-validation
+#
+################################################################################
+
 JQUERY_VALIDATION_VERSION = 1.11.1
 JQUERY_VALIDATION_SITE = http://jquery.bassistance.de/validate
 JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index 98b325b..44c444b 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# jquery
+#
+################################################################################
+
 JQUERY_VERSION = 1.10.1
 JQUERY_SITE = http://code.jquery.com
 JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index bb65c6c..d511911 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# jsmin
+#
+################################################################################
+
 JSMIN_VERSION = a9b4755
 JSMIN_SITE = http://github.com/douglascrockford/JSMin/tarball/$(JSMIN_VERSION)
 
diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
index 2b9af88..42beb7b 100644
--- a/package/lpc3250loader/lpc3250loader.mk
+++ b/package/lpc3250loader/lpc3250loader.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# lpc3250loader
+#
+################################################################################
+
 HOST_LPC3250LOADER_SITE = git://gitorious.org/lpc3250loader/lpc3250loader.git
 HOST_LPC3250LOADER_VERSION = 1.0
 
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index d3bfc83..2947c35 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# lttng-babeltrace
+#
+################################################################################
+
 LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
 LTTNG_BABELTRACE_VERSION = 1.0.2
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
diff --git a/package/multimedia/gst-dsp/gst-dsp.mk b/package/multimedia/gst-dsp/gst-dsp.mk
index 74b4c98..1fd6976 100644
--- a/package/multimedia/gst-dsp/gst-dsp.mk
+++ b/package/multimedia/gst-dsp/gst-dsp.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# gst-dsp
+#
+################################################################################
+
 GST_DSP_VERSION = 0.10.2
 GST_DSP_SITE = http://gst-dsp.googlecode.com/files/
 
diff --git a/package/multimedia/gst-omapfb/gst-omapfb.mk b/package/multimedia/gst-omapfb/gst-omapfb.mk
index f23bc86..7b8b128 100644
--- a/package/multimedia/gst-omapfb/gst-omapfb.mk
+++ b/package/multimedia/gst-omapfb/gst-omapfb.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# gst-omapfb
+#
+################################################################################
+
 GST_OMAPFB_VERSION=1.0
 GST_OMAPFB_SOURCE=gst-omapfb-$(GST_OMAPFB_VERSION).tar.gz
 GST_OMAPFB_SITE=http://gst-dsp.googlecode.com/files/
diff --git a/package/multimedia/tidsp-binaries/tidsp-binaries.mk b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
index 356baf4..fd799fb 100644
--- a/package/multimedia/tidsp-binaries/tidsp-binaries.mk
+++ b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# tidsp-binaries
+#
+################################################################################
+
 TIDSP_BINARIES_VERSION = 23.i3.8
 TIDSP_BINARIES_SOURCE = tidsp-binaries-$(TIDSP_BINARIES_VERSION).tar.gz
 TIDSP_BINARIES_SITE = http://gst-dsp.googlecode.com/files/
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 131826e..b772d3a 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# nettle
+#
+################################################################################
+
 NETTLE_VERSION = 2.7
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index c4c900a..8983df7 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# ortp
+#
+################################################################################
+
 ORTP_VERSION = 0.20.0
 ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
 ORTP_CONF_OPT = --disable-strict
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 7d7fe3e..0b44dc9 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# polarssl
+#
+################################################################################
+
 POLARSSL_SITE = https://polarssl.org/download
 POLARSSL_VERSION = 1.2.7
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 60f63b5..f574d3a 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# rt-tests
+#
+################################################################################
+
 RT_TESTS_SITE    = http://snapshot.debian.org/archive/debian/20111202T222101Z/pool/main/r/rt-tests/
 RT_TESTS_VERSION = 0.83
 RT_TESTS_SOURCE  = rt-tests_$(RT_TESTS_VERSION).orig.tar.gz
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index be5abb1..c24fa41 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# rtai
+#
+################################################################################
+
 RTAI_VERSION = 3.8.1
 RTAI_SOURCE  = rtai-$(RTAI_VERSION).tar.bz2
 RTAI_SITE    = http://www.rtai.org/RTAI/
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 79fd6b1..c256d5f 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# scons
+#
+################################################################################
+
 SCONS_VERSION = 2.2.0
 SCONS_SOURCE = scons-$(SCONS_VERSION).tar.gz
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index c0485a3..1341402 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# squashfs
+#
+################################################################################
+
 SQUASHFS_VERSION=4.2
 SQUASHFS_SOURCE=squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE=http://downloads.sourceforge.net/projct/squashfs/squashfs/squashfs$(SQUASHFS_VERSION)
diff --git a/package/squashfs3/squashfs3.mk b/package/squashfs3/squashfs3.mk
index e121c51..956dbd6 100644
--- a/package/squashfs3/squashfs3.mk
+++ b/package/squashfs3/squashfs3.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# squashfs3
+#
+################################################################################
+
 SQUASHFS3_VERSION=3.4
 SQUASHFS3_SOURCE=squashfs$(SQUASHFS3_VERSION).tar.gz
 SQUASHFS3_SITE=http://downloads.sourceforge.net/project/squashfs/squashfs/$(SQUASHFS3_VERSION)
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.mk b/package/webrtc-audio-processing/webrtc-audio-processing.mk
index 4fbf8f6..9f76cba 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.mk
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# webrtc-audio-processing
+#
+################################################################################
+
 WEBRTC_AUDIO_PROCESSING_VERSION = 0.1
 WEBRTC_AUDIO_PROCESSING_SOURCE = webrtc-audio-processing-$(WEBRTC_AUDIO_PROCESSING_VERSION).tar.xz
 WEBRTC_AUDIO_PROCESSING_SITE = http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
