From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 20 Jun 2013 17:07:44 -0500
Subject: [Buildroot] [PATCH v12 09/11] multimedia: reorganize for gst1
In-Reply-To: <1371766066-676-1-git-send-email-spenser@gillilanding.com>
References: <1371766066-676-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1371766066-676-10-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/Config.in |   19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 292d029..925051e 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -5,22 +5,27 @@ source "package/multimedia/bellagio/Config.in"
 source "package/multimedia/faad2/Config.in"
 source "package/multimedia/flac/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
+
+# Gstreamer 0.10.x & Plugins
 source "package/multimedia/gstreamer/Config.in"
-source "package/multimedia/gstreamer1/Config.in"
+source "package/multimedia/gst-plugins-base/Config.in"
+source "package/multimedia/gst-plugins-good/Config.in"
+source "package/multimedia/gst-plugins-bad/Config.in"
+source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/gst-ffmpeg/Config.in"
 source "package/multimedia/gst-dsp/Config.in"
 source "package/multimedia/gst-fsl-plugins/Config.in"
 source "package/multimedia/gst-omapfb/Config.in"
-source "package/multimedia/gst-omx/Config.in"
-source "package/multimedia/gst-plugins-base/Config.in"
+source "package/multimedia/gst-plugin-x170/Config.in"
+
+# Gstreamer 1.x & Plugins
+source "package/multimedia/gstreamer1/Config.in"
 source "package/multimedia/gst1-plugins-base/Config.in"
-source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst1-plugins-good/Config.in"
-source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst1-plugins-bad/Config.in"
-source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/gst1-plugins-ugly/Config.in"
-source "package/multimedia/gst-plugin-x170/Config.in
+source "package/multimedia/gst-omx/Config.in"
+
 source "package/multimedia/lame/Config.in"
 source "package/multimedia/libvpx/Config.in"
 source "package/multimedia/madplay/Config.in"
-- 
1.7.9.5
