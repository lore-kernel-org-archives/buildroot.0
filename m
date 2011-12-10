From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 10 Dec 2011 22:16:10 +0100
Subject: [Buildroot] [git commit] gst-dsp: Bump to version 0.10.0
Message-ID: <20111210222040.E25ED8F8F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97dad8faa977aafc54e10fc9f750f01ab8634847
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lukasz Pulka <lukasz@oxnet.pl>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
