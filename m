From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 25 Sep 2007 14:56:01 +0100
Subject: [Buildroot] native GCC not found in HEAD
Message-ID: <d6cda7730709250656u4b67c688q4f4e5fe83ce32571@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

   I've done an svn up today, and something has been broken since the
last time I tried a full build:

/bin/sh: /bin/-gcc: No such file or directory
copy_toolchain_lib_root: lib=libc.so.6 not found
make: *** [/root/novacomm/buildroot/buildroot-original/project_build_avr32/pppserver/root/lib/libc.so.6]
Error 255
gentoo-vm buildroot-original # which gcc
/usr/bin/gcc
gentoo-vm buildroot-original #

Been greping here and there, tried some hints from
http://www.oreilly.com.cn/samplechap/gnumake/ch12.pdf but can't find
where this is broken :(

Perhaps someone with more experience with buildroot could take a look into it?

Regards,
   Thiago A Correa
