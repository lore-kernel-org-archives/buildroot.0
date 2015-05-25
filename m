From: g4 at novadsp.com <g4@novadsp.com>
Date: Mon, 25 May 2015 18:01:59 +0100
Subject: [Buildroot] BR 2015.02: questions re builds for a B3?
In-Reply-To: <CAGm1_kswdDzE4C1QrxEjHvcfnV2KRe7Weu9J87br7NgF_HdPFQ@mail.gmail.com>
References: <016301d09701$da9e8e10$8fdbaa30$@novadsp.com>
 <CAGm1_kswdDzE4C1QrxEjHvcfnV2KRe7Weu9J87br7NgF_HdPFQ@mail.gmail.com>
Message-ID: <018201d0970c$8786bb20$96943160$@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor. Thanks and TIA for your patience, which might get tested :)

> 
> What about just using upstream kernel? Select 4.0.4, omap2plus_defconfig
> and am335x-boneblack.dtb and you're done.
> 

So I:

'make menuconfig' for BR. 
Kernel >> custom repo version >> change hash to 4.0.4
set BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE to 

'output/build/linux-4.0.4/arch/arm/configs/omap2plus_defconfig' ?

Then make again to pull+build ...

BR,

Jerry
