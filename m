From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Mon, 13 Jul 2020 12:17:11 +0530
Subject: [Buildroot] [PATCH v3 2/2] configs/rock_pi_4: new defconfig
In-Reply-To: <20200712222959.54d8d12c@windsurf.home>
References: <1593893805-8430-1-git-send-email-sunil@amarulasolutions.com>
 <1593893805-8430-3-git-send-email-sunil@amarulasolutions.com>
 <20200712222959.54d8d12c@windsurf.home>
Message-ID: <CAM+7aWv165kA2XxZpU0UZN+GAGB3u3QHx5GTGe8SQb60mczp6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jul 13, 2020 at 2:00 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Sun,  5 Jul 2020 01:46:45 +0530
> Suniel Mahesh <sunil@amarulasolutions.com> wrote:
>
> > Add initial support for RK3399 based rockpi-4 targets (model A, B, C)
> > with below features:
> >
> >       - Custom U-Boot 2020.07-rc4
> >         https://github.com/amarula/u-boot-amarula.git
> >         branch rock-pi
> >       - Linux 5.4.46
> >       - GPT partition layout is being used
> >       - Default packages from buildroot
> >
> > Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> > ---
> > Changes for v3:
> > - no changes
>
> Applied to master with similar changes than the n10 defconfig.
>
> Regarding the use of u-boot-rockchip.bin, I think I very much prefer
> that there is one partition for each bootloader stage. Having this huge
> image u-boot-rockchip.bin, with a huge gap in the middle feels odd, so
> I tend to prefer the solution implemented by your patch as it is.
>
> Of course, please send some updates when the ATF support and U-Boot
> support is fully merged, so that we can use mainline and tagged releases.
>

I will update the target to use mainline u-boot and others once the support
is fully
merged and send patches accordingly. Thanks for the review.


> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200713/49e2a9ee/attachment.html>
