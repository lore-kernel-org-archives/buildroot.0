From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 26 Apr 2019 17:30:43 +0200
Subject: [Buildroot] [PATCH] package/libcamera: bump to version
 ab0188fc8bbb6f397ac3aa11c9377662b7bd88b0
Message-ID: <20190426153043.76466-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build failures due to:
`fatal error: sys/auxv.h: No such file or directory`
have been fixed upstream.

Fixes:
http://autobuild.buildroot.net/results/158/158950190141b4f1b0a3d7813322d3971bb8ba75/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 5ad345f29f..0616bbdf81 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,3 +1,3 @@
-sha256 2c01dc76d98ef257660f8ef3f4f17f042e112b5eca6b364ad615220c96fbd066  libcamera-d5ca33f6c7b0cd1ca20ec5dc7131aeedf1503080.tar.gz
+sha256 cc4630139575dc0ea47899b1ea368fdfc5faf150c20cab5bef150de9f84c558e  libcamera-ab0188fc8bbb6f397ac3aa11c9377662b7bd88b0.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/gnu-gpl-2.0.txt
 sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  licenses/gnu-lgpl-2.1.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 08cbb98020..5e17dd0b93 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = d5ca33f6c7b0cd1ca20ec5dc7131aeedf1503080
+LIBCAMERA_VERSION = ab0188fc8bbb6f397ac3aa11c9377662b7bd88b0
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = udev
 LIBCAMERA_CONF_OPTS = -Dtests=false -Ddocumentation=false
-- 
2.17.1
