From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 21:13:20 +0100
Subject: [Buildroot] [git commit] gst-omx: bump to version 1.10.3
Message-ID: <20170130201643.1F7B57FFF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=222a3468c91a0a9f35f69e77497dc360c29c821f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index d52b61f..be39ef7 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.10.2.tar.xz.sha256sum
-sha256 c069a9cf775c92f889ca8f3b2fc718e428cd0579b7b805851a960c850a7aa497  gst-omx-1.10.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.10.3.tar.xz.sha256sum
+sha256 dd88451e175df7a6b6f619eff0f43a6078054ec7068787b19faf89af94cdb6e1  gst-omx-1.10.3.tar.xz
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index fcc7058..d55ef5f 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.10.2
+GST_OMX_VERSION = 1.10.3
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
