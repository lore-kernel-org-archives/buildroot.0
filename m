From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 9 Jul 2020 09:44:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-seco: bump
 version to 3.6.3
In-Reply-To: <VI1PR04MB4976F0AF13CBBEC145861FE09D640@VI1PR04MB4976.eurprd04.prod.outlook.com>
References: <20200708074353.8169-1-maeva.manuel@oss.nxp.com>
 <20200708121459.GA331830@p1g2>
 <VI1PR04MB4976F0AF13CBBEC145861FE09D640@VI1PR04MB4976.eurprd04.prod.outlook.com>
Message-ID: <20200709074440.GA464714@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maeva,

On Thu, Jul 09, 2020 at 06:54:12AM +0000, Maeva Manuel (OSS) wrote:
> Hello Gary,
> 
> License was updated from:
> LA_OPT_NXP_Software_License v10 December 2019
> to:
> LA_OPT_NXP_Software_License v11 February 2020
> which explain the change of EULA/COPYING license files.
> 
> This LA_OPT_NXP_Software_License is used by a wide range proprietary
> binaries/firmwares, from NXP and also 3rd parties (e.g. DDR firmwares,
> VPU firmwares, ...). It is periodically updated with the introduction
> of new products. It's recommended to review it in detail with, if a
> system uses it in production.

Yes that's fine, a simple line to explain the EULA was updated to its
Feb. 2020 version is sufficient, but it should be there.

> Regarding the C0 revision of i.MX8QXP:
> 
> 1) The QXP C0 chip exists publicly, it's on the latest revisions of EVK boards.
> 2) The imx-seco 3.6.3 package (just like the rest of the BSP 5.4.24_2.1.0) adds support for this chip.
> 3) In order not to break the compatibility with the BR imx-seco 2.3.1 package, it remains with B0 support.
> 4) I think it's not a good idea that it's the final script that chooses the right file, because the names often change. This could mean that the script would have to be updated every time the package is updated too. By being in the recipe it collects all the changes in the recipe.
> 5) C0 support should introduce a Kconfig, and this will be done in a future patch.

Fair enough, but same it then should be in the commit log so that people
using C0 firmware know it is coming.

Regards,
Gary
