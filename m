From: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
Date: Wed, 31 Aug 2016 20:58:48 -0400
Subject: [Buildroot] [PATCH 0/2] configs: Add ts4900 basic board support
Message-ID: <1472691530-17643-1-git-send-email-mathieu.audat@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This serie of patches add the support for the TS-4900 SoM manufactured by
Technologic Systems based on an i.MX6 SoC from Freescale.

Mathieu Audat (2):
  ts4900-fpga: add ts4900-fpga package
  configs: add defconfig for TS-4900

 board/technologic/ts4900/genimage.cfg  | 10 ++++++++
 board/technologic/ts4900/post-image.sh | 20 +++++++++++++++
 board/technologic/ts4900/readme.txt    | 45 ++++++++++++++++++++++++++++++++++
 configs/ts4900_defconfig               | 21 ++++++++++++++++
 package/Config.in                      |  1 +
 package/ts4900-fpga/Config.in          |  6 +++++
 package/ts4900-fpga/ts4900-fpga.hash   |  2 ++
 package/ts4900-fpga/ts4900-fpga.mk     | 18 ++++++++++++++
 8 files changed, 123 insertions(+)
 create mode 100644 board/technologic/ts4900/genimage.cfg
 create mode 100755 board/technologic/ts4900/post-image.sh
 create mode 100644 board/technologic/ts4900/readme.txt
 create mode 100644 configs/ts4900_defconfig
 create mode 100644 package/ts4900-fpga/Config.in
 create mode 100644 package/ts4900-fpga/ts4900-fpga.hash
 create mode 100644 package/ts4900-fpga/ts4900-fpga.mk

-- 
1.9.1
