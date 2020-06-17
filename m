From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Wed, 17 Jun 2020 10:23:24 +0530
Subject: [Buildroot] [PATCH 0/2] Add support for radxa rk3399 and rk3399pro
 based targets
Message-ID: <1592369606-14872-1-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Suniel Mahesh <sunil@amarulasolutions.com>

This patch series adds support for targets based on rk3399 SOC from radxa.

patch #1, adds support for rockpi_n10 base board hosting a RK3399pro SOM.
patch #2, adds support for rockpi_4c target based on rk3399 SOC.

Suniel Mahesh (2):
  configs/rockpi_n10: new defconfig
  configs/rockpi_4c: new defconfig

 .gitlab-ci.yml                       |  2 ++
 DEVELOPERS                           |  4 +++
 board/radxa/rockpi-4c/extlinux.conf  |  4 +++
 board/radxa/rockpi-4c/genimage.cfg   | 39 ++++++++++++++++++++++++
 board/radxa/rockpi-4c/post-build.sh  |  5 ++++
 board/radxa/rockpi-4c/readme.txt     | 56 +++++++++++++++++++++++++++++++++++
 board/radxa/rockpi-n10/extlinux.conf |  4 +++
 board/radxa/rockpi-n10/genimage.cfg  | 39 ++++++++++++++++++++++++
 board/radxa/rockpi-n10/post-build.sh |  5 ++++
 board/radxa/rockpi-n10/readme.txt    | 56 +++++++++++++++++++++++++++++++++++
 configs/rockpi_4c_defconfig          | 57 ++++++++++++++++++++++++++++++++++++
 configs/rockpi_n10_defconfig         | 57 ++++++++++++++++++++++++++++++++++++
 12 files changed, 328 insertions(+)
 create mode 100644 board/radxa/rockpi-4c/extlinux.conf
 create mode 100644 board/radxa/rockpi-4c/genimage.cfg
 create mode 100755 board/radxa/rockpi-4c/post-build.sh
 create mode 100644 board/radxa/rockpi-4c/readme.txt
 create mode 100644 board/radxa/rockpi-n10/extlinux.conf
 create mode 100644 board/radxa/rockpi-n10/genimage.cfg
 create mode 100755 board/radxa/rockpi-n10/post-build.sh
 create mode 100644 board/radxa/rockpi-n10/readme.txt
 create mode 100644 configs/rockpi_4c_defconfig
 create mode 100644 configs/rockpi_n10_defconfig

-- 
2.7.4
