From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Thu, 13 Aug 2015 18:22:46 +0200
Subject: [Buildroot] [PATCH 0/5] rpi: global update
Message-ID: <1439482971-92878-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series is a global update of the RPi stuff. It depends on the following
series:
http://patchwork.ozlabs.org/patch/507028/
http://patchwork.ozlabs.org/patch/507027/

This is based on next.

Best regards,
Beno?t

Beno?t Th?baudeau (5):
  package/rpi-firmware: bump marking script version
  package/rpi-firmware: bump version
  configs/raspberrypi: bump kernel version to 4.1.5
  configs/raspberrypi2: bump kernel version to 4.1.5
  package/rpi-userland: bump version

 configs/raspberrypi2_defconfig       |  10 +-
 configs/raspberrypi_defconfig        |  11 +-
 package/rpi-firmware/mkknlimg        | 246 ++++++++++++++++++++++-------------
 package/rpi-firmware/rpi-firmware.mk |   2 +-
 package/rpi-userland/rpi-userland.mk |   2 +-
 5 files changed, 171 insertions(+), 100 deletions(-)
 mode change 100755 => 100644 package/rpi-firmware/mkknlimg

-- 
2.1.4
