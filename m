From: xu min <xuminready@gmail.com>
Date: Thu, 31 Dec 2020 14:15:12 -0800
Subject: [Buildroot] [PATCH 1/1] configs/rock64: update defconfig
In-Reply-To: <20201231174145.64913277@windsurf>
References: <20201215004903.8829-1-xuminready@gmail.com>
 <20201231174145.64913277@windsurf>
Message-ID: <CAMpS7mTOZZRnHW0B3j5eT2yBMTX6VenG-V5jen3c45TEVxyn7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Awesome, thanks!

On Thu, Dec 31, 2020 at 8:41 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Tue, 15 Dec 2020 00:49:03 +0000
> Min Xu <xuminready@gmail.com> wrote:
>
> > Revert "configs/rock64_defconfig: remove defconfig"
> a5fa2469e6506ea4f5a91739aa099f63a10e45ce
> >
> > bump uboot from 2017.09 to release-2020-07 from
> ayufan-rock64/linux-mainline-u-boot
> >
> > Signed-off-by: Min Xu <xuminready@gmail.com>
>
> Thanks, I've applied to master, with two changes. First, I changed the
> commit title to "configs/rock64: new defconfig", as this commit is not
> "updating" a defconfig, it's really adding a new one.
>
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3328"
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/*.elf"
>
> I've added a fixed version of ATF here instead of relying on the
> default "latest" version, which can change over time.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


-- 

*Best Regards*

*XuMin's Ready?*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201231/20cfe1c6/attachment.html>
