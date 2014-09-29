From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 29 Sep 2014 10:08:50 +0100
Subject: [Buildroot] [PATCH v2] opencv: Bump version to 2.4.9.1
Message-ID: <1411981730-49934-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And also add a hash file.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/opencv/opencv.hash |    3 +++
 package/opencv/opencv.mk   |    4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 package/opencv/opencv.hash

diff --git a/package/opencv/opencv.hash b/package/opencv/opencv.hash
new file mode 100644
index 0000000..04cb3c5
--- /dev/null
+++ b/package/opencv/opencv.hash
@@ -0,0 +1,3 @@
+# From https://github.com/itseez/opencv/archive/2.4.9.1/
+md5	f9d8626711a183a8f39ce9822a40f35f	opencv-2.4.9.1.tar.gz
+sha1	adcaf808e4d5d3b394514061d1da3d4352964c7d	opencv-2.4.9.1.tar.gz
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 8c2de79..628624a 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-OPENCV_VERSION = 2.4.8
+OPENCV_VERSION = 2.4.9.1
 OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
 OPENCV_INSTALL_STAGING = YES
 OPENCV_LICENSE = BSD-3c
-OPENCV_LICENSE_FILES = doc/license.txt
+OPENCV_LICENSE_FILES = LICENSE
 
 # OpenCV component options
 OPENCV_CONF_OPT += \
-- 
1.7.1
