From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 23 Apr 2019 22:22:43 +0200
Subject: [Buildroot] [PATCH v1] package/gst1-interpipe: bump version to
 9af5b40
Message-ID: <20190423202243.29123-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash | 2 +-
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index b9b1c5e429..0ce6ad460d 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256 3f8cc5cf4861e5836938c66415b47555550c93b06b1bc9faed83e89bacf705cf gst1-interpipe-10dba89eecc200e49f0b432e299f1c8a4312b657.tar.gz
+sha256 6dc2c9d5ff4c3777d40712199a0cafa6bc0058327bca5a20e31d743a46e1ad21 gst1-interpipe-9af5b40d106f35ce75f8baa5efc8c59fc5f7eda1.tar.gz

 # Hashes for license files:
 sha256 16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5 COPYING
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
index 8f810f9cf1..87e5f2e5d2 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-GST1_INTERPIPE_VERSION = 10dba89eecc200e49f0b432e299f1c8a4312b657
+GST1_INTERPIPE_VERSION = 9af5b40d106f35ce75f8baa5efc8c59fc5f7eda1
 GST1_INTERPIPE_SITE = https://github.com/RidgeRun/gst-interpipe
 GST1_INTERPIPE_SITE_METHOD = git
 # fetch gst-interpipe/common sub module
--
2.21.0
