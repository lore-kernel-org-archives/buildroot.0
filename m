From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:42 -0000
Subject: [Buildroot] [git commit] package/motion: bump to version 4.2.2
Message-ID: <20190903133620.12FF08A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71300b4c20d8b4b48518c7550b9fc833bbbb7ed6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/motion/motion.hash | 2 +-
 package/motion/motion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index 4ce70f8640..2b25d0a52c 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	d97ec6ae766adfd478b6f7f9cc0da5f2fe21faa9366d98664be255714c1cf81d	motion-4.2.1.tar.gz
+sha256	c8d40976b41da8eb9f9f7128599403a312fc26b7226bf3787d75f78cb5a6cc6e	motion-4.2.2.tar.gz
 sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index eb7f75e3fb..165e402fc8 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOTION_VERSION = 4.2.1
+MOTION_VERSION = 4.2.2
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = COPYING
