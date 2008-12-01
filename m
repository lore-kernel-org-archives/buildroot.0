From: Mirko ROCCO <mirko.rocco@gmail.com>
Date: Mon, 1 Dec 2008 16:40:38 +0100
Subject: [Buildroot] Buildroot for target PowerPC 405 (on Xilinx XUPV2p
	Board)
Message-ID: <10d6046f0812010740u5082e10bk9fded198d8d3bddb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
i'm trying to compile buildroot... this is my scenario:

HOST=i386-pc-linux
TARGET=powerpc 405 (i don't know if with FPU or not...)

I have the XUPV2P Board of Xilinx, and I would want to install on it an
linuz kernel (linux-2.6.xlnx.git kernel from xilinx!)

Which combination of uclibc, GCC, busybox, binutils, etc. etc. is better to
choose in "menuconfig"in my case?

Now I'm working with
Busybox: 1.12.x
uCLibc: 0.9.29
GCC: (really i try every combination with same result :-( ...)
binutils: 2.18

I never had success in compilation!!!

Can someone help me please?

Thanks, regards,

Mirko ROCCO
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081201/31cbe455/attachment.htm 
