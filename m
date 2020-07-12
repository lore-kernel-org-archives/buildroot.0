From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 11:02:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/firmware-imx:
 bump version to 8.8
In-Reply-To: <20200710081655.23056-1-maeva.manuel@oss.nxp.com>
References: <20200710081655.23056-1-maeva.manuel@oss.nxp.com>
Message-ID: <20200712110207.398929f4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Jul 2020 10:16:54 +0200
Maeva Manuel <maeva.manuel@oss.nxp.com> wrote:

> This version is aligned with 5.4.24_2.1.0 NXP Linux BSP.
> 
> License was updated from:
> LA_OPT_NXP_Software_License v10 December 2019
> to:
> LA_OPT_NXP_Software_License v11 February 2020
> which explains the change of EULA/COPYING license files.
> 
> Tested-by: Julien Olivain <julien.olivain@oss.nxp.com>
> [Julien: tested on i.MX8M Mini EVK Rev A with LPDDR4]
> Tested-by: Stephane Viau <stephane.viau@oss.nxp.com>
> [Stephane: tested on i.MX8MQ and i.MX8MN]
> Tested-by : Maeva Manuel <maeva.manuel@oss.nxp.com>
> [Maeva: tested on i.MX8QM MEK rev B0 and i.MX8QXP MEK rev B0]
> Signed-off-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
> ---
>  package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
>  package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Let me take this opportunity to say I'm really happy to see several
engineers from NXP contribute directly to Buildroot. So thank you
Maeva, Julien and St?phane for all your contributions on NXP platform
support! Of course, thanks as well to Gary, who has been working on NXP
platform support in Buildroot for many years!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
