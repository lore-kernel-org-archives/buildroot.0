From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 19 Jun 2013 23:14:01 -0500
Subject: [Buildroot] [PATCH v11 02/11] gstreamer: update for gstreamer1
In-Reply-To: <1371701651-7739-1-git-send-email-spenser@gillilanding.com>
References: <1371701651-7739-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1371701651-7739-3-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/gstreamer/Config.in |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index 4b4d80f..44c96e4 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -4,7 +4,8 @@ config BR2_PACKAGE_GSTREAMER
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBGLIB2
 	help
-	  GStreamer is an open source multimedia framework.
+	  GStreamer is an open source multimedia framework. This 0.10.x version of
+	  Gstreamer is incompatible with Gstreamer 1.X. 
 
 	  http://gstreamer.freedesktop.org/
 
-- 
1.7.9.5
