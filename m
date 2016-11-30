From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Nov 2016 13:53:18 +0100
Subject: [Buildroot] [git commit] gstreamer1/gst1-validate: bump version to
	1.10.2
Message-ID: <20161201222141.6C4498026C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29969daeb5aa13d9394f2fec2ce662ff96f3763e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index adfb2fa..70b868f 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.10.1.tar.xz.sha256sum
-sha256 07ae671a3e77c5480d2c1732175dd3b3255b6937ac55d4b3e69a90f8e3043f75  gst-validate-1.10.1.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.10.2.tar.xz.sha256sum
+sha256 be274418d78694cecb1be6c860f3f499baa4313eece60a654507ab14d6989ed7  gst-validate-1.10.2.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index cb857d0..69a78bd 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.10.1
+GST1_VALIDATE_VERSION = 1.10.2
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPLv2.1+
