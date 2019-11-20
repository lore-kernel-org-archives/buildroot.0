From: Jerry Huang <jerry.huang@nxp.com>
Date: Wed, 20 Nov 2019 09:54:01 +0000
Subject: [Buildroot] [EXT] Re: [PATCH 1/9] package/rcw: upgrade the rcw
 version to LSDK-19.09
In-Reply-To: <20191120104539.37da1c64@windsurf.home>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-2-jerry.huang@nxp.com>
 <8ef6b0156f54102d837ecfc429ae810d@walle.cc>
 <20191120103204.19a15798@windsurf.home>
 <CANQCQpbZdy0q_qvRf8AWKu8wVFTNh8o9fjY7=UDeiKmU8zhnGw@mail.gmail.com>
 <20191120104539.37da1c64@windsurf.home>
Message-ID: <VI1PR04MB51369937EA1FB9EA5A6D0753FE4F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Wednesday, November 20, 2019 5:46 PM
> To: Matthew Weber <matthew.weber@collins.com>
> Cc: Michael Walle <michael@walle.cc>; Jerry Huang <jerry.huang@nxp.com>;
> buildroot mailing list <buildroot@busybox.net>
> Subject: [EXT] Re: [Buildroot] [PATCH 1/9] package/rcw: upgrade the rcw version
> to LSDK-19.09
> 
> Caution: EXT Email
> 
> On Wed, 20 Nov 2019 03:38:40 -0600
> Matthew Weber <matthew.weber@collins.com> wrote:
> 
> > > True, rcw is very short and quite generic. Matt, what do you think?
> >
> > Michael, good points, maybe we could append a prefix to make it
> > freescale-qoriq-rcw?
> 
> Yes, freescale-qorqiq-rcw is good.
I create sub-directory " freescale-qoriq" in patch 0005-package-freescale-qoriq-xxx, so the RCW package can be moved into that?
Because RCW is related with hardware for QorIQ serial platforms.

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.c
> om&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7Ca79baf082b6c4b3d45
> 3c08d76d9e67fa%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6370
> 98399419780949&amp;sdata=egdHxRKFOKtMuW2CusUxAU%2BLiAMXdZQ85m
> bUBJGCRPw%3D&amp;reserved=0
