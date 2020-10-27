From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Oct 2020 10:08:23 +0100
Subject: [Buildroot] [git commit] package/motion: bump to version 4.3.2
Message-ID: <20201027085603.EE4C481275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e26559fadb06e83623422e04f13f9765bc6c80e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/Motion-Project/motion/releases/tag/release-4.3.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/motion/motion.hash | 2 +-
 package/motion/motion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index 6e8dd699e1..96ab1c4338 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  545712b10fc4a0134e994b7d8a3773c1c22f0bf4bd7afea7d7ffff357aca9ea5  motion-4.3.1.tar.gz
+sha256  dafa4264b2d8e4778f8be5871f09b6c0ec710d5a836182c583469c18db944d70  motion-4.3.2.tar.gz
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  doc/COPYING
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 17a48d42ac..29b70fd85f 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOTION_VERSION = 4.3.1
+MOTION_VERSION = 4.3.2
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = doc/COPYING
