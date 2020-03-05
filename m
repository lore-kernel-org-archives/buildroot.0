From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 23:35:33 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gstreamer1: update
 tools comment
Message-ID: <20200305222325.48FB98E8A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d161108ba9035eac2aae32fbdfa5748c6419bb73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tools option installs more than gst-launch and gst-inspect, so
simplify its prompt to just "install tools", and update the Config.in
help text. While at it, we list them alphabetically.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gstreamer1/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
index e9f1bd038a..0626bcc96d 100644
--- a/package/gstreamer1/gstreamer1/Config.in
+++ b/package/gstreamer1/gstreamer1/Config.in
@@ -51,10 +51,11 @@ config BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY
 	  increase the launch-time for a GStreamer application.
 
 config BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS
-	bool "install gst-launch & gst-inspect"
+	bool "install tools"
 	default y
 	help
-	  Install the gst-launch and gst-inspect tools. This will take
-	  up additional space on the target.
+	  Install the gst-inspect, gst-launch, gst-stats and
+	  gst-typefind tools. This will take up additional space on
+	  the target.
 
 endif
