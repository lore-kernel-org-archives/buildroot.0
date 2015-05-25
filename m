From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 25 May 2015 20:15:04 +0200
Subject: [Buildroot] BR 2015.02: questions re builds for a B3?
In-Reply-To: <018201d0970c$8786bb20$96943160$@novadsp.com>
References: <016301d09701$da9e8e10$8fdbaa30$@novadsp.com>
 <CAGm1_kswdDzE4C1QrxEjHvcfnV2KRe7Weu9J87br7NgF_HdPFQ@mail.gmail.com>
 <018201d0970c$8786bb20$96943160$@novadsp.com>
Message-ID: <CAGm1_kt550Li788Z4_D1VMq83atzXgabaVvynB8NxhBW4Tj=Sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 25, 2015 at 7:01 PM,  <g4@novadsp.com> wrote:
> Hi Yegor. Thanks and TIA for your patience, which might get tested :)

You're welcome :-)

>>
>> What about just using upstream kernel? Select 4.0.4, omap2plus_defconfig
>> and am335x-boneblack.dtb and you're done.
>>
>
> So I:
>
> 'make menuconfig' for BR.
> Kernel >> custom repo version >> change hash to 4.0.4
> set BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE to
>
> 'output/build/linux-4.0.4/arch/arm/configs/omap2plus_defconfig' ?

BR2_LINUX_KERNEL_DEFCONFIG should just be omap2plus_defconfig, because
it is in-tree defconfig file.

> Then make again to pull+build ...
>
> BR,
>
> Jerry
>
>
>
