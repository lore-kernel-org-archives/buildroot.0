From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 18:07:12 +0100
Subject: [Buildroot] [PATCH 2/3] package/rpi-firmware: bump version
In-Reply-To: <cover.1393779995.git.yann.morin.1998@free.fr>
References: <cover.1393779995.git.yann.morin.1998@free.fr>
Message-ID: <92c2dd080fa5e2a477181a3bfc3da95030a3acf8.1393779995.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes and enhancements for:
  - audio: clock, HDMI passthrough, DTS
  - video playback: unpacked bitstreams
  - 3D: HW textures orientation
  - PWM: boot-time options
  - undisclosed changes

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 99faa5b..b6c9667 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 98e3be3a7e0ec7d4a86e8edb2177bd8e2bb8728f
+RPI_FIRMWARE_VERSION = bec4bd0f70aa46f55a980996e8774547c0f909c8
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.3.2
