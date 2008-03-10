From: Tzungder Lin <tzungder@gmail.com>
Date: Mon, 10 Mar 2008 09:17:23 +0800
Subject: [Buildroot] Can stdlibc++ compile with ARM EABI ?
Message-ID: <528f811a0803091817l711dc830w98cd5563a6187415@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I try to build a ARM EABI toolchain with g++ supported.
I have try gcc 4.1/4.2 with binutils 2.17.x / 2.18, uclibc0.9.27/28
But it keeps fail at compiling stdlibc++, the error message is come
from the assembler:
libstdc++-v3/libsupc++/eh_alloc.cc
Error: duplicate .personality directive
I have do some google searching but no useful result.
Any response is welcome, I have been stuck in this for more than 6 months...
Thanks a lot !

Regards
  jonathan
