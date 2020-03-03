From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  3 Mar 2020 17:55:59 +0100
Subject: [Buildroot] [PATCH/next v1] package/gstreamer1: update tools comment
Message-ID: <20200303165559.19163-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add missing tools (gst-stats, gst-typefind)
- order alphabetically

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gstreamer1/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
index e9f1bd038a..617dd9af1c 100644
--- a/package/gstreamer1/gstreamer1/Config.in
+++ b/package/gstreamer1/gstreamer1/Config.in
@@ -51,10 +51,11 @@ config BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY
 	  increase the launch-time for a GStreamer application.
 
 config BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS
-	bool "install gst-launch & gst-inspect"
+	bool "install gst-inspect & gst-launch & gst-stats & gst-typefind"
 	default y
 	help
-	  Install the gst-launch and gst-inspect tools. This will take
-	  up additional space on the target.
+	  Install the gst-inspect, gst-launch, gst-stats and
+	  gst-typefind tools. This will take up additional space on
+	   the target.
 
 endif
-- 
2.25.1
