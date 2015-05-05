From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 5 May 2015 11:20:07 +0200
Subject: [Buildroot] [PATCH v7 10/13] Vivante drivers: bump to version
	3.10.17-1.0.1
In-Reply-To: <HE1PR04MB1290A44B5B363C5D90272A7CEAD10@HE1PR04MB1290.eurprd04.prod.outlook.com>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-11-git-send-email-jezz@sysmic.org>
 <20150501225109.66e3b7ba@free-electrons.com>
 <20150504151227.GC11312@kwain>
 <20150504171543.68eb13fc@free-electrons.com>
 <CAAMH-ysBAw_r4XrTZBRvfMZnKd+py8KKZEWxmJm_-Tm9AcHmKQ@mail.gmail.com>
 <HE1PR04MB1290A44B5B363C5D90272A7CEAD10@HE1PR04MB1290.eurprd04.prod.outlook.com>
Message-ID: <CAAMH-yv2L-H8yYcdzoxaU4-TWhsywMTgmi9OD+CPz-sGOZwffw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice

On Tue, May 5, 2015 at 11:15 AM, Fabrice Mousset | GEOCEPT GmbH
<fabrice.mousset@geocept.com> wrote:
> Gary,
>
>> I'll try it out, but why don't we update the package and the kernel versions at
>> once. A quick glance at the git repos shows that there's a
>> 3.10.53 version for QMX6, Nitrogen6x and all the Freescale boards.
>> Then the Wandboard doesn't appear to be maintained as it's still using a 3.0.x
>> kernel and the riotboard uses mainline kernel.
>>
>
> In fact, the Wandboard Linux kernel 3.10.53 is available on github ==> https://github.com/wandboard-org/linux/tree/wandboard_imx_3.10.53_1.1.0_ga

Thanks for sharing this link! I actually wanted to say that the
Wandboard *defconfig* in Buildroot isn't maintained. Once the packages
will be updated, would you be willing to update the Wandboard
defconfig if you happen to have the board?

Thanks,
Gary
