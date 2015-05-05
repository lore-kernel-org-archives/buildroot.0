From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 5 May 2015 15:39:53 +0200
Subject: [Buildroot] [PATCH v7 10/13] Vivante drivers: bump to version
	3.10.17-1.0.1
In-Reply-To: <HE1PR04MB12904DAC27D4138F86E1B391EAD10@HE1PR04MB1290.eurprd04.prod.outlook.com>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-11-git-send-email-jezz@sysmic.org>
 <20150501225109.66e3b7ba@free-electrons.com>
 <20150504151227.GC11312@kwain>
 <20150504171543.68eb13fc@free-electrons.com>
 <CAAMH-ysBAw_r4XrTZBRvfMZnKd+py8KKZEWxmJm_-Tm9AcHmKQ@mail.gmail.com>
 <HE1PR04MB1290A44B5B363C5D90272A7CEAD10@HE1PR04MB1290.eurprd04.prod.outlook.com>
 <CAAMH-yv2L-H8yYcdzoxaU4-TWhsywMTgmi9OD+CPz-sGOZwffw@mail.gmail.com>
 <HE1PR04MB12904DAC27D4138F86E1B391EAD10@HE1PR04MB1290.eurprd04.prod.outlook.com>
Message-ID: <CAAMH-yuv542b5_EdSJw8L5UcDdPB07Se=EH8vNkb03yZsf6JgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Tue, May 5, 2015 at 11:58 AM, Fabrice Mousset | GEOCEPT GmbH
<fabrice.mousset@geocept.com> wrote:
> Hi Gary
>
>> Thanks for sharing this link! I actually wanted to say that the Wandboard
>> *defconfig* in Buildroot isn't maintained. Once the packages will be updated,
>> would you be willing to update the Wandboard defconfig if you happen to
>> have the board?
>
> Yes, I've got a Wandboard Quad, so I could upgrade defconfig for the Quad board.
> This should also works for Dual and Solo board, there are minimal differences.
> I'm a little busy at the moment, so I would do this in the next 2 or 3 days.
> Is this okay for you?

Don't worry there's no rush, the GPU package isn't updated yet.
However it's great to know you are willing to update the defconfig, we
will ping you as soon as everything is ready.

> Which packages should be integrated into the build/image?
> Of course the Vivante driver, but what else?

Actually the Vivante package is the ultimate test to perform as it
requires a match between the libraries and the kernel driver version.
The rest of the packages (VPU, gstreamer plugins etc...) are good to
test but not mandatory I'd say.

Thanks,
Gary
