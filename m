From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Nov 2013 01:09:15 +0100
Subject: [Buildroot] [PATCH 2/2] package/rpi-userland: bump version
In-Reply-To: <cover.1384128473.git.yann.morin.1998@free.fr>
References: <cover.1384128473.git.yann.morin.1998@free.fr>
Message-ID: <86c9bc7befd010cc2b4c60ee5e4607d28f90d861.1384128473.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bump for a few more options (eg. setting the palette in 4- or 8bpp,
and rendering camera preview with GL).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 9320ecf..1741153 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 0d25e71ea558f32cd72b8d46cd51767c92a81d01
+RPI_USERLAND_VERSION = 0d486513f56453f8203c270fcad0b04f8e4f1fee
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.8.1.2
