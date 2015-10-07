From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  7 Oct 2015 23:30:02 +0200
Subject: [Buildroot] [PATCH v1 4/7] gst1-plugins-bad: bump version to 1.6.0
In-Reply-To: <1444253405-3994-1-git-send-email-ps.report@gmx.net>
References: <1444253405-3994-1-git-send-email-ps.report@gmx.net>
Message-ID: <1444253405-3994-4-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index d2322d3..9f40048 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-December/050904.html
-sha256	152fad7250683d72f9deb36c5685428338365fe4a4c87ffe15e38783b14f983c  gst-plugins-bad-1.4.5.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.6.0.tar.xz.sha256sum
+sha256	d8ff26128d4ecd2ffeb28e14843808d2d971b09056b7cee6f08afcae01fc0f49  gst-plugins-bad-1.6.0.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ee936fe..2fbd49b 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.4.5
+GST1_PLUGINS_BAD_VERSION = 1.6.0
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.1.4
