From: Jerry Huang <jerry.huang@nxp.com>
Date: Thu, 21 Nov 2019 10:42:20 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v2 02/10]
 package/freescale-qoriq/fsl-qoriq-rcw: move rcw into freescale-qoriq and
 rename it
In-Reply-To: <cf56bfbc478fb3ccf413f5d421f15477@walle.cc>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-3-jerry.huang@nxp.com>
 <cf56bfbc478fb3ccf413f5d421f15477@walle.cc>
Message-ID: <VI1PR04MB51363AD857A07CC924D90BA9FE4E0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Michael,

Best Regards
Jerry Huang

> -----Original Message-----
> From: Michael Walle <michael@walle.cc>
> Sent: Thursday, November 21, 2019 6:35 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; geomatsi at gmail.com;
> matthew.weber at collins.com; thomas.petazzoni at bootlin.com
> Subject: [EXT] Re: [PATCH v2 02/10] package/freescale-qoriq/fsl-qoriq-rcw: move
> rcw into freescale-qoriq and rename it
> 
> Caution: EXT Email
> 
> Am 2019-11-21 11:23, schrieb Changming Huang:
> > From: Jerry Huang <jerry.huang@nxp.com>
> >
> > Move package/rcw into package/freescale-qoriq, and rename it to
> > fsl-qoriq-rcw.
> >
> > Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> > ---
> > changes since v1:
> > 1. new patch
> > 2. move rcw to sub-directory freescale-qoriq 3. rename to
> > fsl-qoriq-rcw
> 
> shouldn't be the naming consistent with the sub-directory? I know there is
> already a freescale-imx and the packages are only named imx-*. On the other
> hand, the variable names will be longer. Mhh.
If keep the same with sub-directory, it is too long, so I use the short name "fsl" to replace "freescale".
Actually, the FSL is used widely before freescale is merge into NXP.

> [snip]
> 
> -michael
