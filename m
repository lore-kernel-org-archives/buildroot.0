From: Bill Traynor <btraynor@gmail.com>
Date: Tue, 10 Apr 2007 13:27:20 -0400
Subject: [Buildroot] Buildroot Compile Errors for SH4
Message-ID: <e71f4bea0704101027j70b89bd2h7eec5cadd69cfc54@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Trying to compile Buildroot for SH4 (from April 10th snapshot
http://buildroot.uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2)
with the following config:

2.6.20 Kernel Headers
uClibc - daily snapshot
binutils 2.17.50.0.14
GCC 4.2

Received the following error:

CC libc/sysdeps/linux/sh/syscall.os
libc/sysdeps/linux/sh/syscall.c:11: error: conflicting types for 'syscall'
./include/unistd.h:1016: error: previous declaration of 'syscall' was here

Thanks
Bill
