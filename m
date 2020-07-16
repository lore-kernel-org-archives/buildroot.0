From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 16 Jul 2020 16:48:34 +0200
Subject: [Buildroot] [PATCH 0/3] imx: bump graphics version to 6.4.0.p2.4
Message-ID: <20200716144837.701680-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series bumps the i.MX graphics component to their 6.4.0.p2.4
version which is coming from NXP release 5.4.24-2.1.0 [1][2].

This was tested on Nitrogen8M (i.MX8MQ) on top of the Weston pending
series [3].

Let me know if you have any questions.

Regards,
Gary


[1] https://source.codeaurora.org/external/imx/meta-imx/tree/meta-bsp/recipes-graphics/imx-gpu-viv?h=zeus-5.4.24-2.1.0
[2] https://source.codeaurora.org/external/imx/meta-imx/tree/meta-bsp/recipes-graphics/imx-gpu-g2d?h=zeus-5.4.24-2.1.0
[3] http://patchwork.ozlabs.org/project/buildroot/list/?series=184556

Gary Bisson (3):
  package/freescale-imx/imx-gpu-g2d: bump to version 6.4.0.p2.4
  package/freescale-imx/imx-gpu-viv: bump to version 6.4.0.p2.4
  package/freescale-imx/kernel-module-imx-gpu-viv: bump to version
    6.4.0.p2.4

 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash        | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk          | 4 ++--
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash        | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk          | 4 ++--
 .../kernel-module-imx-gpu-viv.hash                        | 2 +-
 .../kernel-module-imx-gpu-viv.mk                          | 2 +-
 6 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.27.0
