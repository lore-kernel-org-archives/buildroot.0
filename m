From: Pascal de Bruijn <pmjdebruijn@pcode.nl>
Date: Thu, 28 May 2015 20:41:50 +0200
Subject: [Buildroot] [PATCH 5/5] rpi-userland: update to match linux 3.18.14
In-Reply-To: <1432838510-1848-1-git-send-email-pmjdebruijn@pcode.nl>
References: <1432838510-1848-1-git-send-email-pmjdebruijn@pcode.nl>
Message-ID: <1432838510-1848-5-git-send-email-pmjdebruijn@pcode.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pascal de Bruijn <pmjdebruijn@pcode.nl>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 20a6af0..3b343de 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 8f542a1647e6f88f254eadd9ad6929301c81913b
+RPI_USERLAND_VERSION = d4aa617de3b196399bb8e2ce32e181768cb52179
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.9.1
