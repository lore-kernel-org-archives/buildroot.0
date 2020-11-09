From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 10:29:54 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/gstreamer1/gst1-plugins-bad: fix typo
Message-ID: <20201109092714.4901181327@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83a9d9eb2902c69a8e521b6ccb58e6a62879f44a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
index d4b305f0aa..f53b2901d7 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -88,7 +88,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	  debugging
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY
-	bool "dvdsuboverlay"
+	bool "dvbsuboverlay"
 	help
 	  DVB subtitle renderer plugin
 
