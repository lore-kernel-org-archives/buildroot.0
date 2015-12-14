From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Dec 2015 17:55:57 +0100
Subject: [Buildroot] [git commit] gst1-plugins-base: comma separate licenses
Message-ID: <20151214165601.046248177C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3098ba4f959ce7e223d67ae3f00bc59ef57c074
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 3321274..00e1be7 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -9,7 +9,7 @@ GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
 GST1_PLUGINS_BASE_LICENSE_FILES = COPYING.LIB
-GST1_PLUGINS_BASE_LICENSE = LGPLv2+ LGPLv2.1+
+GST1_PLUGINS_BASE_LICENSE = LGPLv2+, LGPLv2.1+
 
 # freetype is only used by examples, but if it is not found
 # and the host has a freetype-config script, then the host
