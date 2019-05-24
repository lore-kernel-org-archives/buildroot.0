From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 24 May 2019 14:35:41 -0600
Subject: [Buildroot] [PATCH 1/1] package/v4l2loopback: bump to version
 0b8feb80fdef9a415d8250bca1790b3ff23e8391
Message-ID: <20190524203541.116482-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This should fix a kernel 5.1.x compatibility issue.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/v4l2loopback/v4l2loopback.hash | 2 +-
 package/v4l2loopback/v4l2loopback.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/v4l2loopback/v4l2loopback.hash b/package/v4l2loopback/v4l2loopback.hash
index 6d661d0a65..b459245c74 100644
--- a/package/v4l2loopback/v4l2loopback.hash
+++ b/package/v4l2loopback/v4l2loopback.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	f2b9b7f8611c1a77b2f496ee505e49860121079c998bb735e4bb6b8954132348  v4l2loopback-v0.12.1.tar.gz
+sha256	887caaed4e3d27d7bb0e05c32f0df658dd03b578440c2cddeb5920c2fda207b0  v4l2loopback-0b8feb80fdef9a415d8250bca1790b3ff23e8391.tar.gz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index 99879f9219..c2f9b42449 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-V4L2LOOPBACK_VERSION = v0.12.1
+V4L2LOOPBACK_VERSION = 0b8feb80fdef9a415d8250bca1790b3ff23e8391
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
-- 
2.20.1
