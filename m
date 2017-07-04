From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 12:14:29 +0200
Subject: [Buildroot] [git commit] gst1-plugins-good: bump version to 1.12.0
Message-ID: <20170704113142.046C180526@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adc4787410c994477ccf906a306b631395dde335
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove non-existant configure options:

  --disable-esd, --disable-esdtest:
  https://github.com/GStreamer/gst-plugins-good/commit/3d6955d68624c089d7066bfdbf38ef69c1dc07b6

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 21ee18d..ef9f757 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.10.4.tar.xz.sha256sum
-sha256 8a86c61434a8c44665365bd0b3557a040937d1f44bf69caee4e9ea816ce74d7e  gst-plugins-good-1.10.4.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.12.0.tar.xz.sha256sum
+sha256 8a1d734db7338e00c28b794a7f0a5a9e67d1c5c8b0074075b50638207d372ebc  gst-plugins-good-1.12.0.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 6bf159d..febb141 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.10.4
+GST1_PLUGINS_GOOD_VERSION = 1.12.0
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
@@ -20,9 +20,7 @@ GST1_PLUGINS_GOOD_CONF_OPTS = \
 	--disable-osx_video \
 	--disable-aalib \
 	--disable-aalibtest \
-	--disable-libcaca \
-	--disable-esd \
-	--disable-esdtest
+	--disable-libcaca
 
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_GOOD_CONF_OPTS += \
