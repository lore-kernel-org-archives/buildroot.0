From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 May 2017 11:18:04 +0100
Subject: [Buildroot] [PATCH v2 next 08/11] gst1-plugins-good: bump version
	to 1.12.0
In-Reply-To: <20170512101807.42378-1-Vincent.Riera@imgtec.com>
References: <20170512101807.42378-1-Vincent.Riera@imgtec.com>
Message-ID: <20170512101807.42378-8-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove non-existant configure options:

  --disable-esd, --disable-esdtest:
  https://github.com/GStreamer/gst-plugins-good/commit/3d6955d68624c089d7066bfdbf38ef69c1dc07b6

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
- Nothing.
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
-- 
2.10.2
