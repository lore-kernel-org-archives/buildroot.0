From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 23:51:22 +0200
Subject: [Buildroot] [git commit] opencv: add license information
Message-ID: <20140708222428.014AE9D1CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b21f0545fa52c30b5a9af987a6d5031f367701ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv/opencv.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 3fcba80..464a95a 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -5,9 +5,11 @@
 ################################################################################
 
 OPENCV_VERSION = 2.4.2
-OPENCV_SITE    = http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
-OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
+OPENCV_SITE = http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
+OPENCV_SOURCE = OpenCV-$(OPENCV_VERSION).tar.bz2
 OPENCV_INSTALL_STAGING = YES
+OPENCV_LICENSE = BSD-3c
+OPENCV_LICENSE_FILES = doc/license.txt
 
 OPENCV_CONF_OPT += \
 	-DBUILD_WITH_STATIC_CRT=OFF                                  \
