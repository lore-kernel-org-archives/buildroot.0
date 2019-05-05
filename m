From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 May 2019 23:55:11 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: fix check-package warning
Message-ID: <20190505215043.9F8CF814B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=950e081f8f8504cc8df751177746b817010ce548
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Order is type, depends, select.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f1866609c9..a32cbcb6f2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -155,8 +155,8 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
 	  to gst1-plugins-base.
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA
-	select BR2_LEGACY
 	bool "gst-plugins-bad IQA option was removed"
+	select BR2_LEGACY
 	help
 	  The gst1-plugins-bad IQA option was removed.
 
