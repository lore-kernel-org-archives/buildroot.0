From: Lee JJ <jengjr@gmail.com>
Date: Sat, 14 Jul 2007 02:55:55 +0800
Subject: [Buildroot] md5 error
Message-ID: <1497cb6d0707131155tee33a22o297853895a02757b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Any one have clue ?

# svn update
At revision 19083.


gcc -c -DHAVE_CONFIG_H -g -O2 -I.
-I/root/buildroot/toolchain_build_i386/gcc-4.2.0/libiberty/../include  -W
-Wall -pedantic -Wwrite-strings -Wstrict-prototypes
/root/buildroot/toolchain_build_i386/gcc-4.2.0/libiberty/md5.c -o md5.o
/root/buildroot/toolchain_build_i386/gcc-4.2.0/libiberty/md5.c: In function
`md5_finish_ctx':
/root/buildroot/toolchain_build_i386/gcc-4.2.0/libiberty/md5.c:110: warning:
implicit declaration of function `bcopy'
/root/buildroot/toolchain_build_i386/gcc-4.2.0/libiberty/md5.c: In function
`md5_process_bytes':
/root/buildroot/toolchain_build_i386/gcc-4.2.0/libiberty/md5.c:237: error:
invalid use of void expression
make[2]: *** [md5.o] Error 1
make[2]: Leaving directory `/root/buildroot/toolchain_build_i386/gcc-
4.2.0-initial/libiberty'
make[1]: *** [all-libiberty] Error 2
make[1]: Leaving directory `/root/buildroot/toolchain_build_i386/gcc-
4.2.0-initial'
make: *** [/root/buildroot/toolchain_build_i386/gcc-4.2.0-initial/.compiled]
Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070714/2579c6e9/attachment.htm 
