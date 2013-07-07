From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jul 2013 15:13:26 +0200
Subject: [Buildroot] [PATCH 3/3] package/rpi-userland: bump version
In-Reply-To: <cover.1373202515.git.yann.morin.1998@free.fr>
References: <cover.1373202515.git.yann.morin.1998@free.fr>
Message-ID: <2498afa0081e1da31f07adc355a2ac1b47bda093.1373202515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Misc fixes for audio and raspi-cam.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 55d7b09..fca0e25 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 986774edf7c91a8a91d59abadbdb0b34b5a387dc
+RPI_USERLAND_VERSION = 8b271ac
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.8.1.2
