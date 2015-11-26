From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:38:34 +0100
Subject: [Buildroot] [git commit] gst-plugins-base: add legal info
Message-ID: <20151126214030.329467FB04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f35b108b1eaaa736fa6da3c4a50d309dfda6a2c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gstreamer/gst-plugins-base/gst-plugins-base.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
index 08733d1..e1374ed 100644
--- a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
+++ b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
@@ -8,6 +8,8 @@ GST_PLUGINS_BASE_VERSION = 0.10.36
 GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.xz
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
+GST_PLUGINS_BASE_LICENSE = GPLv2+, LGPLv2+
+GST_PLUGINS_BASE_LICENSE_FILES = COPYING COPYING.LIB
 
 # freetype is only used by examples, but if it is not found
 # and the host has a freetype-config script, then the host
