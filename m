From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  4 Dec 2016 00:11:31 +0100
Subject: [Buildroot] [PATCH v1 0/6] Raspberry PI update
Message-ID: <20161203231137.32221-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update rpi-firmware/rpi-userland and all raspberrypiX_defconfigs to
kernel version 4.4.36.

Tested on Raspberry Pi 3 Model B v1.2 hardware:
- raspberrypi3_defconfig
- raspberrypi3_defconfig updated to glibc, systemd, gcc-6.x and
  qt5 (linuxfb, eglfs)

Peter Seiderer (6):
  raspberrypi0_defconfig: bump kernel version to 4.4.36
  raspberrypi_defconfig: bump kernel version to 4.4.36
  raspberrypi2_defconfig: bump kernel version to 4.4.36
  raspberrypi3_defconfig: bump kernel version to 4.4.36
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
