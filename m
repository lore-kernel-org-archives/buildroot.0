From: Peter Morici <pmorici@dev295.com>
Date: Thu, 9 May 2019 20:54:10 -0400
Subject: [Buildroot] initial ram filesystem with pc_x86_64_efi_defconfig
Message-ID: <CA+0GdoM2b3FMCHW2TTn7jxzwLtRZZJy3hDRM7pQLEwSfbakncA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

    I'm trying to get a buildroot system that runs entirely from ram once
booted so that the boot device (ie: a usb drive) can be removed without
causing a problem.

    I tried starting with the pc_x86_64_efi_defconfig and making changes to
enable building initramfs and modifying the post image generation script
but the resulting image caused the machine to crash on boot w/o any useful
feedback.  Is there an existing def config that maybe better suited as a
starting point or some other approach I can take to get the desired result?

Thanks,
-Pete
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190509/125049ea/attachment.html>
