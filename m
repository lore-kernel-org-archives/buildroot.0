From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Aug 2014 23:22:23 +0200
Subject: [Buildroot] [PATCH 1/3] package/rpi-userland: Bump version
Message-ID: <1407014545-25541-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version bump introduces OMX_ImageFilterDeInterlaceFast,
which is needed by the upcoming xbmc/kodi version bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 2de6b92..717eab1 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 4855a45b118cb7b97b83e5160551db9813487c91
+RPI_USERLAND_VERSION = b555474b19310762255252d085e57599ea573889
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.7.10.4
