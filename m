From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2014 19:40:16 +0100
Subject: [Buildroot] [PATCH 2/5] package/rpi-userland: bumps for misc fixes
	and improvements
In-Reply-To: <cover.1390070341.git.yann.morin.1998@free.fr>
References: <cover.1390070341.git.yann.morin.1998@free.fr>
Message-ID: <a2daa2cf64549471826635a8984caec9b5fc6dab.1390070341.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

A slew of fixes and improvements, specially directed toward, but
not limited to, the sample codes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 8911ae0..35eaf24 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = d2c9f912da389c23ed27e81e940be3540f64fc59
+RPI_USERLAND_VERSION = 5cecd5ae71540a3c11270924251103b3b5c8513a
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.8.1.2
