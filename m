From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 May 2019 21:31:36 +0200
Subject: [Buildroot] [git commit] package/gst1-shark: bump version to 0.6.0
Message-ID: <20190506193013.93E9483A4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6ca40b814e9153f8bc626facb2254c86f794511
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-shark/gst1-shark.hash | 2 +-
 package/gstreamer1/gst1-shark/gst1-shark.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
index fdcbc563a8..dbf394e3d8 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.hash
+++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256 35c56b89c10f42c623f5831f9533e1b9dcab8946eff0e4000bf3137bad5c705a  gst1-shark-v0.5.5.tar.gz
+sha256 320411ec78966c5c57ca2f595efac6e88dd4d46433b2f62562025d57498a5f29  gst1-shark-v0.6.0.tar.gz
 
 # Hashes for license files:
 sha256 6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.mk b/package/gstreamer1/gst1-shark/gst1-shark.mk
index 1e198f0cdd..cdf3145429 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.mk
+++ b/package/gstreamer1/gst1-shark/gst1-shark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_SHARK_VERSION = v0.5.5
+GST1_SHARK_VERSION = v0.6.0
 GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
 GST1_SHARK_SITE_METHOD = git
 GST1_SHARK_GIT_SUBMODULES = YES
