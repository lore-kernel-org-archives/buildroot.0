From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Wed, 30 Sep 2015 13:45:55 -0300
Subject: [Buildroot] Wandboard Solo/Dual/Quad support
Message-ID: <CANu7NGtUCHKhNDZwA7im_nCgB82NXYdwzr6gjGnq0b+yGOmVBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm working on the config files for the wandboard solo, dual and quad, and
I have a few questions:

1. Are you guys OK with this organization?

$ ls configs/wandboard*
configs/wandboard_solo_defconfig
configs/wandboard_dual_defconfig
configs/wandboard_quad_defconfig

$ tree board/wandboard/
board/wandboard/
??? dual
?   ??? readme.txt
?   ??? uboot-env.txt
??? genimage.cfg
??? post-image.sh
??? quad
?   ??? readme.txt
?   ??? uboot-env.txt
??? solo
    ??? readme.txt
    ??? uboot-env.txt

2. After renaming wandboard_defconfig to wandboard_solo_defconfig, I will
bump its u-boot and kernel version. Should I send you two separate patches
(renaming and then bumping versions) or just one patch including both
changes?

Best regards,

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150930/9b66a6ac/attachment.html>
