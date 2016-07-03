From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:24:02 +0200
Subject: [Buildroot] [git commit] rpi-firmware: remove empty host
	dependencies definition
Message-ID: <20160703082409.DF34A800F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97e3d82d91fbb10f891ffa691bdd0e66cc1821d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/rpi-firmware.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index e170780..0587802 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -49,7 +49,6 @@ endef
 # We have no host sources to get, since we already
 # bundle the script we want to install.
 HOST_RPI_FIRMWARE_SOURCE =
-HOST_RPI_FIRMWARE_DEPENDENCIES =
 
 define HOST_RPI_FIRMWARE_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 package/rpi-firmware/mkknlimg $(HOST_DIR)/usr/bin/mkknlimg
