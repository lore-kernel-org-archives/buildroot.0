From: Czybor Michael <m.czybor@baur.at>
Date: Thu, 20 Sep 2018 09:33:48 +0000
Subject: [Buildroot] STM32F767ZI Nucleo
In-Reply-To: <20180920110846.006e31ac@windsurf>
References: <f844ef8357b0480a9d8e8cf8e1414c44@baur.at>
 <20180920100328.3d5ff046@windsurf>	<bd252999392341cda6bec222f0e416dc@baur.at>
 <20180920110846.006e31ac@windsurf>
Message-ID: <a78201d496ec473681000194f412b3da@baur.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

you wrote: " I have no idea which .bin files you're talking about."

the "binary stuff" could be the bootloader, is this right?

I found four versions (not five :-)):

a.) stm32f429i-disco.bin
b.) stm32f469i-disco.bin
c.) stm32429i-eval.bin
d.) stm32746g-eval.bin

But I started the build process only with one configuration?

One more question about the device-tree-file. If I like to use UIO-Devices, than I must edit the device-tree.

1.) Can I use UIO-Device-Drivers?

2.) How do I input a different device tree?

Thank you for your help and I see what my next steps are!

Best Regards,
Michael

-----Urspr?ngliche Nachricht-----
Von: Thomas Petazzoni [mailto:thomas.petazzoni at bootlin.com] 
Gesendet: Donnerstag, 20. September 2018 11:09
An: Czybor Michael
Cc: buildroot at busybox.net
Betreff: Re: [Buildroot] STM32F767ZI Nucleo

Hello,

On Thu, 20 Sep 2018 09:04:01 +0000, Czybor Michael wrote:

> thank you for your quick reply.
> 
> 1.) What is the minimum RAM-Size to run linux?

It depends on how much tuning you're ready to make. Without doing a lot
of tuning, I would say 8 MB of RAM is really the minimum. And indeed
the STM32F4/STM32F7 platforms that can run Linux have 8 or 16 MB of
external RAM: https://elinux.org/STM32#STM32F4_based.

> 2.) Output files:
> 
> I read that document, before I wrote my question. I found a rootfs.cpio folder and I gues it is the rootfs.
> 
> But what is a *.bin file?

A file containing some binary stuff.

> Why I have five *.bin file versions?

I have no idea which .bin files you're talking about.

> And what is a xipImage-file?

A Linux kernel image.

> Finally, what is a *.dtb file?

A Device Tree file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
