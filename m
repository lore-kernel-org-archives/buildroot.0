From: Jerry Huang <jerry.huang@nxp.com>
Date: Fri, 7 Feb 2020 01:21:25 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v4 5/9] boot/arm-trusted-firmware:
 introduce two new options
In-Reply-To: <20200205132922.2bce41ac@windsurf>
References: <20200205105227.13698-1-jerry.huang@nxp.com>
 <20200205105227.13698-5-jerry.huang@nxp.com>
 <20200205132922.2bce41ac@windsurf>
Message-ID: <VI1PR04MB5136142D34A5425980C9429BFE1C0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Wednesday, February 5, 2020 8:29 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; olteanv at gmail.com; michael at walle.cc;
> geomatsi at gmail.com; matthew.weber at collins.com
> Subject: [EXT] Re: [Buildroot] [PATCH v4 5/9] boot/arm-trusted-firmware:
> introduce two new options
> 
> Caution: EXT Email
> 
> Hello,
> 
> On Wed,  5 Feb 2020 18:52:23 +0800
> Changming Huang <jerry.huang@nxp.com> wrote:
> 
> > two new options for arm-trusted-firmware:
> > 1. BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS
> >       - for additional targets, E.G. "pbl".
> 
> This option was already added in commit
> 05b8c7da6de863561d66717735a4870f2766454c, which is part of Buildroot
> master.
> 
> > 2. BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES
> >       - for additional dependencies, E.G. "host-qoriq-rcw"
> >
> > Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> 
> No need to resend just for that, though, it can be fixed when applying.
Sure, I will remove this options from next version.

> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.c
> om&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7Cc92f05de22194ab439
> ff08d7aa3709bc%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6371
> 65025674223306&amp;sdata=wsI3e76EHN6NNtKknPiZpBnWAn1FyALHUgbjp4
> LKAdw%3D&amp;reserved=0
