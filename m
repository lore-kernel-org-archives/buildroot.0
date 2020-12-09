From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  9 Dec 2020 22:27:15 +0100
Subject: [Buildroot] [PATCH v1 13/14] package/gst1-interpipe: bump version
 to v1.1.3
In-Reply-To: <20201209212716.15472-1-ps.report@gmx.net>
References: <20201209212716.15472-1-ps.report@gmx.net>
Message-ID: <20201209212716.15472-13-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change to use git tag instead of commit hash value

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash | 2 +-
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index 4764611487..ec93e4e752 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  4b0d8c5fabe1705ba92ac8409d7d138429df5874ba196101cdd1871936719b1a  gst1-interpipe-94dea528dc9e2d0df02fdf2114deecfef6a23740.tar.gz
+sha256  2fc8dcbe84f3968ee31d724f8a44e078bb5338682d97e4b5ddfc4bfa2d04ab5f  gst1-interpipe-v1.1.3.tar.gz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
index 9d3402d02b..cc4bc6e948 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_INTERPIPE_VERSION = 94dea528dc9e2d0df02fdf2114deecfef6a23740
+GST1_INTERPIPE_VERSION = v1.1.3
 GST1_INTERPIPE_SITE = https://github.com/RidgeRun/gst-interpipe
 GST1_INTERPIPE_SITE_METHOD = git
 # fetch gst-interpipe/common sub module
-- 
2.29.2
