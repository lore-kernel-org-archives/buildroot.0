From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Dec 2013 23:36:05 +0100
Subject: [Buildroot] [PATCH 2/4] package/rpi-userland: bump for misc fixes
In-Reply-To: <cover.1385937338.git.yann.morin.1998@free.fr>
References: <cover.1385937338.git.yann.morin.1998@free.fr>
Message-ID: <7491e6ed595795f821f91cdbe975ad6c2a67b581.1385937338.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes for:
  - video encoder I-Frames compliance )PPS and SPS headers)
  - bitrate (quantisation?)
  - unnecessary build of mmal components
  - segfault in multiple-files stream generation

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 1741153..b17a5f4 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 0d486513f56453f8203c270fcad0b04f8e4f1fee
+RPI_USERLAND_VERSION = d2c9f912da389c23ed27e81e940be3540f64fc59
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.8.1.2
