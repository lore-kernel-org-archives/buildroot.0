From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 22:32:23 +0200
Subject: [Buildroot] [git commit] gst-omx: bump to 1.12.3
Message-ID: <20171010202508.897448111D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=471b1409d71cf80ae2566f076fa4e424c975ad55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 17ebf1d..ec3f31d 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.2.tar.xz.sha256sum
-sha256 1b22398f45a027e977d2b5309625ec91cdcaf0da8751cbc7f596d639a45ba298 gst-omx-1.12.2.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.3.tar.xz.sha256sum
+sha256 eef5de8bab1bb495bfbc9d16af9837d7f55b47cb6b97819b3152c5899c85843c gst-omx-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 2805c9a..9843149 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.12.2
+GST_OMX_VERSION = 1.12.3
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
