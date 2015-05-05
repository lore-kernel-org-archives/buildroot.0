From: Fabrice Mousset | GEOCEPT GmbH <fabrice.mousset@geocept.com>
Date: Tue, 5 May 2015 13:47:37 +0000
Subject: [Buildroot] [PATCH v7 10/13] Vivante drivers: bump to version
 3.10.17-1.0.1
In-Reply-To: <CAAMH-yuv542b5_EdSJw8L5UcDdPB07Se=EH8vNkb03yZsf6JgQ@mail.gmail.com>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-11-git-send-email-jezz@sysmic.org>
 <20150501225109.66e3b7ba@free-electrons.com>	<20150504151227.GC11312@kwain>
 <20150504171543.68eb13fc@free-electrons.com>
 <CAAMH-ysBAw_r4XrTZBRvfMZnKd+py8KKZEWxmJm_-Tm9AcHmKQ@mail.gmail.com>
 <HE1PR04MB1290A44B5B363C5D90272A7CEAD10@HE1PR04MB1290.eurprd04.prod.outlook.com>
 <CAAMH-yv2L-H8yYcdzoxaU4-TWhsywMTgmi9OD+CPz-sGOZwffw@mail.gmail.com>
 <HE1PR04MB12904DAC27D4138F86E1B391EAD10@HE1PR04MB1290.eurprd04.prod.outlook.com>
 <CAAMH-yuv542b5_EdSJw8L5UcDdPB07Se=EH8vNkb03yZsf6JgQ@mail.gmail.com>
Message-ID: <HE1PR04MB12906D50F43D4AD557CBAE42EAD10@HE1PR04MB1290.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

> Don't worry there's no rush, the GPU package isn't updated yet.
> However it's great to know you are willing to update the defconfig, we will
> ping you as soon as everything is ready.

Okay, so this will not be integrated in next BuildRoot release I presume.

 
> > Which packages should be integrated into the build/image?
> > Of course the Vivante driver, but what else?
> 
> Actually the Vivante package is the ultimate test to perform as it requires a
> match between the libraries and the kernel driver version.
> The rest of the packages (VPU, gstreamer plugins etc...) are good to test but
> not mandatory I'd say.

Okay, seems not to be too complicated to check.

> 
> Thanks,
> Gary

Your welcome ;-)

Fabrice
