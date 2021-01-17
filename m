From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 16 Jan 2021 23:06:49 -0300
Subject: [Buildroot] [PATCH v2 1/8] package/freescale-imx/firmware-imx:
 bump version to 8.10
In-Reply-To: <2831c795-29b1-3b7c-f4a6-22d41a8fe9e1@gmail.com>
References: <20210105152420.26379-1-stephane.viau@oss.nxp.com>
 <20210105152420.26379-2-stephane.viau@oss.nxp.com>
 <0f9e83af-c4fb-50f2-feeb-9768a97aa94d@gmail.com>
 <PA4PR04MB7920F971C3C02747462F012DA7A60@PA4PR04MB7920.eurprd04.prod.outlook.com>
 <2831c795-29b1-3b7c-f4a6-22d41a8fe9e1@gmail.com>
Message-ID: <CAOMZO5AH_om8nG1Bn=-Etf2SNY7E5BmgDu_gPhz_6X2NaeXVHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sat, Jan 16, 2021 at 7:45 PM Romain Naour <romain.naour@gmail.com> wrote:

> Fabio, do you have an opinion ?
>
> It seems BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA install the same firmware than the
> one provided by firmware-imx package. Also BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA
> in not used by any in-tree defconfigs.
>
> If you're ok, we should remove it.

Yes, agree. Only having the firmware-imx package is enough.

Thanks
