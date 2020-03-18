From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2020 11:34:47 +0100
Subject: [Buildroot] ARM qemu versatile defconfig
In-Reply-To: <87y2ry6jkb.fsf@igalia.com>
References: <87y2ry6jkb.fsf@igalia.com>
Message-ID: <20200318113447.709da855@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 18 Mar 2020 11:31:16 +0100
Paulo Matos <pmatos@igalia.com> wrote:

> I am trying to get a emulation environment based on arm 32bits to
> emulate the native environment we have setup with
> raspberrypi3_defconfig.
> 
> The only existing defconfig I can see that could help me with this is
> qemu_arm_versatile_defconfig however, I do not understand what this
> 'versatile' refers to or find any online documentation about it.
> 
> Could someone explain what this 'versatile' defconfig corresponds to in
> terms of emulated hardware? Or is it versatile because you should use
> 'make menuconfig' later to specifically configure it for your needs?

Versatile is one of the ARM machines emulated by Qemu. If you want to
be closer to RPi3, I would suggest to use our
qemu_arm_vexpress_defconfig instead, and follow the instructions of
board/qemu/arm-vexpress/readme.txt to use it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
