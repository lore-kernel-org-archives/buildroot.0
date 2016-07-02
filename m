From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:37 +0200
Subject: [Buildroot] [PATCH 68/69] rpi-firmware: remove empty host
	dependencies definition
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-69-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/rpi-firmware/rpi-firmware.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index e170780789c7..0587802b5144 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -49,7 +49,6 @@ endef
 # We have no host sources to get, since we already
 # bundle the script we want to install.
 HOST_RPI_FIRMWARE_SOURCE =
-HOST_RPI_FIRMWARE_DEPENDENCIES =
 
 define HOST_RPI_FIRMWARE_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 package/rpi-firmware/mkknlimg $(HOST_DIR)/usr/bin/mkknlimg
-- 
2.1.0
