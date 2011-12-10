From: Lukasz Pulka <lukasz@oxnet.pl>
Date: Sat, 10 Dec 2011 17:58:37 +0100
Subject: [Buildroot] [PATCH] gst-dsp: Bump to version 0.10.0
Message-ID: <1323536317-3531-1-git-send-email-lukasz@oxnet.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Lukasz Pulka <lukasz@oxnet.pl>
---
 package/multimedia/gst-dsp/gst-dsp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-dsp/gst-dsp.mk b/package/multimedia/gst-dsp/gst-dsp.mk
index cd856c1..1e1894d 100644
--- a/package/multimedia/gst-dsp/gst-dsp.mk
+++ b/package/multimedia/gst-dsp/gst-dsp.mk
@@ -1,4 +1,4 @@
-GST_DSP_VERSION = 0.9.0
+GST_DSP_VERSION = 0.10.0
 GST_DSP_SITE = http://gst-dsp.googlecode.com/files/
 
 define GST_DSP_BUILD_CMDS
-- 
1.7.2.5
