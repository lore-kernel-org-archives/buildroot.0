From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Wed, 19 Nov 2014 08:46:18 +0100
Subject: [Buildroot] [PATCH 1/1] nvidia-tegra23: new package
In-Reply-To: <20141118202246.GG4333@free.fr>
References: <1415202733-13295-1-git-send-email-nicolas.serafini@sensefly.com>
 <20141118202246.GG4333@free.fr>
Message-ID: <546C4ACA.6030008@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 18. 11. 14 21:22, Yann E. MORIN a ?crit :
> Nicolas, All,
>
> On 2014-11-05 16:52 +0100, Nicolas Serafini spake thusly:
>> This patch adds a new package for all libraries, drivers and codecs
>> provided by Nvidia Linux 4 Tegra release 16.4.0.
>
> I'm already working on a package for the Nvidia blobs for i386 and
> x86_64, so I think your submision could fit in that effort.
>
> I'll take a look at this patch and carry it in my branch to see if it
> was posible to commonalise stuff between the Tegra and PC worlds.
>
> Regards,
> Yann E. MORIN.

It's a good idea

This patch was only for Tegra2 and Tegra3 but it's possible to integrate 
blobs for Tegra 4 and Tegra K1 too. It was my idea in a future patch update.

All binaries and docs can be found here
https://developer.nvidia.com/linux-tegra

Let me know if I can help you for the tegra part.

Best regards,

Nicolas Serafini

ps.
I have removed from my response the patch because it's too big and 
always need mailing list admin approval.
