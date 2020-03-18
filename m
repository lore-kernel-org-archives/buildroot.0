From: Paulo Matos <pmatos@igalia.com>
Date: Wed, 18 Mar 2020 11:31:16 +0100
Subject: [Buildroot] ARM qemu versatile defconfig
Message-ID: <87y2ry6jkb.fsf@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to get a emulation environment based on arm 32bits to
emulate the native environment we have setup with
raspberrypi3_defconfig.

The only existing defconfig I can see that could help me with this is
qemu_arm_versatile_defconfig however, I do not understand what this
'versatile' refers to or find any online documentation about it.

Could someone explain what this 'versatile' defconfig corresponds to in
terms of emulated hardware? Or is it versatile because you should use
'make menuconfig' later to specifically configure it for your needs?

Kind regards,

-- 
Paulo Matos
