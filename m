From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 15 Apr 2020 16:41:34 +0300
Subject: [Buildroot] [PATCH 0/2] macchiatobin: drop vendor defconfig and
 update bsp
Message-ID: <20200415134136.580543-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas and all,

This patch series includes regular MacchiatoBin BSP maintenance. U-Boot
and Linux kernel versions are updated. Besides, removal of vendor
specific defconfig is suggested.

Regards,
Sergey

Sergey Matyukevich (2):
  configs/solidrun_macchiatobin_mainline: bump bsp versions
  configs/macchiatobin: drop marvell defconfig

 DEVELOPERS                                    |  3 +-
 board/solidrun/macchiatobin/readme.txt        | 44 ++++++-------------
 ...config => solidrun_macchiatobin_defconfig} |  8 ++--
 .../solidrun_macchiatobin_marvell_defconfig   | 44 -------------------
 4 files changed, 20 insertions(+), 79 deletions(-)
 rename configs/{solidrun_macchiatobin_mainline_defconfig => solidrun_macchiatobin_defconfig} (90%)
 delete mode 100644 configs/solidrun_macchiatobin_marvell_defconfig

-- 
2.26.0
