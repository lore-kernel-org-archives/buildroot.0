From: Martin Bark <martin@barkynet.com>
Date: Sun,  6 May 2018 21:07:24 +0100
Subject: [Buildroot] [PATCH 0/5] Raspberry pi updates
Message-ID: <20180506200729.31951-1-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the raspberry pi kernel and related firmware to their latest version

Martin Bark (5):
  configs/raspberrypi*: bump kernel version
  configs/raspberrypi3_64_defconfig: add support for rpi3b+
  package/rpi-firmware: bump version
  package/rpi-wifi-firmware: bump version
  package/rpi-bt-firmware: bump version

 board/raspberrypi/genimage-raspberrypi3-64.cfg   | 1 +
 configs/raspberrypi0_defconfig                   | 2 +-
 configs/raspberrypi0w_defconfig                  | 2 +-
 configs/raspberrypi2_defconfig                   | 2 +-
 configs/raspberrypi3_64_defconfig                | 4 ++--
 configs/raspberrypi3_defconfig                   | 2 +-
 configs/raspberrypi3_qt5we_defconfig             | 2 +-
 configs/raspberrypi_defconfig                    | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.hash     | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk       | 9 +++------
 package/rpi-firmware/rpi-firmware.hash           | 2 +-
 package/rpi-firmware/rpi-firmware.mk             | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 2 +-
 14 files changed, 17 insertions(+), 19 deletions(-)

--
2.17.0
