From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 11:08:46 +0200
Subject: [Buildroot] STM32F767ZI Nucleo
In-Reply-To: <bd252999392341cda6bec222f0e416dc@baur.at>
References: <f844ef8357b0480a9d8e8cf8e1414c44@baur.at>
 <20180920100328.3d5ff046@windsurf>
 <bd252999392341cda6bec222f0e416dc@baur.at>
Message-ID: <20180920110846.006e31ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
