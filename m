From: =?UTF-8?Q?=C3=89ric_ALBER?= <eric.alber@gmail.com>
Date: Tue, 21 Feb 2012 11:51:49 +0100
Subject: [Buildroot] Microperl compilation error
Message-ID: <CAGDZK6GbRLiJMT+4dpGWQbQYrc_W5djWR-k-ciK+v-HyG8=q0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm using buildroot to install a custom linux on a Seagate Dockstar
(Marvell Kirkwood based product).
I'm facing a compilation error on microperl, it looks like the -lm flag is
not passed to the linker and thus all math functions are not found.
I'm using buildroot on a Ubuntu 11.10

I attach the patch that fixed the problem on my side.

Regards,

Eric
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120221/62c61bb6/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fix-microperl-compilation.patch
Type: application/octet-stream
Size: 499 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120221/62c61bb6/attachment.obj>
