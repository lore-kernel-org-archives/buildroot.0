From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 23 Jan 2017 21:23:12 +0100
Subject: [Buildroot] [PATCH v1 0/6] Raspberry Pi update
Message-ID: <20170123202318.12596-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update rpi-firmware/rpi-userland and all raspberrypi?_defconfigs to
kernel version 4.4.43.

Tested on Raspberry Pi 3 Model B v1.2 hardware:
- raspberrypi3_defconfig
- raspberrypi3_defconfig updated to glibc, systemd, gcc-6.x and
  qt5 (linuxfb, eglfs)

PeterpSeiderer (6):
  raspberrypi0_defconfig: bump kernel version to 4.4.43
  raspberrypi_defconfig: bump kernel version to 4.4.43
  raspberrypi2_defconfig: bump kernel version to 4.4.43
  raspberrypi3_defconfig: bump kernel version to 4.4.43
  rpi-firmware: bump version
  rpi-userland: bump version

 configs/raspberrypi0_defconfig         | 2 +-
 configs/raspberrypi2_defconfig         | 2 +-
 configs/raspberrypi3_defconfig         | 2 +-
 configs/raspberrypi_defconfig          | 2 +-
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.11.0
