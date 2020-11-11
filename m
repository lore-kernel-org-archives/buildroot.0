From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 11 Nov 2020 20:51:56 +1300
Subject: [Buildroot] [PATCH] package/gstreamer1/gst1-shark: bump version to
 v0.7.2
Message-ID: <20201111075156.4955-1-judge.packham@gmail.com>
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
index 6f8365cb16..81b0ecae31 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.hash
+++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256 aec7f0bbb81775922da2c94a4f84b64b5efd38a616f0d07eb4c3ddb5770b728d  gst1-shark-v0.7.1.tar.gz
+sha256 24d910c2e7b4c66c804e53e9f3fc18fb61b0d3b82d8580f0fa9c2b1c563e5ab3  gst1-shark-v0.7.2.tar.gz
 
 # Hashes for license files:
 sha256 6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.mk b/package/gstreamer1/gst1-shark/gst1-shark.mk
index 146d1f8456..ea0c5a29cd 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.mk
+++ b/package/gstreamer1/gst1-shark/gst1-shark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_SHARK_VERSION = v0.7.1
+GST1_SHARK_VERSION = v0.7.2
 GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
 GST1_SHARK_SITE_METHOD = git
 GST1_SHARK_GIT_SUBMODULES = YES
-- 
2.29.2
