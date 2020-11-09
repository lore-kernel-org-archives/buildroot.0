From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 10:28:46 +0100
Subject: [Buildroot] [git commit branch/2020.08.x]
 package/gstreamer1/gst1-plugins-bad: fix typo
Message-ID: <20201109092721.A54DC842A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcecce87f63b226b95c9f2e84299601f64052675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

dvdsub{enc,overlay} -> dvbsub{enc,overlay}

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8d6c60656e8418f7bc2e7e680d761cccc5b5b955)
[Peter: drop dvbsubenc, only added in 1.18.0]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 2029776013..ad9c7bd73c 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -88,7 +88,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	  debugging
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY
-	bool "dvdsuboverlay"
+	bool "dvbsuboverlay"
 	help
 	  DVB subtitle renderer plugin
 
