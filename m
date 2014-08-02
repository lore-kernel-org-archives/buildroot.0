From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Sat, 2 Aug 2014 11:45:58 -0500
Subject: [Buildroot] manipulating raw disk images as non-root user
Message-ID: <CAE9DZUThNrdD2AOHwsJRZG6fJh3=MRGe+Ggnh4ZrRxgXatJvWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I am trying to figure out a way to produce a uSD card image file during my
build process and do it as a non-root user.  I am hoping to do this from a
post image script.

I can create the image file with dd and partition it with parted as a
non-root user.  However, I have not figured out how to format, and populate
the image file.  Tools such as kpartx and losetup seem ideal for this
purpose except that they must be run as root.

Does anyone know of a way to do this using qemu or fuse or related tools?

Thanks,

Dallas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140802/21044f09/attachment.html>
