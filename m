From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Nov 2011 16:00:32 +0100
Subject: [Buildroot] [git commit branch/next] gst-dsp: upgrade to 0.9.0
Message-ID: <20111119150212.EE02F8F5F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e993877714fd8381dbfbb39fdea36583ffc7ffc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Peter: fix white space while we're at it]
Signed-off-by: V??ctor Manuel J??quez Leal <vjaquez@igalia.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-dsp/gst-dsp.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/multimedia/gst-dsp/gst-dsp.mk b/package/multimedia/gst-dsp/gst-dsp.mk
index 17eb189..cd856c1 100644
--- a/package/multimedia/gst-dsp/gst-dsp.mk
+++ b/package/multimedia/gst-dsp/gst-dsp.mk
@@ -1,6 +1,5 @@
-GST_DSP_VERSION=0.8.0
-GST_DSP_SOURCE=gst-dsp-$(GST_DSP_VERSION).tar.gz
-GST_DSP_SITE=http://gst-dsp.googlecode.com/files/
+GST_DSP_VERSION = 0.9.0
+GST_DSP_SITE = http://gst-dsp.googlecode.com/files/
 
 define GST_DSP_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
