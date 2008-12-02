From: Mirko ROCCO <mirko.rocco@gmail.com>
Date: Tue, 2 Dec 2008 13:04:17 +0100
Subject: [Buildroot] Buildroot for target PowerPC 405 (on Xilinx XUPV2p
	Board)
In-Reply-To: <20081201161034.GA20082@mx.loc>
References: <10d6046f0812010740u5082e10bk9fded198d8d3bddb@mail.gmail.com>
	<20081201161034.GA20082@mx.loc>
Message-ID: <10d6046f0812020404t6b9fb241i48bf8ee334fcdbbb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you Bernard for all information!
Now I try with your tree...

Soon!

Mirko ROCCO


2008/12/1 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

> On Mon, Dec 01, 2008 at 04:40:38PM +0100, Mirko ROCCO wrote:
> >Hi,
> >i'm trying to compile buildroot... this is my scenario:
> >
> >HOST=i386-pc-linux
> >TARGET=powerpc 405 (i don't know if with FPU or not...)
>
> 405 would be without fpu as opposed to 405fp
> >
> >I have the XUPV2P Board of Xilinx, and I would want to install on it an
> >linuz kernel (linux-2.6.xlnx.git kernel from xilinx!)
> >
> >Which combination of uclibc, GCC, busybox, binutils, etc. etc. is better
> to
> >choose in "menuconfig"in my case?
>
> Works fine for me with my tree ?) for gcc-4.3.2, gcc-trunk, current
> binutils and
> latest kernel and current uClibc (or trunk), current busybox (or trunk).
> All of
> the stuff you mention below is old by that measure (and didn't work for
> me).
> >
> >Now I'm working with
> >Busybox: 1.12.x
> >uCLibc: 0.9.29
> >GCC: (really i try every combination with same result :-( ...)
> >binutils: 2.18
> >
> >I never had success in compilation!!!
> >
> >Can someone help me please?
>
> ?) http://repo.or.cz/w/buildroot.git/
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081202/298afbcf/attachment.htm 
