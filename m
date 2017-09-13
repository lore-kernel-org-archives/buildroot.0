From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Wed, 13 Sep 2017 17:12:05 +0530
Subject: [Buildroot] [PATCH v3 0/6] engicam: Add new boards and qt5
Message-ID: <1505302931-17387-1-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

This series add new boards from Engicam with qt5 support for each.

Jagan Teki (6):
  engicam: imx6qdl_icore: Bump to latest Linux and uboot releases
  board: icorem6: Add Qt5 configs for 800x480 LVDS display
  engicam: icorem6: Add OF C.TOUCH 10.1 Kit
  board: icorem6: Add Qt5 configs for 1280x800 LVDS display
  engicam: icorem6: Add OF C.TOUCH 12 Kit
  board: icorem6: Add Qt5 configs for 1280x480 LVDS display

 .gitlab-ci.yml                                     |  1 +
 DEVELOPERS                                         |  1 +
 board/engicam/icorem6/genimage.cfg                 |  4 +-
 board/engicam/icorem6/linux_qt5.fragment           |  4 ++
 board/engicam/icorem6/readme.txt                   | 24 +++++++
 .../rootfs_overlay/root/imx6qdl-icore-ofcap10.json | 11 +++
 .../rootfs_overlay/root/imx6qdl-icore-ofcap12.json | 11 +++
 .../icorem6/rootfs_overlay/root/imx6qdl-icore.json | 11 +++
 configs/engicam_imx6qdl_icore_defconfig            | 12 ++--
 configs/engicam_imx6qdl_icore_qt5_defconfig        | 81 ++++++++++++++++++++++
 10 files changed, 153 insertions(+), 7 deletions(-)
 create mode 100644 board/engicam/icorem6/linux_qt5.fragment
 create mode 100644 board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json
 create mode 100644 board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.json
 create mode 100644 board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
 create mode 100644 configs/engicam_imx6qdl_icore_qt5_defconfig

-- 
2.7.4
