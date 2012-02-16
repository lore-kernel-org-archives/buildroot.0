From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 16 Feb 2012 22:11:27 +0100
Subject: [Buildroot] [git commit] gst-dsp: bump version for DSP_API=2 bugfix
Message-ID: <20120216211333.A8AE090AC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5207e68a8c73f57f0a8cddc09239f5d85a2c5420
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-dsp/gst-dsp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-dsp/gst-dsp.mk b/package/multimedia/gst-dsp/gst-dsp.mk
index b79ccf1..9682962 100644
--- a/package/multimedia/gst-dsp/gst-dsp.mk
+++ b/package/multimedia/gst-dsp/gst-dsp.mk
@@ -1,4 +1,4 @@
-GST_DSP_VERSION = 0.10.1
+GST_DSP_VERSION = 0.10.2
 GST_DSP_SITE = http://gst-dsp.googlecode.com/files/
 
 define GST_DSP_BUILD_CMDS
