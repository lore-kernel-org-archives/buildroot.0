From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Sep 2017 12:48:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: fix typo in license
	info for qla2xxx
Message-ID: <20170903104816.1781-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://git.buildroot.net/buildroot/commit/package/linux-firmware?id=91983091455e2b82432509c11f958409e7bbefcd
added support for ql2xxx adapters with the wrong filename for the
license file.

Fixes
http://autobuild.buildroot.net/results/58a/58a4112eb5ee1a3242ad17dd156f8abc977fb96c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b01585fbe..d238abe9e 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -419,7 +419,7 @@ ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_2XXX),y)
 LINUX_FIRMWARE_FILES += \
 	ql2100_fw.bin ql2200_fw.bin ql2300_fw.bin ql2322_fw.bin \
 	ql2400_fw.bin ql2500_fw.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qla2xxx
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qla2xxx
 endif
 
 ifneq ($(LINUX_FIRMWARE_FILES),)
-- 
2.11.0
