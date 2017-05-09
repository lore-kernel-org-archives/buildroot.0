From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 9 May 2017 18:21:11 +0100
Subject: [Buildroot] [PATCH next 03/11] gst-omx: bump version to 1.12.0
In-Reply-To: <20170509172119.33642-1-Vincent.Riera@imgtec.com>
References: <20170509172119.33642-1-Vincent.Riera@imgtec.com>
Message-ID: <20170509172119.33642-3-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index dff9840..8c6d1e9 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.10.4.tar.xz.sha256sum
-sha256 45072925cf262f0fd528fab78f0de52734e46a5a88aa802fae51c67c09c81aa2  gst-omx-1.10.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.0.tar.xz.sha256sum
+sha256 acee8c8a88b995fb95601b7b43bf0c83f502d9026bca5705f9c0dc44a757997e  gst-omx-1.12.0.tar.xz
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 10dbe05..2800592 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.10.4
+GST_OMX_VERSION = 1.12.0
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.10.2
