From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri,  7 Jun 2013 18:18:52 -0500
Subject: [Buildroot] [PATCH v10 07/13] gstreamer: update Config.in with
	gstreamer1 info.
In-Reply-To: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
References: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370647138-26623-8-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the gstreamer1 Config.in with note about Gstreamer 0.1X being
incompatible with gstreamer 1.X.
---
 package/multimedia/gstreamer/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index 4b4d80f..55fd016 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -4,7 +4,8 @@ config BR2_PACKAGE_GSTREAMER
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBGLIB2
 	help
-	  GStreamer is an open source multimedia framework.
+	  GStreamer is an open source multimedia framework. This 0.1x version of
+	  Gstreamer is incompatible with Gstreamer 1.X. 
 
 	  http://gstreamer.freedesktop.org/
 
-- 
1.7.1
