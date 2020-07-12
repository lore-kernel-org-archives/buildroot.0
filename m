From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 10:55:46 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/freescale-imx/imx-seco: bump
 version to 3.6.3
In-Reply-To: <20200710081655.23056-2-maeva.manuel@oss.nxp.com>
References: <20200710081655.23056-1-maeva.manuel@oss.nxp.com>
 <20200710081655.23056-2-maeva.manuel@oss.nxp.com>
Message-ID: <20200712105546.05b599fd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Jul 2020 10:16:55 +0200
Maeva Manuel <maeva.manuel@oss.nxp.com> wrote:

> This version is aligned with 5.4.24_2.1.0 NXP Linux BSP.
> Firmware file names now include the SoC revision.
> 
> In order not to break the compatibility with the imx-seco 2.3.1 package,
> it remains B0 support for i.MX8QXP MEK.
> C0 support should introduce a Kconfig and this will be done in a future
> patch.
> 
> License was updated from:
> LA_OPT_NXP_Software_License v10 December 2019
> to:
> LA_OPT_NXP_Software_License v11 February 2020
> which explains the change of EULA/COPYING license files.
> 
> Tested-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
> [Maeva: tested on i.MX8QXP MEK (Board rev D1, SoC rev B0)
> and on i.MX8QM MEK (SoC rev B0)]
> Signed-off-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
> ---
> Changes v1 -> v2:
> Suggested by Gary:
>   - Add a commit log comment about license change
>   - Add a commit log comment about the rev C0 support of i.MX8QXP MEK
> ---
>  package/freescale-imx/imx-seco/imx-seco.hash | 6 +++---
>  package/freescale-imx/imx-seco/imx-seco.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
