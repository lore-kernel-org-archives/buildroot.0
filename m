From: Tim Michals <tcmichals@gmail.com>
Date: Sat, 30 Jan 2016 11:56:56 -0600
Subject: [Buildroot] Loading modules with device tree after rootfs is mounted
Message-ID: <CANqk_c9oEnF32aeNnPzki0vr1E4-s-xxGyC5+dHAwAw6rHkLAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've created new buildroot defconfig for Udoo Neo board, u-boot, linux
kernel boots and busybox prompt is active and accepts commands.  The issue
is several drivers (wifi, camera, etc) are built as kernel modules and
stored on ext4 rootfs.  How can the kernel load these modules via the
device tree from the rootfs?

Udoo team has a lubuntu image, and the drivers are loaded after rootfs is
mounted, so I'm confused how this works.



Thank your for help.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160130/d3a1f1fc/attachment.html>
