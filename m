From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 12 Feb 2009 13:30:48 +0100
Subject: [Buildroot] Buildroot 2009.02 released
In-Reply-To: <87skmkf1s0.fsf@macbook.be.48ers.dk>
References: <87skmkf1s0.fsf@macbook.be.48ers.dk>
Message-ID: <49941678.4040902@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> Hi,
> 
> Buildroot 2009.02 is released - Go download it at:
> 
> http://buildroot.uclibc.org/downloads/buildroot-2009.02.tar.gz
> 
> or
> 
> http://buildroot.uclibc.org/downloads/buildroot-2009.02.tar.bz2
> 

Building gdb for cris-v10 architecture fails with:

hecking for long double support in printf... no
checking for long double support in scanf... no
checking whether <sys/syscall.h> has __NR_tkill... yes
checking compiler warning flags...  -Wall -Wdeclaration-after-statement -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wno-switch -Wno-char-subscripts 
checking for cygwin... no
checking for ELF support in BFD... yes
checking for X... disabled
enable_sim = no
enableval = no
configure: error: "*** Gdb does not support native target cris-axis-linux-uclibc"
make[2]: *** [configure-gdb] Error 1
make[2]: Leaving directory `/work/uclibc.buildroot/buildroot-2009.02/build_cris/gdb-6.8-target'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/work/uclibc.buildroot/buildroot-2009.02/build_cris/gdb-6.8-target'
make: *** [/work/uclibc.buildroot/buildroot-2009.02/build_cris/gdb-6.8-target/gdb/gdb] Error 2

Are we missing uclibc config.guess and config.sub?

Regards, hinko

-- 
Hinko Ko?evar, OSS developer
?ETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar at cetrtapot.si
http    www.cetrtapot.si
