From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Nov 2016 06:58:39 -0300
Subject: [Buildroot] [PATCH 13/14] gst-omx: bump to version 1.10.0
In-Reply-To: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
References: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1478167120-3285-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 40d5197..653c93c 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,2 +1,2 @@
-# locally computed
-sha256  0b4874961e6488ad9e5808114bd486ea981c540907262caab1419355fd82d745  gst-omx-1.2.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/
+sha256  89f7da36abcf278200f561fa9d8d7042ad1459aa211cdc81c4c1a3d2162e9e7f  gst-omx-1.10.0.tar.xz
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 4ca4416..f0b39c9 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.2.0
+GST_OMX_VERSION = 1.10.0
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.7.3
