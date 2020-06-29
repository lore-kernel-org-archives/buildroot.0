From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Mon, 29 Jun 2020 10:25:44 +0200
Subject: [Buildroot] [PATCH v2 0/4] package/freescale-imx: clean-up proposal
Message-ID: <1593419148-26821-1-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In reponse to the comments received on the first version [1], here is
a second attempt for the firmware-imx package clean up.
Feedback is welcome.

BR,
Stephane.

[1] http://lists.busybox.net/pipermail/buildroot/2020-June/285571.html

Stephane Viau (4):
  package/freescale-imx: Move DDR FW choice down to firmware-imx package
  package/freescale-imx/firmware-imx: Add option for all i.MX FW needs
  package/freescale-imx/firmware-imx: Clean up the image/target semantic
  package/freescale-imx/firmware-imx: Fix sdma/vpu firmware install path

 configs/freescale_imx8mnevk_defconfig              |  2 +-
 package/freescale-imx/Config.in                    |  6 --
 package/freescale-imx/firmware-imx/Config.in       | 58 ++++++++++++++++--
 package/freescale-imx/firmware-imx/firmware-imx.mk | 69 +++++++++++++++-------
 4 files changed, 103 insertions(+), 32 deletions(-)

-- 
2.7.4
