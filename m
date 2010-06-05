From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat,  5 Jun 2010 20:03:49 +0200
Subject: [Buildroot] [PATCH 3/4] gstreamer: drop BR2_USE_WCHAR dependency
	(already required by libglib2)
In-Reply-To: <1275761030-20955-1-git-send-email-llandwerlin@gmail.com>
References: <1275761030-20955-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1275761030-20955-4-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/multimedia/gstreamer/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index a3ce859..43c3d90 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_GSTREAMER
 	bool "gstreamer"
-	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GStreamer is an open source multimedia framework.
-- 
1.7.1
