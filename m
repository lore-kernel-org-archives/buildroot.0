From: Vladimir Oltean <olteanv@gmail.com>
Date: Thu, 9 Apr 2020 15:16:36 +0300
Subject: [Buildroot] how to make two defconfig simultaneously
In-Reply-To: <20200409133434.20276005@windsurf.home>
References: <VI1PR04MB513697495A894BC827B3CF0DFEC10@VI1PR04MB5136.eurprd04.prod.outlook.com>
 <20200409133434.20276005@windsurf.home>
Message-ID: <CA+h21hpmV55Nh7HUA5WZ3QKU+yCPsnoLOVuNge8VyMbbK6EtHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 9 Apr 2020 at 14:34, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Thu, 9 Apr 2020 08:13:52 +0000
> Jerry Huang <jerry.huang@nxp.com> wrote:
>
> > Hi, all guys,
> > Is there any mechanism to make two defconfig simultaneously ?
> > For example:
> > "make xxx_defcofnig yyy_defconfig"
>
> It is not clear what you want to achieve. Do you want to build
> xxx_defconfig and yyy_defconfig as two separate configurations and two
> separate builds ?
>
> Or do you want to combine them together because each describes only one
> part of the overall system ?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

I would assume the question is about merging a defconfig with multiple
fragments.

Thanks,
-Vladimir
