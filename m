From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri,  4 Sep 2020 10:51:47 +0100
Subject: [Buildroot] [PATCH 3/3] package/libcamera: bump version to e59713c6
In-Reply-To: <20200904095148.844292-1-kieran.bingham@ideasonboard.com>
References: <20200904095148.844292-1-kieran.bingham@ideasonboard.com>
Message-ID: <20200904095148.844292-4-kieran.bingham@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 676d3ac73907..bc9122315166 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  55b7d7e5d8c70b2586b31544e6c4891a994c4e69c18d0ebd760e87b75277c348  libcamera-565f95d64ff92e8712e8090988180c343dd3bcb5.tar.gz
+sha256	a7800b54584dee321874610ef70b1b7690c79d8340c5b134ea35176657681e29  libcamera-e59713c68678f3eb6b6ebe97cabdc88c7042567f.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 4a4bc4ea90aa..e6cd71420774 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = 565f95d64ff92e8712e8090988180c343dd3bcb5
+LIBCAMERA_VERSION = e59713c68678f3eb6b6ebe97cabdc88c7042567f
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
-- 
2.25.1
