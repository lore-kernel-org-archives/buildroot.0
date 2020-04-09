From: Jerry Huang <jerry.huang@nxp.com>
Date: Thu, 9 Apr 2020 12:59:13 +0000
Subject: [Buildroot] [EXT] Re: how to make two defconfig simultaneously
In-Reply-To: <CA+h21hpmV55Nh7HUA5WZ3QKU+yCPsnoLOVuNge8VyMbbK6EtHg@mail.gmail.com>
References: <VI1PR04MB513697495A894BC827B3CF0DFEC10@VI1PR04MB5136.eurprd04.prod.outlook.com>
 <20200409133434.20276005@windsurf.home>
 <CA+h21hpmV55Nh7HUA5WZ3QKU+yCPsnoLOVuNge8VyMbbK6EtHg@mail.gmail.com>
Message-ID: <VI1PR04MB5136D9DF11702AF4DB31D4ACFEC10@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Best Regards
Jerry Huang

> -----Original Message-----
> From: Vladimir Oltean <olteanv@gmail.com>
> Sent: Thursday, April 9, 2020 8:17 PM
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Jerry Huang <jerry.huang@nxp.com>; Heiko Thiery
> <heiko.thiery@gmail.com>; buildroot at busybox.net; Michael Walle
> <michael@walle.cc>; matthew.weber at collins.com; geomatsi at gmail.com
> Subject: [EXT] Re: [Buildroot] how to make two defconfig simultaneously
> 
> Caution: EXT Email
> 
> Hi Thomas,
> 
> On Thu, 9 Apr 2020 at 14:34, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > On Thu, 9 Apr 2020 08:13:52 +0000
> > Jerry Huang <jerry.huang@nxp.com> wrote:
> >
> > > Hi, all guys,
> > > Is there any mechanism to make two defconfig simultaneously ?
> > > For example:
> > > "make xxx_defcofnig yyy_defconfig"
> >
> > It is not clear what you want to achieve. Do you want to build
> > xxx_defconfig and yyy_defconfig as two separate configurations and two
> > separate builds ?
> >
> > Or do you want to combine them together because each describes only
> > one part of the overall system ?
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fboot
> >
> lin.com%2F&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7Ce7d05d28845
> b4814
> >
> 915308d7dc7fe08d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> 722031
> >
> 4094883841&amp;sdata=Sd7B87UCsB8NS3js1OtmDEytOeClhUOFHfXTrhWqsn
> M%3D&am
> > p;reserved=0
> 
> I would assume the question is about merging a defconfig with multiple
> fragments.
Yes, this is my purpose.

> Thanks,
> -Vladimir
