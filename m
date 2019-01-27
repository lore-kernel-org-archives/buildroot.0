From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 27 Jan 2019 12:06:08 +0100
Subject: [Buildroot] Rpi Open Firmware package
Message-ID: <CAJiuCcczHpEGoX7ipPcxUn66UHjPZQCYnKXrHgQ4-T1z4JgYig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I would like to know, if someone try to use the rpi-open-firmware to
load U-boot bootloader for RPI boards ?
https://github.com/christinaa/rpi-open-firmware/

I have a Rpi Zero W and succesfully make it boot the kernel through U-boot.
I would like to boot a bit faster and with an open bootloader (btw I
don't need the VPU).

Is there something I missed or should I be able to quickly boot all
the IPs with this configuration?
RPI bootrom code -> RPI-open-firmware -> U-boot -> Kernel.

Thanks,
Cl?ment
