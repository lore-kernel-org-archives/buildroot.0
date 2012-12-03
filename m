From: Santhosh Ramani <srcoolz@gmail.com>
Date: Mon, 3 Dec 2012 14:28:14 -0600
Subject: [Buildroot] Problem with NFS boot
In-Reply-To: <50BB309F.606@relinux.de>
References: <CADKZYYLt90YY8rm4SCuqRN2SsAGqjXhQM7t5hQydpV9o7ZtT+A@mail.gmail.com>
 <50BB309F.606@relinux.de>
Message-ID: <CADKZYYJZ5Y6BqUwdN9MxCHE70Li8=SKV-WRBrBj=zYwQ3c7U2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stephen,

Thanks for your reply again, yes the rootfs are the same and the Linux
kernel is also the same since I tar the kernel and then buildroot uses that
as my custom kernel.

The only reason to not use the buildroot system to create the kernel image
is that it builds clean and this increases the build times. I would like to
get to a point where I can fix the rootfs temporarily, get the linux kernel
cleaned up and then go to the rootfs fixup.

Any thoughts on this one? In either case, the buildroot process should
create an identical kernel as compared to the TI -sdk should it not - if
the configurations are the same. Which I'm sure they are...

Thank you
Regards

Santhosh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121203/97476e61/attachment.html>
