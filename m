From: Mirko ROCCO <mirko.rocco@gmail.com>
Date: Wed, 10 Dec 2008 14:07:56 +0100
Subject: [Buildroot] Buildroot for target PowerPC 405 (on Xilinx XUPV2p
	Board)
In-Reply-To: <20081201161034.GA20082@mx.loc>
References: <10d6046f0812010740u5082e10bk9fded198d8d3bddb@mail.gmail.com>
	<20081201161034.GA20082@mx.loc>
Message-ID: <10d6046f0812100507k5e51bddbg88dd80732142a73@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernhard!
I try to use your tree as you suggest me!

Unfortunately I recive this error and i don't know how to solve it:

/usr/bin/install: manca l'operando per il file di destinazione dopo
`/home/mirko/Documenti/TESI/BUILDROOT/buildroot-Bernhard/powerpc_nofpu_toolchain/linux/.config'
Usare `/usr/bin/install --help' per ulteriori informazioni.
make: ***
[/home/mirko/Documenti/TESI/BUILDROOT/buildroot-Bernhard/powerpc_nofpu_toolchain/linux/.configured]
Error 1

Any idea?

The folder "linux" doesn't exist in
"../buildroot-Bernhard/powerpc_nofpu_toolchain/", but instead exist
"linux-2.6.26.5". This is the folder that buildroot create every time i
launch "make", so is useless to rename the folder!

Hope you can help me, thanks!

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
URL: http://busybox.net/lists/buildroot/attachments/20081210/4e5d0546/attachment.htm 
