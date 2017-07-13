From: Martin Bark <martin@barkynet.com>
Date: Thu, 13 Jul 2017 13:22:27 +0100
Subject: [Buildroot] [PATCH 2/7] package/rpi-userland: bump version
In-Reply-To: <1499948552-11324-1-git-send-email-martin@barkynet.com>
References: <1499948552-11324-1-git-send-email-martin@barkynet.com>
Message-ID: <1499948552-11324-2-git-send-email-martin@barkynet.com>
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
index d4715fe..1728ae8 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 35b02340de04d8b91490e192b402ba23333a82b0c624e3e4475ba3240a2419a5 rpi-userland-f0642e3b58d8a140a3f7621630c15fbfa794b19d.tar.gz
+sha256 476cde13d0d4bbf44ffc4d1d545847464d5c270bb72e4d940e43e5972c4de9da rpi-userland-29835184aa70c13d77a11d721e934a7298bdf46a.tar.gz
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index ab05447..90077a1 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = f0642e3b58d8a140a3f7621630c15fbfa794b19d
+RPI_USERLAND_VERSION = 29835184aa70c13d77a11d721e934a7298bdf46a
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.7.4
