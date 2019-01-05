From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  5 Jan 2019 20:50:55 +0100
Subject: [Buildroot] [PATCH v1 0/3] Raspberry Pi update
Message-ID: <20190105195058.7322-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update configs/raspberrypi*, rpi-firmware and  rpi-userland to
latest versions.

Tested on Raspberry Pi 3 Model B v1.2 hardware with
raspberrypi3_qt5we_defconfig.

Peter Seiderer (3):
  configs/raspberrypi*: bump kernel version to 4c5aec7827
  rpi-firmware: bump version to fbad6408c4
  rpi-userland: bump version to 7cbfbd38d9

 configs/raspberrypi0_defconfig         | 2 +-
 configs/raspberrypi0w_defconfig        | 2 +-
 configs/raspberrypi2_defconfig         | 2 +-
 configs/raspberrypi3_64_defconfig      | 2 +-
 configs/raspberrypi3_defconfig         | 2 +-
 configs/raspberrypi3_qt5we_defconfig   | 2 +-
 configs/raspberrypi_defconfig          | 2 +-
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.20.1
