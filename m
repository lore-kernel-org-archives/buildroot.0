From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Wed, 24 Jun 2020 17:23:46 +0200
Subject: [Buildroot] [PATCH 0/2] package/freescale-imx: clean-up proposal
Message-ID: <1593012228-18959-1-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is - as promised [1] - a patch set whose aim is to clean up the
firmware-imx package. I believe this may help installing EPDC fw, SDMA FW
and so on based on the actual need from each platform and respond to [2].

BR,
Stephane.

[1] http://lists.busybox.net/pipermail/buildroot/2020-June/284032.html
[2] http://lists.busybox.net/pipermail/buildroot/2020-June/285218.html

Stephane Viau (2):
  package/freescale-imx: Add option for all i.MX FW needs
  package/freescale-imx/firmware-imx: Clean up the image/target semantic

 package/freescale-imx/Config.in                    | 39 ++++++++++++
 package/freescale-imx/firmware-imx/firmware-imx.mk | 70 +++++++++++++++++-----
 2 files changed, 93 insertions(+), 16 deletions(-)

-- 
2.7.4
