From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Fri, 16 Jun 2017 17:25:28 +0530
Subject: [Buildroot] [PATCH v3 0/6] Board: Add Engicam i.MX6 SOMs
Message-ID: <1497614134-5138-1-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

This series add buildroot support for Engicam i.MX6 SOM's
- i.CoreM6 DualLite/Solo
- i.CoreM6 RQS
- GEAM6UL
- Is.IoT MX6UL

Jagan Teki (6):
  board: Add support for Engicam i.CoreM6 DualLite/Solo boards
  board: engicam: Rename defconfig engicam_imx6qdl_icore_mmc_defconfig
  board: Add support for Engicam i.CoreM6 RQS SOM
  board: engicam: Add icorem6 for i.CoreM6 support
  board: Add support for Engicam GEAM6UL SOM
  board: Add support for Engicam Is.IoT MX6UL SOM

 DEVELOPERS                                         |  5 +-
 board/engicam/geam6ul/genimage.cfg                 | 38 ++++++++++++
 board/engicam/geam6ul/readme.txt                   | 65 +++++++++++++++++++++
 board/engicam/{ => icorem6}/genimage.cfg           |  1 +
 board/engicam/{ => icorem6}/readme.txt             | 20 ++++---
 board/engicam/icorem6_rqs/genimage.cfg             | 39 +++++++++++++
 board/engicam/icorem6_rqs/readme.txt               | 68 ++++++++++++++++++++++
 board/engicam/isiot/genimage.cfg                   | 38 ++++++++++++
 board/engicam/isiot/readme.txt                     | 65 +++++++++++++++++++++
 ...fconfig => engicam_imx6qdl_icore_mmc_defconfig} | 12 ++--
 configs/engicam_imx6qdl_icore_rqs_mmc_defconfig    | 41 +++++++++++++
 configs/engicam_imx6ul_geam_mmc_defconfig          | 41 +++++++++++++
 configs/engicam_imx6ul_isiot_mmc_defconfig         | 41 +++++++++++++
 13 files changed, 458 insertions(+), 16 deletions(-)
 create mode 100644 board/engicam/geam6ul/genimage.cfg
 create mode 100644 board/engicam/geam6ul/readme.txt
 rename board/engicam/{ => icorem6}/genimage.cfg (95%)
 rename board/engicam/{ => icorem6}/readme.txt (72%)
 create mode 100644 board/engicam/icorem6_rqs/genimage.cfg
 create mode 100644 board/engicam/icorem6_rqs/readme.txt
 create mode 100644 board/engicam/isiot/genimage.cfg
 create mode 100644 board/engicam/isiot/readme.txt
 rename configs/{engicam_imx6q_icore_defconfig => engicam_imx6qdl_icore_mmc_defconfig} (69%)
 create mode 100644 configs/engicam_imx6qdl_icore_rqs_mmc_defconfig
 create mode 100644 configs/engicam_imx6ul_geam_mmc_defconfig
 create mode 100644 configs/engicam_imx6ul_isiot_mmc_defconfig

-- 
2.7.4
