From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Mar 2014 16:25:24 +0100
Subject: [Buildroot] [PATCH 2/3] package/rpi-userland: bump version
In-Reply-To: <cover.1394983430.git.yann.morin.1998@free.fr>
References: <cover.1394983430.git.yann.morin.1998@free.fr>
Message-ID: <0a7a797d2b03f060d2a7387d8041996b8a6fccae.1394983430.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

High frame rates and full FoV in camera code.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 69b6ee6..3b7d5b5 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 68a2cba184d2726327026429abfe033acf217384
+RPI_USERLAND_VERSION = 7beec2158da8229598f8e471ab5ca834078f5ad2
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.8.3.2
