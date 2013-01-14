From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 14:07:45 +0100
Subject: [Buildroot] [git commit] gst-plugins-bad: sort suboptions
	alphabetically
Message-ID: <20130114132041.315A982B33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae3e9e05de56a620165653b6c31710e717b60806
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-bad/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 9dd2daa..2a386f2 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -82,12 +82,12 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FIELDANALYSIS
 	bool "fieldanalysis"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE
-	bool "freeze"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEVERB
 	bool "freeverb"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE
+	bool "freeze"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREI0R
 	bool "frei0r"
 
@@ -211,12 +211,12 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SMOOTH
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SPEED
 	bool "speed"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SUBENC
-	bool "subenc"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_STEREO
 	bool "stereo"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SUBENC
+	bool "subenc"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TTA
 	bool "tta"
 
