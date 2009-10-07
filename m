From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed,  7 Oct 2009 14:15:25 +0200
Subject: [Buildroot] [PATCH] gst-plugins-bad: update to upstream release
	0.10.14
In-Reply-To: <1254917725-19441-3-git-send-email-s.neumann@raumfeld.com>
References: <1254917725-19441-1-git-send-email-s.neumann@raumfeld.com>
	<1254917725-19441-2-git-send-email-s.neumann@raumfeld.com>
	<1254917725-19441-3-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1254917725-19441-4-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index b548a43..c6c5fd0 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -3,7 +3,7 @@
 # gst-plugins-bad
 #
 #############################################################
-GST_PLUGINS_BAD_VERSION = 0.10.12
+GST_PLUGINS_BAD_VERSION = 0.10.14
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST_PLUGINS_BAD_LIBTOOL_PATCH = NO
-- 
1.6.0.4
