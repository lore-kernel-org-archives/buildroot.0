From: Andrew Chambers <andrewchamberss@gmail.com>
Date: Wed, 23 May 2012 10:50:11 +1200
Subject: [Buildroot] gcc 4.2.4 toolchain
Message-ID: <CACDP-tcryHMzAjQ2iw+pRcGavZamDSHStABz5NFxfVrK3-iYzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Recently ive tried to build a custom mips linux kernel version 2.6.28 under
the buildroot-2012.02. However all gcc versions listed do not support
some deprecated gcc inline assembly syntax being used extensively.

Is it possible to use gcc 4.2.4 with buildroot-2012.02 . I manually added
it to the buildroot menu but when attempting a mips build the toolchain i
recieve the following errors while building the cross compiler ...

                 from
/Users/andrewc/Desktop/buildroot-2012.02/output/toolchain/gcc-4.2.4/gcc/unwind-sjlj.c:36:
/Users/andrewc/Desktop/buildroot-2012.02/output/toolchain/gcc-4.2.4/gcc/gthr-posix.h:43:21:
error: pthread.h: No such file or directory

i have tried using linux threads and native posix options , but both
require pthread which cant be found.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120523/43df9a34/attachment.html>
