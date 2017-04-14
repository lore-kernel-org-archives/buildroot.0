From: Martin Bark <martin@barkynet.com>
Date: Fri, 14 Apr 2017 16:32:25 +0100
Subject: [Buildroot] [PATCH 2/6] package/rpi-userland: bump version
In-Reply-To: <1492183949-8181-1-git-send-email-martin@barkynet.com>
References: <1492183949-8181-1-git-send-email-martin@barkynet.com>
Message-ID: <1492183949-8181-2-git-send-email-martin@barkynet.com>
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
index 3e0dbfa..d4715fe 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 9f7caa5fee77cef034551b23a7c12d78792ebd2feca7bcbc677da4daf2a98cf7 rpi-userland-f410ec051a3724934e3671315474d4b81424b0ef.tar.gz
+sha256 35b02340de04d8b91490e192b402ba23333a82b0c624e3e4475ba3240a2419a5 rpi-userland-f0642e3b58d8a140a3f7621630c15fbfa794b19d.tar.gz
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 632552c..ab05447 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = f410ec051a3724934e3671315474d4b81424b0ef
+RPI_USERLAND_VERSION = f0642e3b58d8a140a3f7621630c15fbfa794b19d
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.7.4
