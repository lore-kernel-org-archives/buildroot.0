From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 23 Apr 2016 18:46:20 +0200
Subject: [Buildroot] [PATCH v1 0/4] Raspberry PI (raspberrypi/raspberrypi2)
	update
Message-ID: <1461429984-12561-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update rpi-firmware/rpi-userland and raspberrypi/raspberrypi2 kernel
versions.

Tested raspberrypi_defconfig on Raspberry Pi Model B Rev 2 hardware.

Peter Seiderer (4):
  rpi-firmware: bump version
  rpi-userland: bump version
  raspberrypi_defconfig: bump to kernel version 4.4.7
  raspberrypi2_defconfig: bump to kernel version 4.4.7

 configs/raspberrypi2_defconfig                     |  6 ++--
 configs/raspberrypi_defconfig                      |  6 ++--
 package/rpi-firmware/rpi-firmware.mk               |  2 +-
 ...make-vmcs.cmake-allow-to-override-VMCS_IN.patch | 27 -----------------
 ...6-dtmerge-add-missing-include-for-va_list.patch | 34 ++++++++++++++++++++++
 package/rpi-userland/rpi-userland.mk               |  2 +-
 6 files changed, 42 insertions(+), 35 deletions(-)
 delete mode 100644 package/rpi-userland/0002-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
 create mode 100644 package/rpi-userland/0006-dtmerge-add-missing-include-for-va_list.patch

-- 
2.1.4
