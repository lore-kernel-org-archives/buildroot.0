From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed,  7 Oct 2009 14:15:24 +0200
Subject: [Buildroot] [PATCH] gst-plugins-good: update to upstream release
	0.10.16
In-Reply-To: <1254917725-19441-2-git-send-email-s.neumann@raumfeld.com>
References: <1254917725-19441-1-git-send-email-s.neumann@raumfeld.com>
	<1254917725-19441-2-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1254917725-19441-3-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 .../gst-plugins-good/gst-plugins-good.mk           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index bd0cb78..4f4861b 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -3,7 +3,7 @@
 # gst-plugins-good
 #
 #############################################################
-GST_PLUGINS_GOOD_VERSION = 0.10.13
+GST_PLUGINS_GOOD_VERSION = 0.10.16
 GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST_PLUGINS_GOOD_LIBTOOL_PATCH = NO
-- 
1.6.0.4
