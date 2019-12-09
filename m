From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Dec 2019 22:44:15 +0100
Subject: [Buildroot] [git commit] gst1-plugins-bad: bump version to 1.16.2
Message-ID: <20191209213716.8525388FFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4966c8bbd71f9a0bac9cb1b99070278707dbbdcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 4d434e6047..7b59b4dbec 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.16.1.tar.xz.sha256sum
-sha256 56481c95339b8985af13bac19b18bc8da7118c2a7d9440ed70e7dcd799c2adb5 gst-plugins-bad-1.16.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.16.2.tar.xz.sha256sum
+sha256 f1cb7aa2389569a5343661aae473f0a940a90b872001824bc47fa8072a041e74 gst-plugins-bad-1.16.2.tar.xz
 sha256 0b12e4d1cd5db5f8a0c04fc98a1d8c3acc533097b6198d6644420da78d460223 COPYING
 sha256 cf9b86bcf2d298e8cf5b9d8982f9dab296465b002fdfa0347357a0732f961e03 COPYING.LIB
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index b611b33eb3..1d4ba62bd2 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.16.1
+GST1_PLUGINS_BAD_VERSION = 1.16.2
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
