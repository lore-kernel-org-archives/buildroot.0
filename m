From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 Nov 2013 19:28:04 +0100
Subject: [Buildroot] [PATCH 2/4] package/rpi-userland: bump
In-Reply-To: <cover.1383675996.git.yann.morin.1998@free.fr>
References: <cover.1383675996.git.yann.morin.1998@free.fr>
Message-ID: <84bdc4cecefea3d9e18603a46c252519e9d8b91f.1383675996.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes for camera features (exposure, capture loop, shutter speed),
h264 encoding headers, EXIF thumbnails.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 9f20766..9320ecf 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 77d32cd6b7d1c586877b0e05f941e647e35084bc
+RPI_USERLAND_VERSION = 0d25e71ea558f32cd72b8d46cd51767c92a81d01
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.8.1.2
