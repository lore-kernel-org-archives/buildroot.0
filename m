From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:03:25 +0200
Subject: [Buildroot] [PATCH 01/26] package/rpi-firmware: bump
In-Reply-To: <cover.1401656581.git.yann.morin.1998@free.fr>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <378956497535d52b6dad5a505f50f70cbd535e8f.1401656581.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Yet another bump for the Raspberry Pi firmware:
  - HDMI: EDID override; HDCP fix; add command to control power to HDMI phy;
        fixes to mode selection
  - GPU: enable use of HW cursor; fix for GLES FFT compliance; fix scaling;
        remove arbitrary restrictions on output sizes
  - video-decode: better handle corrupted h264 streams, better allocate memory
  - misc: choose composite video when HDMI is not plugged

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index babb0a8..ca9b5eb 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = c8881991d9181779aee9637d6f4b215f108021a3
+RPI_FIRMWARE_VERSION = f15c3b5e4018b974de30d95d3173b1e936f66bd7
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.3.2
