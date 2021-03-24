From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 23:29:13 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/gst-omx: bump
 version to 1.18.4
Message-ID: <20210324220719.EA34481384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b72b86d2e5146fe53f69dc9039cab942c31ca43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 953ccbcc963b0e71b73b1cbf6b23b36d9358261e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 0615e06a87..ceeaf4e57f 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.3.tar.xz.sha256sum
-sha256  ed0f26504e9a60e15055134410f156e40952336410f2a59bdbbda45e61e8b93f  gst-omx-1.18.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.4.tar.xz.sha256sum
+sha256  e35051cf891eb2f31d6fcf176ff37d985f97f33874ac31b0b3ad3b5b95035043  gst-omx-1.18.4.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index bd40452931..36a05be6b6 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.18.3
+GST_OMX_VERSION = 1.18.4
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
