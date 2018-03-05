From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Mon,  5 Mar 2018 12:15:02 -0500
Subject: [Buildroot] [PATCH 0/3] board/technologic/ts5x00: fix build with
 GCC 6.x
Message-ID: <20180305171505.4003-1-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset fixes the build for the ts5x00_defconfig defconfig with
GCC 6.x. While at it, rename ts5x00 to ts5500 to avoid confusion and add
myself as the maintainer in the DEVELOPERS file.

Vivien Didelot (3):
  board/technologic/ts5x00: bump kernel to 4.14
  board/technologic/ts5x00: rename to ts5500
  DEVELOPERS: add myself as the ts5500 maintainer

 .gitlab-ci.yml                                                 |  2 +-
 DEVELOPERS                                                     |  4 ++++
 .../{ts5x00 => ts5500}/fs-overlay/boot/syslinux/syslinux.cfg   |  0
 .../{ts5x00/linux-3.17.config => ts5500/linux-4.14.config}     |  4 +---
 board/technologic/{ts5x00 => ts5500}/readme.txt                |  2 +-
 configs/{ts5x00_defconfig => ts5500_defconfig}                 | 10 +++++-----
 6 files changed, 12 insertions(+), 10 deletions(-)
 rename board/technologic/{ts5x00 => ts5500}/fs-overlay/boot/syslinux/syslinux.cfg (100%)
 rename board/technologic/{ts5x00/linux-3.17.config => ts5500/linux-4.14.config} (98%)
 rename board/technologic/{ts5x00 => ts5500}/readme.txt (98%)
 rename configs/{ts5x00_defconfig => ts5500_defconfig} (55%)

-- 
2.16.2
