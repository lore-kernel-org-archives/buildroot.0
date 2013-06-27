From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 21:33:50 +0200
Subject: [Buildroot] [git commit] gst-omx: fix _LICENSE_FILES tag
Message-ID: <20130627193621.D63EA9A9D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6940ade836c1355bcb99ebc1762902936b8ac464
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is <pkg>_LICENSE_FILES, not <pkg>_LICENSE_FILE.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-omx/gst-omx.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-omx/gst-omx.mk b/package/multimedia/gst-omx/gst-omx.mk
index 00abecb..1127ed8 100644
--- a/package/multimedia/gst-omx/gst-omx.mk
+++ b/package/multimedia/gst-omx/gst-omx.mk
@@ -9,7 +9,7 @@ GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = http://gstreamer.freedesktop.org/src/gst-omx/
 
 GST_OMX_LICENSE = LGPLv2.1
-GST_OMX_LICENSE_FILE = COPYING
+GST_OMX_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 GST_OMX_CONF_OPT = \
