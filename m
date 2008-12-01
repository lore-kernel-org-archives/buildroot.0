From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Mon, 1 Dec 2008 17:10:34 +0100
Subject: [Buildroot] Buildroot for target PowerPC 405 (on Xilinx
	XUPV2p	Board)
In-Reply-To: <10d6046f0812010740u5082e10bk9fded198d8d3bddb@mail.gmail.com>
References: <10d6046f0812010740u5082e10bk9fded198d8d3bddb@mail.gmail.com>
Message-ID: <20081201161034.GA20082@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 01, 2008 at 04:40:38PM +0100, Mirko ROCCO wrote:
>Hi,
>i'm trying to compile buildroot... this is my scenario:
>
>HOST=i386-pc-linux
>TARGET=powerpc 405 (i don't know if with FPU or not...)

405 would be without fpu as opposed to 405fp
>
>I have the XUPV2P Board of Xilinx, and I would want to install on it an
>linuz kernel (linux-2.6.xlnx.git kernel from xilinx!)
>
>Which combination of uclibc, GCC, busybox, binutils, etc. etc. is better to
>choose in "menuconfig"in my case?

Works fine for me with my tree ?) for gcc-4.3.2, gcc-trunk, current binutils and
latest kernel and current uClibc (or trunk), current busybox (or trunk). All of
the stuff you mention below is old by that measure (and didn't work for me).
>
>Now I'm working with
>Busybox: 1.12.x
>uCLibc: 0.9.29
>GCC: (really i try every combination with same result :-( ...)
>binutils: 2.18
>
>I never had success in compilation!!!
>
>Can someone help me please?

?) http://repo.or.cz/w/buildroot.git/
