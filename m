From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 21:03:21 +0100
Subject: [Buildroot] [git commit] package/v4l2loopback: bump version to
 0.12.0
Message-ID: <20181108200157.D77FC8177C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d4150a8042aa1a2170c60162a0371390e4d39c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license hash for COPYING file.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/v4l2loopback/v4l2loopback.hash | 3 ++-
 package/v4l2loopback/v4l2loopback.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/v4l2loopback/v4l2loopback.hash b/package/v4l2loopback/v4l2loopback.hash
index 2b69fd7fb7..1f368121c7 100644
--- a/package/v4l2loopback/v4l2loopback.hash
+++ b/package/v4l2loopback/v4l2loopback.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 9bb1e8d544019bead20813877415ae974fbc22f87c69772984a4abac433f36dd  v4l2loopback-v0.10.0.tar.gz
+sha256	419354f1de98b4f25be75decde942026c7e9e2d2c2def283c2988875e4a16aa6  v4l2loopback-v0.12.0.tar.gz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index 669f8fc669..a6dedb2a31 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-V4L2LOOPBACK_VERSION = v0.10.0
+V4L2LOOPBACK_VERSION = v0.12.0
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
