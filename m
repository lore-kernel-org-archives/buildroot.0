From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat,  3 Apr 2021 00:20:36 +0200
Subject: [Buildroot] [PATCH 0/3] Align Amarula Vyasa with latest U-Boot and
 Linux
Message-ID: <20210402222039.3812925-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset bump to latest versions of U-Boot and Linux. It also set sd-card
as bootable media where to search extlinux.conf.

Giulio Benetti (3):
  configs/amarula_vyasa_rk3288: bump u-boot version to 2021.01
  configs/amarula_vyasa_rk3288: vyasa: bump Linux version to 5.11
  board/amarula/vyasa: set sd-card as boot media

 board/amarula/vyasa/extlinux.conf      | 2 +-
 configs/amarula_vyasa_rk3288_defconfig | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.25.1
