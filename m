From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Apr 2014 23:24:52 +0200
Subject: [Buildroot] [PATCH 1/3] package/rpi-userland: bump revision
In-Reply-To: <cover.1397424240.git.yann.morin.1998@free.fr>
References: <cover.1397424240.git.yann.morin.1998@free.fr>
Message-ID: <ef5255c854d3f7fa011f4183e2e363a199406f7a.1397424240.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes and enhancements for:
  - camera : preview, white balance, padding-removal
  - encoder: save inline motion vectors
  - misc   : locking in GPU<->CPU dialog (?), tvservice eye-candy

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 3c20516..7188dcf 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 58ab02e820df719440816534f4534ab1dfd66ce6
+RPI_USERLAND_VERSION = a59842a068cbd19e262701f30014499e9070fbf6
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.8.3.2
