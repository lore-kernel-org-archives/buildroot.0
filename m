From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 25 Sep 2007 20:09:48 +0200
Subject: [Buildroot] native GCC not found in HEAD
References: <d6cda7730709250656u4b67c688q4f4e5fe83ce32571@mail.gmail.com>
Message-ID: <02ca01c7ff9f$46e23020$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,
> 
>   I've done an svn up today, and something has been broken since the
> last time I tried a full build:
> 
> /bin/sh: /bin/-gcc: No such file or directory
> copy_toolchain_lib_root: lib=libc.so.6 not found
> make: *** [/root/novacomm/buildroot/buildroot-original/project_build_avr32/pppserver/root/lib/libc.so.6]
> Error 255
> gentoo-vm buildroot-original # which gcc
> /usr/bin/gcc
> gentoo-vm buildroot-original #
> 
> Been greping here and there, tried some hints from
> http://www.oreilly.com.cn/samplechap/gnumake/ch12.pdf but can't find
> where this is broken :(
> 

Bernard Fisher, is the last one to touch the AVR32 and he broke it severely.
I am pretty sure that he did not test building the AVR32 toolset
before submitting...

He should fix the problem!

Best Regards
Ulf Samuelsson
>
