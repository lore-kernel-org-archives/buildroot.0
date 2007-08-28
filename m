From: Privat <zentrale.at.work@gmail.com>
Date: Tue, 28 Aug 2007 09:02:46 +0200
Subject: [Buildroot] BR fails to build native Toolchain for ARM
Message-ID: <46D3C896.9000407@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!

When using buildroot for arm, it fails to build a native toolchain with 
the following error:

/usr/lib/libgmp.so: could not read symbols: File in wrong format
collect2: ld returned 1 exit status

Config is gcc 4.2.1, binutils 2.17, uclibc 0.9.29
Build system is centos 5.

I tried various gcc versions in br, but every time got the same result.

Greets Sepp
