From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Nov 2020 09:56:01 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: fix
 typo
Message-ID: <20201104084449.491A6812EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d6c60656e8418f7bc2e7e680d761cccc5b5b955
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dvdsub{enc,overlay} -> dvbsub{enc,overlay}

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 305e0fda2f..191820df1d 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -88,12 +88,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	  debugging
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBENC
-	bool "dvdsubenc"
+	bool "dvbsubenc"
 	help
 	  DVB subpicture encoding support
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY
-	bool "dvdsuboverlay"
+	bool "dvbsuboverlay"
 	help
 	  DVB subtitle renderer plugin
 
