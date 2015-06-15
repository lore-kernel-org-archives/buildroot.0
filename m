From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jun 2015 23:14:26 +0200
Subject: [Buildroot] [git commit] linux-firmware: bump version
Message-ID: <20150615214401.8CC577FC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7a016950898571d5d5200bd91b0a3ea8714706d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove wl18xx-conf.bin as it was already removed from
upstream repository.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9acfc53..25a942a 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = f66291398181d24856fd2d19454d246199abd5ea
+LINUX_FIRMWARE_VERSION = 3161bfa479d5e9ed4f46b57df9bcecbbc4f8eb3c
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
@@ -175,7 +175,6 @@ endif
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX),y)
 LINUX_FIRMWARE_FILES += \
 	ti-connectivity/wl18xx-fw.bin \
-	ti-connectivity/wl18xx-conf.bin \
 	ti-connectivity/wl18xx-fw-2.bin \
 	ti-connectivity/wl18xx-fw-3.bin \
 	ti-connectivity/wl18xx-fw-4.bin \
