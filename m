From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Nov 2016 13:53:32 +0100
Subject: [Buildroot] [git commit branch/next] gstreamer1/gst1-imx: bump
	version to 0.12.3
Message-ID: <20161130125525.5CE4781E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f29cc436b24a8007b065253babe27b9346a479e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-imx/gst1-imx.hash | 2 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/gst1-imx.hash b/package/gstreamer1/gst1-imx/gst1-imx.hash
index d345deb..b0124aa 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.hash
+++ b/package/gstreamer1/gst1-imx/gst1-imx.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 a75f8bc3219fa3c62637f443cef0196c9eafb90aaa5af094847d007124895822  gst1-imx-0.12.2.tar.gz
+sha256 a75f8bc3219fa3c62637f443cef0196c9eafb90aaa5af094847d007124895822  gst1-imx-0.12.3.tar.gz
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index 3c6b1b6..71b4e1e 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_IMX_VERSION = 0.12.2
+GST1_IMX_VERSION = 0.12.3
 GST1_IMX_SITE = $(call github,Freescale,gstreamer-imx,$(GST1_IMX_VERSION))
 
 GST1_IMX_LICENSE = LGPLv2+
