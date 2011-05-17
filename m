From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2011 09:47:56 +0200
Subject: [Buildroot] Demo rootfs of Fabrice Bellard new x86 emulator built
 with Buildroot
Message-ID: <20110517094756.662cf8f5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Fabrice Bellard, famous for being the initial author of Qemu, but also
of FFmpeg, for holding several records in PI computation, and for many
other things, has just released a x86 emulator written in Javascript
that runs inside your browser: http://bellard.org/jslinux/.

This news has been slashdoted:
http://linux.slashdot.org/story/11/05/17/0242244/Boot-Linux-In-Your-Browser

The link with Buildroot ?

According to the technical details page at
http://bellard.org/jslinux/tech.html, the system used for the demo has
been generated with Buildroot:

?
The disk image is just a ram disk image loaded at boot time. It
contains a filesystem generated with Buildroot containing BusyBox. I
added my toy C compiler TinyCC and my unfinished but usable emacs clone
QEmacs.
?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
