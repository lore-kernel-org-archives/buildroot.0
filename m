From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Fri, 23 Jun 2017 17:56:04 +0530
Subject: [Buildroot] [PATCH v5 0/5] Board: Add Engicam i.MX6 SOMs
Message-ID: <1498220769-22961-1-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

This version of series support all Engicam SOMs with fixes.

This series add buildroot support for Engicam i.MX6 SOM's
- i.CoreM6 DualLite/Solo
- i.CoreM6 RQS
- GEAM6UL
- Is.IoT MX6UL

Jagan Teki (5):
  board: Add support for Engicam i.CoreM6 DualLite/Solo boards
  board: Add support for Engicam i.CoreM6 RQS SOM
  board: engicam: Add icorem6 for i.CoreM6 support
  board: Add support for Engicam GEAM6UL SOM
  board: Add support for Engicam Is.IoT MX6UL SOM

 .gitlab-ci.yml                                     |  5 +-
 DEVELOPERS                                         |  5 +-
 board/engicam/geam6ul/genimage.cfg                 | 38 ++++++++++++
 board/engicam/geam6ul/readme.txt                   | 66 +++++++++++++++++++++
 board/engicam/{ => icorem6}/genimage.cfg           |  3 +-
 board/engicam/{ => icorem6}/readme.txt             | 21 ++++---
 board/engicam/icorem6_rqs/genimage.cfg             | 39 ++++++++++++
 board/engicam/icorem6_rqs/readme.txt               | 69 ++++++++++++++++++++++
 board/engicam/isiot/genimage.cfg                   | 38 ++++++++++++
 board/engicam/isiot/readme.txt                     | 66 +++++++++++++++++++++
 ...e_defconfig => engicam_imx6qdl_icore_defconfig} | 12 ++--
 configs/engicam_imx6qdl_icore_rqs_defconfig        | 41 +++++++++++++
 configs/engicam_imx6ul_geam_defconfig              | 41 +++++++++++++
 configs/engicam_imx6ul_isiot_mmc_defconfig         | 41 +++++++++++++
 14 files changed, 467 insertions(+), 18 deletions(-)
 create mode 100644 board/engicam/geam6ul/genimage.cfg
 create mode 100644 board/engicam/geam6ul/readme.txt
 rename board/engicam/{ => icorem6}/genimage.cfg (93%)
 rename board/engicam/{ => icorem6}/readme.txt (72%)
 create mode 100644 board/engicam/icorem6_rqs/genimage.cfg
 create mode 100644 board/engicam/icorem6_rqs/readme.txt
 create mode 100644 board/engicam/isiot/genimage.cfg
 create mode 100644 board/engicam/isiot/readme.txt
 rename configs/{engicam_imx6q_icore_defconfig => engicam_imx6qdl_icore_defconfig} (69%)
 create mode 100644 configs/engicam_imx6qdl_icore_rqs_defconfig
 create mode 100644 configs/engicam_imx6ul_geam_defconfig
 create mode 100644 configs/engicam_imx6ul_isiot_mmc_defconfig

-- 
2.7.4
