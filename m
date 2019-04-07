From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  7 Apr 2019 02:51:42 -0600
Subject: [Buildroot] [PATCH 1/1] package/v4l2loopback: bump to version
 v0.12.1
Message-ID: <20190407085142.79181-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This should fix a kernel 5.x.x compatibility issue.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/v4l2loopback/v4l2loopback.hash | 2 +-
 package/v4l2loopback/v4l2loopback.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/v4l2loopback/v4l2loopback.hash b/package/v4l2loopback/v4l2loopback.hash
index 1f368121c7..6d661d0a65 100644
--- a/package/v4l2loopback/v4l2loopback.hash
+++ b/package/v4l2loopback/v4l2loopback.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	419354f1de98b4f25be75decde942026c7e9e2d2c2def283c2988875e4a16aa6  v4l2loopback-v0.12.0.tar.gz
+sha256	f2b9b7f8611c1a77b2f496ee505e49860121079c998bb735e4bb6b8954132348  v4l2loopback-v0.12.1.tar.gz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index a6dedb2a31..99879f9219 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-V4L2LOOPBACK_VERSION = v0.12.0
+V4L2LOOPBACK_VERSION = v0.12.1
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
-- 
2.19.1
