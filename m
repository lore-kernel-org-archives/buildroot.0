From: Hajime Yamasaki Vukelic <hayavuk@gmail.com>
Date: Thu, 11 Feb 2016 21:36:38 +0100
Subject: [Buildroot] Booting from cramfs image
Message-ID: <CAJrvd8PF5qwZxm3N0b73fJ+Ea4OFMTf-1unN1uhf7FdZBivvSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

I have an amlogic board (WetekPlay if anyone's familiar with it), and I
have a kernel image with initramfs, and a rootfs image in cramfs format.
The files involved are `boot.img` which is built using kernel uImage file,
DTB, and initramfs in cpio.gz format, and `rootfs.cramfs`. Both are written
to a FAT32 microSD card.

I'm trying to get the initramfs loop mount the cramfs image and switch_root
to it, but I keep getting kernel panic. The init script looks like this:

    https://gist.github.com/foxbunny/936438bf2ba67c2a5879

The error message:

    https://gist.github.com/foxbunny/fd9ceb120e8fe5a631aa

If someone could give me pointers on how to debug or fix this, I would
greatly appreciate it.


-- Hajime
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160211/39dbdbab/attachment.html>
