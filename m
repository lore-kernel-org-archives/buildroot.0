From: =?UTF-8?Q?Jer=C3=B4nimo_Lopes?= <lopesjeronimo@gmail.com>
Date: Tue, 3 Jun 2014 11:29:54 -0300
Subject: [Buildroot] Build cross gdb and eclipse plugin
Message-ID: <CAM5ihG8wmEYwx7aZRT7+ypTHr3C3AbkzG_LJX8RZu=Qy1Vtm5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First off all, sorry if this isn't the right place to post this.

I'm using buildroot, with external toolchain Sourcery CodeBench ARM
2013.11. I'm also using buildroot eclipse plugin.

If I set BR2_PACKAGE_HOST_GDB [=y] buildroot creates a file named
'arm-linux-gdb'.

But if I create a new debug configuration in eclipse, it sets the path for
the GDB debbuger as
'"buildroot_folder"/output/host/usr/bin/arm-none-linux-gnueabi-gdb'.

It's not a big problem at all, I just change the name of the file and
everything works, but I no idea how to provide a patch for it.

Jer?nimo Lopes
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140603/b6fa973c/attachment.html>
