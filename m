From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 7 Oct 2009 14:52:19 +0200
Subject: [Buildroot] [git commit master] gst-plugins-bad: update to upstream
	release 0.10.14
Message-ID: <20091007125248.26DA577707@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=51eb574a57c46f5936da9ffd32d244f456db348f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.6.3.3
