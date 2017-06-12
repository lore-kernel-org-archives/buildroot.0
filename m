From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Tue, 13 Jun 2017 01:42:53 +0530
Subject: [Buildroot] [PATCH v5 0/3] Board: Add Engicam i.MX6 SOM
Message-ID: <1497298376-21516-1-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

This series add buildroot support for Engicam i.MX6 SOM's
- i.CoreM6
- i.CoreM6 RQS
- GEAM6UL

Jagan Teki (3):
  board: Add support for Engicam i.CoreM6 SOM
  board: Add support for Engicam i.CoreM6 RQS SOM
  board: Add support for Engicam GEAM6UL SOM

 DEVELOPERS                                      |  6 +++
 board/engicam/geam6ul/genimage.cfg              | 38 ++++++++++++++
 board/engicam/geam6ul/readme.txt                | 65 +++++++++++++++++++++++
 board/engicam/icorem6/genimage.cfg              | 39 ++++++++++++++
 board/engicam/icorem6/readme.txt                | 68 +++++++++++++++++++++++++
 board/engicam/icorem6_rqs/genimage.cfg          | 39 ++++++++++++++
 board/engicam/icorem6_rqs/readme.txt            | 68 +++++++++++++++++++++++++
 configs/engicam_imx6qdl_icore_mmc_defconfig     | 38 ++++++++++++++
 configs/engicam_imx6qdl_icore_rqs_mmc_defconfig | 38 ++++++++++++++
 configs/engicam_imx6ul_geam_mmc_defconfig       | 38 ++++++++++++++
 10 files changed, 437 insertions(+)
 create mode 100644 board/engicam/geam6ul/genimage.cfg
 create mode 100644 board/engicam/geam6ul/readme.txt
 create mode 100644 board/engicam/icorem6/genimage.cfg
 create mode 100644 board/engicam/icorem6/readme.txt
 create mode 100644 board/engicam/icorem6_rqs/genimage.cfg
 create mode 100644 board/engicam/icorem6_rqs/readme.txt
 create mode 100644 configs/engicam_imx6qdl_icore_mmc_defconfig
 create mode 100644 configs/engicam_imx6qdl_icore_rqs_mmc_defconfig
 create mode 100644 configs/engicam_imx6ul_geam_mmc_defconfig

-- 
2.7.4
