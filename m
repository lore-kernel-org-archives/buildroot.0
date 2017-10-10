From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 22:32:23 +0200
Subject: [Buildroot] [git commit] gst1-vaapi: bump to 1.12.3
Message-ID: <20171010202508.5CA4C8111D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1e25939aef630d2f3675f2f594bc908df8f12ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 11f25cf..1ffa5a9 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.2.tar.xz.sha256sum
-sha256 23c714e0474b3c7ae6ff8884aebf8503a1bc3ded335fa2d2b2ac31788466163a gstreamer-vaapi-1.12.2.tar.xz
+From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.3.tar.xz.sha256sum
+sha256 f4cdafd8fd9606a490917c8b67336e835df1219580d55421c70480fd0913744d gstreamer-vaapi-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index e212ae9..9783c59 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.12.2
+GST1_VAAPI_VERSION = 1.12.3
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
