From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 23:27:26 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/gst1-libav: bump
 version to 1.18.4
Message-ID: <20210324220719.B8E2E890DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1edd82f04f64e0dd39813a4c2090dd77a4d06cc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 75f3adff9482a7a181ed792ba5f2744aa67a6b89)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index dcb99fb632..632c2f8651 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.18.3.tar.xz.sha256sum
-sha256  ad20546bcd78ac1e7cf194666d73c4f33efeb62647d2b6af22993b540699e91c  gst-libav-1.18.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.18.4.tar.xz.sha256sum
+sha256  344a463badca216c2cef6ee36f9510c190862bdee48dc4591c0a430df7e8c396  gst-libav-1.18.4.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 6ec4f3cd65..8ae5b87beb 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.18.3
+GST1_LIBAV_VERSION = 1.18.4
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_LICENSE = LGPL-2.0+
