From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  3 Sep 2012 10:37:45 +0200
Subject: [Buildroot] [PATCH 1/2] linux-firmware: add ti-connectivity fw v5
Message-ID: <1346661466-24431-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/linux-firmware/linux-firmware.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 2a6bfc1..c71dc15 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -3,7 +3,7 @@
 # linux-firmware
 #
 #############################################################
-LINUX_FIRMWARE_VERSION = 8ccddee5ee23a0e192da38d98bcbbbb41bf385dd
+LINUX_FIRMWARE_VERSION = 7560108a2c94a62056fa82d912282b901aa0904f
 LINUX_FIRMWARE_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
@@ -41,6 +41,9 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X) += \
 	ti-connectivity/wl127x-fw-4-mr.bin			\
 	ti-connectivity/wl127x-fw-4-plt.bin			\
 	ti-connectivity/wl127x-fw-4-sr.bin			\
+	ti-connectivity/wl127x-fw-5-mr.bin			\
+	ti-connectivity/wl127x-fw-5-plt.bin			\
+	ti-connectivity/wl127x-fw-5-sr.bin			\
 	ti-connectivity/TIInit_7.2.31.bts 			\
 	LICENCE.ti-connectivity
 
@@ -56,6 +59,9 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X) += \
 	ti-connectivity/wl128x-fw-4-mr.bin			\
 	ti-connectivity/wl128x-fw-4-plt.bin			\
 	ti-connectivity/wl128x-fw-4-sr.bin			\
+	ti-connectivity/wl128x-fw-5-mr.bin			\
+	ti-connectivity/wl128x-fw-5-plt.bin			\
+	ti-connectivity/wl128x-fw-5-sr.bin			\
 	ti-connectivity/TIInit_7.2.31.bts 			\
 	LICENCE.ti-connectivity
 
-- 
1.7.7
