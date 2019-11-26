From: Jerry Huang <jerry.huang@nxp.com>
Date: Tue, 26 Nov 2019 08:15:29 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v2 08/10]
 package/freescale-qoriq/fsl-qoriq-rcw:Enable IIC5_PMUX and CLK_OUT_PMUX for
 GPIO
In-Reply-To: <20191125231342.714eadfb@windsurf>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-9-jerry.huang@nxp.com>
 <20191125231342.714eadfb@windsurf>
Message-ID: <VI1PR04MB5136F74857ABE250FA32C415FE450@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, November 26, 2019 6:14 AM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; michael at walle.cc; matthew.weber at collins.com;
> geomatsi at gmail.com
> Subject: [EXT] Re: [Buildroot] [PATCH v2 08/10]
> package/freescale-qoriq/fsl-qoriq-rcw:Enable IIC5_PMUX and CLK_OUT_PMUX
> for GPIO
> 
> Caution: EXT Email
> 
> On Thu, 21 Nov 2019 18:23:22 +0800
> Changming Huang <jerry.huang@nxp.com> wrote:
> 
> > From: Jerry Huang <jerry.huang@nxp.com>
> >
> > Because GPIO is used as interrupt for eNETC PHY and Micro-bus,
> > IIC5_PMUX and CLK_OUT_PMUX are enabled for GPIO.
> >
> > Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> 
> What is the upstream status of those patches? Will NXP merge them in the rcw
> project, and will make them available as part of a future RCW release ?
These two patches are for SD and eMMC boot, which are not pushed to upsteam.
If I use xSPI boot, the RCW setting is correct without these two patches.
As you mentioned in the reply of patch 10/10, if just one defconfig is pushed to buildroot, 
I can remove these two patches.

> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.c
> om&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7C10089319800b42973
> 24908d771f4bd40%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> 103168375059339&amp;sdata=j0xbOhtQRtJfFqW%2BefA1mhEvCczUGIdbk0M
> COPIzg0k%3D&amp;reserved=0
