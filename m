From: Martin Bark <martin@barkynet.com>
Date: Sun,  5 Mar 2017 16:06:14 +0000
Subject: [Buildroot] [PATCH 6/8] package/rpi-userland: bump version
In-Reply-To: <1488729976-7116-1-git-send-email-martin@barkynet.com>
References: <1488729976-7116-1-git-send-email-martin@barkynet.com>
Message-ID: <1488729976-7116-6-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 24b6584..3e0dbfa 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f229c29ceae611101bf4716b112251b2f2a33cfbb6636d736deda4e1314bb9d9 rpi-userland-c139376e9bc6fbd93f777c7fc3c7d7cf2cc35122.tar.gz
+sha256 9f7caa5fee77cef034551b23a7c12d78792ebd2feca7bcbc677da4daf2a98cf7 rpi-userland-f410ec051a3724934e3671315474d4b81424b0ef.tar.gz
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 4e3b4ec..aec721d 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = c139376e9bc6fbd93f777c7fc3c7d7cf2cc35122
+RPI_USERLAND_VERSION = f410ec051a3724934e3671315474d4b81424b0ef
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.7.4
