From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jan 2016 15:39:59 +0100
Subject: [Buildroot] [PATCH 1/2] pixman: bump version to 0.33.6
Message-ID: <1453041600-5005-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pixman/pixman.hash | 4 ++--
 package/pixman/pixman.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
index 66decf6..7a37220 100644
--- a/package/pixman/pixman.hash
+++ b/package/pixman/pixman.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-October/002644.html
-sha1	dff77cd08412b33ab0294057ade93e401c8a9302	pixman-0.33.4.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-December/002666.html
+sha1   11e93fed35deb9c89347e7a7da3060e5e5c89412	pixman-0.33.6.tar.bz2
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index a130af9..fc43140 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.33.4
+PIXMAN_VERSION = 0.33.6
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.bz2
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
-- 
2.6.4
