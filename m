From: Piotr Adam Zolnierczuk <pzolnier@indiana.edu>
Date: Wed, 28 Feb 2007 10:51:02 -0500
Subject: [Buildroot] static libgcc_s
Message-ID: <45E5A4E6.3010508@indiana.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am trying to compile a flash bootloader for a AT91SAM9260EK board on 
my Linux box.

When I use gnuarm.org precompiled toolchain (gcc-3.4.3) it works fine, 
but when I use my own toolchain
(build by buildroot rev 17875, gcc-4.1.1) it complains about missing 
gcc_s (the bootloader wants to use __divsi3 routine).

My toolchain properly builds libgcc_s.so, but for some reasons it does 
not build libgcc_s.a. Otherwise the toolchain is fine: builds kernel, 
rootfs etc.

Any ideas how can I "force" buildroot to build a static version of libgcc_s?

Thanks
    Piotr
