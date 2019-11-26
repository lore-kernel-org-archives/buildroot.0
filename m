From: Jerry Huang <jerry.huang@nxp.com>
Date: Tue, 26 Nov 2019 03:51:15 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v2 03/10]
 package/freescale-qoriq/fsl-qoriq-rcw: upgrade the rcw version to
 LSDK-19.09
In-Reply-To: <20191125221706.716d6b10@windsurf>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-4-jerry.huang@nxp.com>
 <20191125221706.716d6b10@windsurf>
Message-ID: <VI1PR04MB5136D877ED842C18B9811C6EFE450@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, November 26, 2019 5:17 AM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; michael at walle.cc; matthew.weber at collins.com;
> geomatsi at gmail.com
> Subject: [EXT] Re: [Buildroot] [PATCH v2 03/10]
> package/freescale-qoriq/fsl-qoriq-rcw: upgrade the rcw version to LSDK-19.09
> 
> Caution: EXT Email
> 
> Hello,
> 
> On Thu, 21 Nov 2019 18:23:17 +0800
> Changming Huang <jerry.huang@nxp.com> wrote:
> 
> > From: Jerry Huang <jerry.huang@nxp.com>
> >
> > Change the RCW version to LSDK-19.09.
> >
> > Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> 
> The commit title should be:
> 
>         package/<packagename>: bump to version LSDK-19.03
> 
> > diff --git a/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash
> b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash
> > index 7de1ec659a..413db80e6d 100644
> > --- a/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash
> > +++ b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256
> 1421ada9fec10b12ff21cd9ad82f0a835b191cb2dde80f03547764574b1346c3
> rcw-LSDK-18.12.tar.gz
> > +sha256
> 4dca8adeda48836b86aa459cc526dfbb4e0873492682c3c3a828a28b82b7b100
> fsl-qoriq-rcw-LSDK-19.09.tar.gz
> 
> The renaming of the tarball should have happened in patch 02/10, not
> here: we should just see the change of the version number here.
Will do it in patch 02/10

> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.c
> om&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7C31589b42787e4c216f
> 0a08d771ecd598%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> 103134322307809&amp;sdata=DbVJ8Mf3cz97vPhYsoDcxaL169xr3weAoNy99Q
> 9awzc%3D&amp;reserved=0
