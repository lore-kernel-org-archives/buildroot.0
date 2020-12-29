From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 29 Dec 2020 23:03:56 +0100
Subject: [Buildroot] [PATCH 0/3] imx: gpu: bump to 6.4.3.p1.0
Message-ID: <20201229220359.1048766-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series bumps all the NXP graphics packages to their 6.4.3.p1.0
version as found in NXP 5.4.70_2.3.0 release.

It also cleans up the imx-gpu-viv package as its archive layout has changed,
removing the need to dance around with symlinks to the proper backend
Each backend-specific lib is now in its own folder that can be copied over.
This fixes the previous update made to the package.

Let me know if you have any questions.

Regards,
Gary

Gary Bisson (3):
  package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p1.0
  package/freescale-imx/imx-gpu-g2d: bump to version 6.4.3.p1.0
  package/freescale-imx/kernel-module-imx-gpu-viv: bump to version
    6.4.3.p1.0

 .../imx-gpu-g2d/imx-gpu-g2d.hash              |  8 ++--
 .../freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk  |  4 +-
 package/freescale-imx/imx-gpu-viv/Config.in   |  2 +-
 .../imx-gpu-viv/imx-gpu-viv.hash              |  8 ++--
 .../freescale-imx/imx-gpu-viv/imx-gpu-viv.mk  | 40 +++++--------------
 .../kernel-module-imx-gpu-viv.hash            |  2 +-
 .../kernel-module-imx-gpu-viv.mk              |  2 +-
 7 files changed, 22 insertions(+), 44 deletions(-)

-- 
2.29.2
