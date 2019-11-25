From: Jerry Huang <jerry.huang@nxp.com>
Date: Mon, 25 Nov 2019 06:25:36 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v2 07/10]
 package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
In-Reply-To: <20191122120551.5f8abe89@windsurf.home>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-8-jerry.huang@nxp.com>
 <bdf9c08ab88c1a965ec665023a52309d@walle.cc>
 <VI1PR04MB51367BB9692EC714A7667E70FE490@VI1PR04MB5136.eurprd04.prod.outlook.com>
 <20191122120551.5f8abe89@windsurf.home>
Message-ID: <VI1PR04MB5136008869D86216E5C6F230FE4A0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas and all guys,

I got some feedback from internal company, because Freescale is merged into NXP, we need to use the company NXP, instead of Freescale.
So, need some modification for all patches of the board ls1028ardb:
board/nxp
configs/nxp_ls1028ardb*
package/nxp-qoriq/

any comment about that?

Best Regards
Jerry Huang

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Friday, November 22, 2019 7:06 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: Michael Walle <michael@walle.cc>; buildroot at busybox.net;
> geomatsi at gmail.com; matthew.weber at collins.com
> Subject: Re: [EXT] Re: [PATCH v2 07/10]
> package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
> 
> Caution: EXT Email
> 
> Hello,
> 
> On Fri, 22 Nov 2019 10:40:42 +0000
> Jerry Huang <jerry.huang@nxp.com> wrote:
> 
> > > There is already an FREESCALE_IMX_EXTRACT_HELPER macro. I guess that
> > > should be renamed and used here.
> >
> > I changed this codes accordance with freescale-imx, create new option
> > FREESCALE_QORIQ_EXTRACT_HELPER Will post it to maillist marked "v3"
> 
> Could you wait a bit before sending v3, so that some time is given for people to
> review the patch series? Maybe wait until Monday.
> 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.c
> om&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7Ce3bcae6699d7446e1
> 20d08d76f3bf133%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> 100175553574097&amp;sdata=nymmd1QloyWLS8NkxwcTksguJfxjL7%2FafehtP
> tc%2B%2FFE%3D&amp;reserved=0
