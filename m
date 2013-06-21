From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Jun 2013 16:09:43 +0200
Subject: [Buildroot] [git commit] multimedia: reorganize for gst1
Message-ID: <20130621143542.2772F9B075@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=674c931dec1efec19530a2d46e0c936c5ba42aba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in |   19 ++++++++++++-------
 1 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index e0d5f6a..925051e 100644
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
-source "package/multimedia/gst-plugin-x170/Config.in"
+source "package/multimedia/gst-omx/Config.in"
+
 source "package/multimedia/lame/Config.in"
 source "package/multimedia/libvpx/Config.in"
 source "package/multimedia/madplay/Config.in"
