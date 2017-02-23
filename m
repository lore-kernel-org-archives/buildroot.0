From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:53:48 +0100
Subject: [Buildroot] [git commit] gst-omx: bump to version 1.10.4
Message-ID: <20170223215424.88B8282257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bffdf2a1a478fc84cdf7ba124b8859cacd11843
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index be39ef7..dff9840 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.10.3.tar.xz.sha256sum
-sha256 dd88451e175df7a6b6f619eff0f43a6078054ec7068787b19faf89af94cdb6e1  gst-omx-1.10.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.10.4.tar.xz.sha256sum
+sha256 45072925cf262f0fd528fab78f0de52734e46a5a88aa802fae51c67c09c81aa2  gst-omx-1.10.4.tar.xz
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index d55ef5f..6ce7baa 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.10.3
+GST_OMX_VERSION = 1.10.4
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
