From: David Lechner <david@lechnology.com>
Date: Thu, 27 Dec 2018 13:53:02 -0600
Subject: [Buildroot] [PATCH 0/3] LEGO MINDSTORMS EV3 kernel 4.19 update
Message-ID: <20181227195305.5329-1-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series updates LEGO MINDSTORMS EV3 to the current LTS kernel (4.19). See
individual commit messages for details.

David Lechner (3):
  linux-firmware: Add config option for TI CC2560(A) Bluetooth module
  board/lego/ev3: fix max U-Boot flash size
  board/lego/ev3: Update to Linux kernel 4.19 and U-Boot 2018.11

 board/lego/ev3/genimage.cfg                   | 14 +++++++--
 board/lego/ev3/linux.fragment                 |  6 ++++
 ...s-legoev3-increase-flash-image-sizes.patch | 31 -------------------
 board/lego/ev3/readme.txt                     | 17 ++++++++++
 configs/lego_ev3_defconfig                    | 19 +++++++-----
 package/linux-firmware/Config.in              |  5 +++
 package/linux-firmware/linux-firmware.mk      |  8 +++++
 7 files changed, 59 insertions(+), 41 deletions(-)
 delete mode 100644 board/lego/ev3/patches/uboot/configs-legoev3-increase-flash-image-sizes.patch

-- 
2.17.1
