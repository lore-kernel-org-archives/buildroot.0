From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jun 2013 22:40:52 +0200
Subject: [Buildroot] [PATCH 1/4] package/rpi-firmware: version bump for HDMI
	and audio fixes
In-Reply-To: <cover.1372019882.git.yann.morin.1998@free.fr>
References: <cover.1372019882.git.yann.morin.1998@free.fr>
Message-ID: <f9d668492eee80134c335b25faaf3a76c7c8871a.1372019882.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 391a418..b490296 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 06f6c909e285beceeb7e51f71ba6ffe754f073e8
+RPI_FIRMWARE_VERSION = a0c98fa6bc0f93bad8cbfcf749f7be7dc2276192
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.1.2
