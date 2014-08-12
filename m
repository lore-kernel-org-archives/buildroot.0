From: Hamza Farooq <hamzahfrq.sub@gmail.com>
Date: Tue, 12 Aug 2014 15:47:22 +0200
Subject: [Buildroot] Buildroot for Jetson TK1
Message-ID: <CAJ--JmzmXV9RF+RAb4w4GUTgW4WU_ozHbKK-p=zFfMJRh+zsPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

I am building rootfs with X windows support for Nvidia Tegra based Jetson
TK1 board.

I am not able to get X server running. The Nvidia rootfs uses nvidia xf86
video driver which is not available in the drivers list for X server in
buildroot. I have made several rootfs systems with varying configurations
and somehow one of them does have nvidia driver in it (I can see it in xorg
-configure) and this system does work. I am, however, not able to reproduce
it. Is there a configuration option in menuconfig that might have
disappeared?

I am not sure what I did but I can see in the working system that both the
nvidia driver and the nvidia libraries (in /usr/lib) are present. I have
been trying to get the system working with nv, fbdev and vesa drivers but
have got zero success. If someone has used nvidia board before (with
nouveau or any other driver) I'll be glad to know how it was made possible

Any pointers will be highly appreciated
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140812/f3ab568c/attachment.html>
