From: Shai Lifshitz <ShaiL@visonic.com>
Date: Mon, 30 Jul 2007 12:51:31 +0400
Subject: [Buildroot] failing to build the buildroot
Message-ID: <OF63068367.6ED17E33-ONC2257328.002FE884-C3257328.002ACB29@visonic.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dir Sir,

I downloaded today the buildroot-snapshot.tar.bz2.tar file from the FTP 
site, opened it and run 'make menuconfig' for the following options:
BR2_arm=y
BR2_arm926t=y
BR2_ARM_EABI=y

after running the 'make' I have got the following error:

10:28:27 (9.77 KB/s) 
-`/home/shail/downloads/tt3/buildroot/dl/gcc-4.2.0.tar.bz2' 
saved[44,057,527/44,057,527]

mkdir -p /home/shail/downloads/tt3/buildroot/toolchain_build_arm
rm -rf /home/shail/downloads/tt3/buildroot/toolchain_build_arm/gcc-4.2.0
bzcat /home/shail/downloads/tt3/buildroot/dl/gcc-4.2.0.tar.bz2 | tar -C 
/home/shail/downloads/tt3/buildroot/toolchain_build_arm   -xf -

tar: Skipping to next header
tar: Archive contains obsolescent base-64 headers

bzcat: Data integrity error when decompressing.
        Input file = 
/home/shail/downloads/tt3/buildroot/dl/gcc-4.2.0.tar.bz2, output file = 
(stdout)

It is possible that the compressed file(s) have become corrupted.
You can use the -tvv option to test integrity of such files.

You can use the `bzip2recover' program to attempt to recover
data from undamaged sections of corrupted files.

tar: Read 5480 bytes from -
tar: Error exit delayed from previous errors
make: 
***[/home/shail/downloads/tt3/buildroot/toolchain_build_arm/gcc-4.2.0/.unpacked]Error 
2


can anybody help me with this problem?
and if I have the solution, is it possible to continue the make from the 
point it stopped, or do I have to run the 'make' all from the beginning?

sincerely
Shai Lifshitz
email: shail at visonic.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070730/5362c3e0/attachment.htm 
