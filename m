From: =?ISO-8859-1?Q?Sebasti=E1n_Treu?= <sebastian.treu@gmail.com>
Date: Sat, 30 Jan 2010 04:10:13 -0300
Subject: [Buildroot] [newbie]: create a rootfs for cross-compile
Message-ID: <9e4ade691001292310j28576258yf42249f30794639@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm new on this list and with this buildroot things. I'm almost 9 days
on the go and I have some doubts that the Docs do not cover enough for
me.

I successfully build a rootfs for a mips processor. The processor is
an atheros ar7161 from a routerboard. I removed the licensed routerOS
and I began with openwrt. But, I needed dev packages to build new
packages. So I installed the openwrt SDK. And then I went into this
buildroot with uClibc.

My short question is: Is it possible to make an image of a rootfs for
x86 with the mips toolchain? The only rootfs images I could make was
for mips, I chrooted from the board successfully, but compiling on
those board are quite slow. I read the "how to build outside
buildroot" but I don't get quite well. How "make" will make use of all
the needed tools? Isn't it easier to build a jail root so you won't
mess up with your PATH? It's a n00b question, sry.

What I need and What I want is just extract a tarball, and issue a
make. If the source can't be cross-compiled (as mysql 5) it's just
another problem. The truth is that I have all the required tools but
if it's not from the "make menuconfig" I don't know how to use it with
a source code.

I managed to use the openwrt SDK for ncurses, but it's too messy the
Makefile one needs to create. I just want to be transparent as usual,
just "make". :-)

Thanks in advance,
Regards,
-- 
If you want freedom, compile the source. Get gentoo.

Sebasti?n Treu
http://labombiya.com.ar
