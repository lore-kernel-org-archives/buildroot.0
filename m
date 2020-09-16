From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 16 Sep 2020 21:49:21 +0200
Subject: [Buildroot] [RFC v1 01/13] package/gst1-interpipe: bump version to
 94dea52 (1.1.2)
Message-ID: <20200916194933.24921-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash | 4 ++--
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index 0ce6ad460d..4764611487 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256 6dc2c9d5ff4c3777d40712199a0cafa6bc0058327bca5a20e31d743a46e1ad21 gst1-interpipe-9af5b40d106f35ce75f8baa5efc8c59fc5f7eda1.tar.gz
+sha256  4b0d8c5fabe1705ba92ac8409d7d138429df5874ba196101cdd1871936719b1a  gst1-interpipe-94dea528dc9e2d0df02fdf2114deecfef6a23740.tar.gz
 
 # Hashes for license files:
-sha256 16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5 COPYING
+sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
index 87e5f2e5d2..92e2bb38fc 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_INTERPIPE_VERSION = 9af5b40d106f35ce75f8baa5efc8c59fc5f7eda1
+GST1_INTERPIPE_VERSION = 94dea528dc9e2d0df02fdf2114deecfef6a23740
 GST1_INTERPIPE_SITE = https://github.com/RidgeRun/gst-interpipe
 GST1_INTERPIPE_SITE_METHOD = git
 # fetch gst-interpipe/common sub module
-- 
2.28.0
