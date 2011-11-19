From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?= <vjaquez@igalia.com>
Date: Sat, 19 Nov 2011 15:31:34 +0100
Subject: [Buildroot] [PATCH] gst-dsp: upgrade to 0.9.0
Message-ID: <1321713094-13396-1-git-send-email-vjaquez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/multimedia/gst-dsp/gst-dsp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-dsp/gst-dsp.mk b/package/multimedia/gst-dsp/gst-dsp.mk
index 17eb189..154ab75 100644
--- a/package/multimedia/gst-dsp/gst-dsp.mk
+++ b/package/multimedia/gst-dsp/gst-dsp.mk
@@ -1,4 +1,4 @@
-GST_DSP_VERSION=0.8.0
+GST_DSP_VERSION=0.9.0
 GST_DSP_SOURCE=gst-dsp-$(GST_DSP_VERSION).tar.gz
 GST_DSP_SITE=http://gst-dsp.googlecode.com/files/
 
-- 
1.7.7.1
