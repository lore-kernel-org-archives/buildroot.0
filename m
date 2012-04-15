From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Apr 2012 23:07:52 +0200
Subject: [Buildroot] [git commit] linux-firmware: add new wl12xx firmware
Message-ID: <20120415211018.3600A96A26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5b6e19eff604bf92ab84c30eebd600f88d39db3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-firmware/linux-firmware.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e09f67d..ba33d37 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -3,7 +3,7 @@
 # linux-firmware
 #
 #############################################################
-LINUX_FIRMWARE_VERSION = a2995d38c234e3d767df7223d84a0f33a1a24997
+LINUX_FIRMWARE_VERSION = 8ccddee5ee23a0e192da38d98bcbbbb41bf385dd
 LINUX_FIRMWARE_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
@@ -38,6 +38,9 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X) += \
 	ti-connectivity/wl127x-fw-3.bin				\
 	ti-connectivity/wl127x-fw-plt-3.bin			\
 	ti-connectivity/wl127x-nvs.bin				\
+	ti-connectivity/wl127x-fw-4-mr.bin			\
+	ti-connectivity/wl127x-fw-4-plt.bin			\
+	ti-connectivity/wl127x-fw-4-sr.bin			\
 	ti-connectivity/TIInit_7.2.31.bts 			\
 	LICENCE.ti-connectivity
 
@@ -50,6 +53,9 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X) += \
 	ti-connectivity/wl1271-nvs.bin				\
 	ti-connectivity/wl128x-nvs.bin				\
 	ti-connectivity/wl12xx-nvs.bin				\
+	ti-connectivity/wl128x-fw-4-mr.bin			\
+	ti-connectivity/wl128x-fw-4-plt.bin			\
+	ti-connectivity/wl128x-fw-4-sr.bin			\
 	ti-connectivity/TIInit_7.2.31.bts 			\
 	LICENCE.ti-connectivity
 
