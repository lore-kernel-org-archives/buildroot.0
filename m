From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat,  4 Nov 2017 22:40:44 +0300
Subject: [Buildroot] [PATCH 0/5] orangepi-zero: misc updates
Message-ID: <20171104194049.24550-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patchset contains updates mostly aimed at better support of
orange-pi-zero board, including enabling WiFi and bumping kernel
version. Besides, I added myself to DEVELOPERS to track activity
around several allwinner boards.

Regards,
Sergey

Sergey Matyukevich (5):
  xr819-firmware: new package
  orange-pi-zero: add xr819 firmware
  orange-pi-zero: bump kernel version
  package/xr819-xradio: update to the latest version
  DEVELOPERS: add myself to several packages

 DEVELOPERS                                 |    7 +++++++
 configs/orangepi_zero_defconfig            |    8 +++++---
 package/Config.in                          |    1 +
 package/xr819-firmware/Config.in           |    4 ++++
 package/xr819-firmware/xr819-firmware.hash |    5 +++++
 package/xr819-firmware/xr819-firmware.mk   |   25 +++++++++++++++++++++++++
 package/xr819-xradio/xr819-xradio.hash     |    2 +-
 package/xr819-xradio/xr819-xradio.mk       |    2 +-
 8 files changed, 49 insertions(+), 5 deletions(-)
