From: Odd Arild Olsen <oao@oao.no>
Date: Sun, 7 Nov 2010 11:49:47 +0100
Subject: [Buildroot] running tools on build host?
Message-ID: <201011071149.48457.oao@oao.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have built the gcc/uclibc toolchain and got the files installed in a 
/usr/local directory. 

I develop for an embedded i386 machine and need uClibc for that.

I also wish to execute the compiled programs on the build machine during 
development. But I have not found any combination of options and environment 
variables that let me run the program with dynamic linking. The linker always 
goes to the /lib directory and gets confused by libc6 stuff.   

I can compile and run a statically linked program

And I can compile the program and then copy the executable to the root image, 
chroot and run it

Are there any way I can set this up so I can run my programs on the build host 
without copying the toolchain librariess to /lib

oao
