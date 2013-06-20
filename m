From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jun 2013 14:51:56 +0200
Subject: [Buildroot] [git commit] gstreamer: update for gstreamer1
Message-ID: <20130620125535.B492C9AF47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4c20a0353acf0440ab6c8e9f6a5d765a61a585e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix long line, trailing space, Gstreamer/GStreamer]
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gstreamer/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index 4b4d80f..d2f99da 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -6,6 +6,9 @@ config BR2_PACKAGE_GSTREAMER
 	help
 	  GStreamer is an open source multimedia framework.
 
+	  This 0.10.x version of GStreamer is incompatible with
+	  GStreamer 1.X.
+
 	  http://gstreamer.freedesktop.org/
 
 config BR2_PACKAGE_GSTREAMER_GST_DEBUG
