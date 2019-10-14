From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 14 Oct 2019 21:19:40 +1300
Subject: [Buildroot] [PATCH] package/gst1-shark: bump version to 0.6.1
Message-ID: <20191014081940.10949-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/gstreamer1/gst1-shark/gst1-shark.hash | 2 +-
 package/gstreamer1/gst1-shark/gst1-shark.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
index dbf394e3d8..6bf4739abc 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.hash
+++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256 320411ec78966c5c57ca2f595efac6e88dd4d46433b2f62562025d57498a5f29  gst1-shark-v0.6.0.tar.gz
+sha256 3c1f865533750f9fe511336e673e89bc93ac05e896bd3f4fc68d3cc0c142a861  gst1-shark-v0.6.1.tar.gz
 
 # Hashes for license files:
 sha256 6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.mk b/package/gstreamer1/gst1-shark/gst1-shark.mk
index cdf3145429..6dc702b482 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.mk
+++ b/package/gstreamer1/gst1-shark/gst1-shark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_SHARK_VERSION = v0.6.0
+GST1_SHARK_VERSION = v0.6.1
 GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
 GST1_SHARK_SITE_METHOD = git
 GST1_SHARK_GIT_SUBMODULES = YES
-- 
2.23.0
