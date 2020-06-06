From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat,  6 Jun 2020 17:45:39 -0600
Subject: [Buildroot] [PATCH 1/1] package/v4l2loopback: bump to version 0.12.5
Message-ID: <20200606234539.2470905-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/v4l2loopback/v4l2loopback.hash | 2 +-
 package/v4l2loopback/v4l2loopback.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/v4l2loopback/v4l2loopback.hash b/package/v4l2loopback/v4l2loopback.hash
index 97645ea827..f4491e02d0 100644
--- a/package/v4l2loopback/v4l2loopback.hash
+++ b/package/v4l2loopback/v4l2loopback.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6483a64050d1c32de909a34379913d2f949141ed37a2ccc250d491a40bf96af9  v4l2loopback-0.12.4.tar.gz
+sha256  e152cd6df6a8add172fb74aca3a9188264823efa5a2317fe960d45880b9406ae  v4l2loopback-0.12.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index 1fc2e16524..7701bc3a30 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-V4L2LOOPBACK_VERSION = 0.12.4
+V4L2LOOPBACK_VERSION = 0.12.5
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,v$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
-- 
2.25.1
