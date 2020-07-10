From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Fri, 10 Jul 2020 14:00:41 +0200
Subject: [Buildroot] [PATCH v3 0/4] package/freescale-imx: clean-up proposal
Message-ID: <1594382445-4464-1-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is the third version of this patch set whose aim is to clean up the
firmware-imx package. Thank you all for the feedback in the previous version.

BR,
Stephane.

Stephane Viau (4):
  package/freescale-imx: Move DDR FW choice down to firmware-imx package
  package/freescale-imx/firmware-imx: Fix sdma/vpu firmware install path
  package/freescale-imx/firmware-imx: Add option for all i.MX FW needs
  package/freescale-imx/firmware-imx: Clean up the image/target semantic

 configs/freescale_imx8mnevk_defconfig              |  2 +-
 package/freescale-imx/Config.in                    |  6 --
 package/freescale-imx/firmware-imx/Config.in       | 52 +++++++++++++++--
 package/freescale-imx/firmware-imx/firmware-imx.mk | 67 ++++++++++++++++------
 4 files changed, 96 insertions(+), 31 deletions(-)

-- 
2.7.4
