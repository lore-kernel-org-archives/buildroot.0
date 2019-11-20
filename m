From: Jerry Huang <jerry.huang@nxp.com>
Date: Wed, 20 Nov 2019 10:22:58 +0000
Subject: [Buildroot] [EXT] Re: [PATCH 7/9] package/rcw: Enable IIC5_PMUX
 and CLK_OUT_PMUX for GPIO
In-Reply-To: <20191120103857.52d575f0@windsurf.home>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-8-jerry.huang@nxp.com>
 <20191120101451.34bd8120@windsurf.home>
 <VI1PR04MB5136E760A49DE331036F9F8DFE4F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
 <20191120103857.52d575f0@windsurf.home>
Message-ID: <VI1PR04MB5136463A2E069F992EB4C80FFE4F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks a lot for your suggestion.

Best Regards
Jerry Huang

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Wednesday, November 20, 2019 5:39 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net
> Subject: Re: [EXT] Re: [Buildroot] [PATCH 7/9] package/rcw: Enable IIC5_PMUX
> and CLK_OUT_PMUX for GPIO
> 
> Caution: EXT Email
> 
> On Wed, 20 Nov 2019 09:34:13 +0000
> Jerry Huang <jerry.huang@nxp.com> wrote:
> 
> > > The patches modify only files in ls1028ardb/, and you apply them
> > > when the board name is ls1028ardb, so basically, you could just as
> > > well apply the patches unconditionally, no ?
> > I can change it to apply the patch unconfitionally.
> 
> OK, thanks. Please make sure to submit the patch to the upstream rcw project,
> so that ultimately, we can drop the patches.
> 
> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.c
> om&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7Cb7d1e0c04eef467887
> dc08d76d9d7822%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> 098395434083898&amp;sdata=JUgNCv0ZuKrsxcp%2F9rdqyK6ZFQ11Ic3NacjPuK
> lB6hc%3D&amp;reserved=0
