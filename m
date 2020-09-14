From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 14 Sep 2020 20:58:31 +1200
Subject: [Buildroot] [PATCH 3/3] gst1-shark: Bump verison to v0.7.1
In-Reply-To: <20200914085831.25302-1-judge.packham@gmail.com>
References: <20200914085831.25302-1-judge.packham@gmail.com>
Message-ID: <20200914085831.25302-3-judge.packham@gmail.com>
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
index 6bf4739abc..6f8365cb16 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.hash
+++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256 3c1f865533750f9fe511336e673e89bc93ac05e896bd3f4fc68d3cc0c142a861  gst1-shark-v0.6.1.tar.gz
+sha256 aec7f0bbb81775922da2c94a4f84b64b5efd38a616f0d07eb4c3ddb5770b728d  gst1-shark-v0.7.1.tar.gz
 
 # Hashes for license files:
 sha256 6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.mk b/package/gstreamer1/gst1-shark/gst1-shark.mk
index 6dc702b482..146d1f8456 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.mk
+++ b/package/gstreamer1/gst1-shark/gst1-shark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_SHARK_VERSION = v0.6.1
+GST1_SHARK_VERSION = v0.7.1
 GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
 GST1_SHARK_SITE_METHOD = git
 GST1_SHARK_GIT_SUBMODULES = YES
-- 
2.28.0
