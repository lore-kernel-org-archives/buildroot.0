From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2015 00:25:14 +0200
Subject: [Buildroot] [PATCH 05/11] package/rpi-userland: bump version
In-Reply-To: <cover.1435529863.git.yann.morin.1998@free.fr>
References: <cover.1435529863.git.yann.morin.1998@free.fr>
Message-ID: <1118a9b192c171b72422bb03fa56c85aad4b88cd.1435529863.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Misc fixes and improvements all over the place...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 20a6af0..1a1c9c6 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 8f542a1647e6f88f254eadd9ad6929301c81913b
+RPI_USERLAND_VERSION = b834074d0c0d9d7e64c133ab14ed691999cee990
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.9.1
