From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 7 Feb 2012 11:22:21 +0100
Subject: [Buildroot] .missing-syscalls.d & kernel not booting (see vol 68,
	issue 29 msg 2)
Message-ID: <61A7CFF8921945F8B806AC5E3E183ED0@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
I found a file  .missing-syscalls.d in the build dir. of my kernel 2.6.31.9 , could this be the  problem ?
 
containing :
 
-:  include/linux/autoconf.h \
 /home/johan/buildroot-2011.11js/output/build/linux-2.6.31.9/arch/arm/include/asm/types.h \
 include/asm-generic/int-ll64.h \
 /home/johan/buildroot-2011.11js/output/build/linux-2.6.31.9/arch/arm/include/asm/bitsperlong.h \
 include/asm-generic/bitsperlong.h \
 /home/johan/buildroot-2011.11js/output/build/linux-2.6.31.9/arch/arm/include/asm/unistd.h
 
 What is causing this ?
 
 Building (and running ! ) the same kernel in buildroot 2010.02 is no problem.

I just want to move on to 2011.11


Sagaert Johan
