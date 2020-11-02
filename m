From: Sadiq Hussain Muchumarri <sadiq1194@gmail.com>
Date: Mon, 2 Nov 2020 15:32:26 +0530
Subject: [Buildroot] Booting QEMU
Message-ID: <CAB9G97pWnpMk+nDQ6=KEya5DupyyxFdt_uB7=MexNok7mR8s0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I've followed the below steps for a QEMU build:

1)cloned the LTS version of buildroot from GitHub

2)make clean

3)make distclean

4)make qemu_arm_vexpress_defconfig

5)make

All the above steps are succesfull and I can see the artifacts in
output/images directory.

May I know how do I boot the QEMU now?
I see a start-qemu.sh script under output/images directory.

But, that doesn't work out of the box as it says:
"Invalid SD card size: 60MiB"

Any alternative to this?
Thanks:)

Regards
Hussain
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201102/82bc9d32/attachment.html>
