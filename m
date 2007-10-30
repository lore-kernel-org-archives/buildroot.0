From: Paul Barrette <r01325@freescale.com>
Date: Tue, 30 Oct 2007 10:51:05 -0400
Subject: [Buildroot] powerpc soft float no  fmsub
Message-ID: <472744D9.5080706@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am building just the toolchain for powepc (generic) with C++ support. 
However, when I link a C++ app, there is an undefined ref to "fmsub".  I
have soft float enabled, which seems to be the reason, and I do not have
an FPU.  Google is not much help here, unless here is a different name
for fmsub.

$ powerpc-linux-g++ -o X test.cc
~/test_ppc_toolchain-4.2.1/usr/bin/../lib/gcc/powerpc-linux-uclibc/4.2.1/../../../../powerpc-linux-uclibc/lib/libgcc_s.so:
undefined reference to `fmsub'

Details:
Build root: 20071029
uClibc :uClibc-0.9.29
gcc: 4.2.1

Ideas welcome

Thanks
Pb

-- 
Paul Barrette 
Freescale Semiconductor
paul.barrette at freescale.com
(613) 723-9161 x4034
