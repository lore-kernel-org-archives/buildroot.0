From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 9 Jul 2020 17:12:03 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/freescale-imx/imx-seco: bump
 version to 3.6.3
In-Reply-To: <20200709144457.5682-1-maeva.manuel@oss.nxp.com>
References: <20200708074353.8169-1-maeva.manuel@oss.nxp.com>
 <20200709144457.5682-1-maeva.manuel@oss.nxp.com>
Message-ID: <20200709151203.GA762644@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maeva,

On Thu, Jul 09, 2020 at 04:44:57PM +0200, Maeva Manuel wrote:
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

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Thanks for spinning the v2 quickly and for the contribution.

Regards,
Gary
