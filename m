From: Jed Evnull <jedevnull@gmail.com>
Date: Sat, 15 Oct 2011 16:12:22 -0400
Subject: [Buildroot] buildroot noob help!
Message-ID: <CAFo83mG5Gx+LoZHP3j8-avDGXoKiHQxKLUcAM2y4rc8Ok1M_rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I need to compile packages for arm with uclibc and statically link them. Am
I selecting the right tool with buildroot?  I compiled  buildroot-2011.08
with qemu_arm_versatile_defconfig.  The generated cross-compiler compiles
simple hello world programs w/o problems, but fails with typical autoconf
source packages.
I tried to chroot into the generated image (chroot myimage /bin/sh --login)
to compile from there, but chroot fails with /bin/sh not found.  I can
cross-compile with code sourcery's toolchain, but the binaries are h-u-g-e.
I did something similar years ago with scratchbox and maemo.  Please help a
noob!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111015/6a093780/attachment.html>
