From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 23 Feb 2019 11:32:56 +0100
Subject: [Buildroot] [PATCH/next v1 0/2] raspberrypi: bump kernel version to
 4.19.24
Message-ID: <20190223103258.4274-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based on last 4.14.x kernel/firmware bump [1], [2].

Tested with raspberrypi3_qt5we_defconfig on
RaspberryPi 3 Model B v1.2 Hardware.

[1] https://patchwork.ozlabs.org/patch/1047160
[2] https://patchwork.ozlabs.org/patch/1047159

Peter Seiderer (2):
  configs/raspberrypi*: bump kernel version to 5eeff139ea
  package/rpi-firmware: bump version to ebf7b40cdc

 configs/raspberrypi0_defconfig         | 8 +++++---
 configs/raspberrypi0w_defconfig        | 7 ++++---
 configs/raspberrypi2_defconfig         | 8 +++++---
 configs/raspberrypi3_64_defconfig      | 8 +++++---
 configs/raspberrypi3_defconfig         | 6 ++++--
 configs/raspberrypi3_qt5we_defconfig   | 8 +++++---
 configs/raspberrypi_defconfig          | 8 +++++---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 9 files changed, 35 insertions(+), 22 deletions(-)

-- 
2.20.1
