From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Oct 2014 20:57:06 +0200
Subject: [Buildroot] [git commit] opencv: Bump version to 2.4.10
Message-ID: <20141002190411.7CDBC9D803@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14a97e945012b080ac97db45596fb122322c43b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv/opencv.hash |    6 +++---
 package/opencv/opencv.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/opencv/opencv.hash b/package/opencv/opencv.hash
index 04cb3c5..fc3b750 100644
--- a/package/opencv/opencv.hash
+++ b/package/opencv/opencv.hash
@@ -1,3 +1,3 @@
-# From https://github.com/itseez/opencv/archive/2.4.9.1/
-md5	f9d8626711a183a8f39ce9822a40f35f	opencv-2.4.9.1.tar.gz
-sha1	adcaf808e4d5d3b394514061d1da3d4352964c7d	opencv-2.4.9.1.tar.gz
+# From https://github.com/itseez/opencv/archive/2.4.10/
+md5	3346a59310d788d3845f4fd6043a108a	opencv-2.4.10.tar.gz
+sha1	a0c2d5944364fc4f26b6160b33c03082b1fa08c1	opencv-2.4.10.tar.gz
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 628624a..5d3993b 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV_VERSION = 2.4.9.1
+OPENCV_VERSION = 2.4.10
 OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
 OPENCV_INSTALL_STAGING = YES
 OPENCV_LICENSE = BSD-3c
