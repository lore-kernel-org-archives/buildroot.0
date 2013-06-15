From: piquemal michel <michel_piquemal@yahoo.fr>
Date: Sun, 16 Jun 2013 00:26:21 +0100 (BST)
Subject: [Buildroot] Building with uClibc 0.9.28, Linux 2.6.36
In-Reply-To: <877ghvxdkf.fsf@dell.be.48ers.dk>
References: <1371326730.31593.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87bo77yveg.fsf@dell.be.48ers.dk>
 <1371329906.70128.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87sj0jxf0n.fsf@dell.be.48ers.dk>
 <1371332003.62321.YahooMailNeo@web171505.mail.ir2.yahoo.com>
 <877ghvxdkf.fsf@dell.be.48ers.dk>
Message-ID: <1371338781.70346.YahooMailNeo@web171503.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Great, thanks a lot, it does get much further, but there are still some problems with some paths probably.
Or maybe I should use an earlier gcc version...

Best.

make[4]: Entering directory `/home/mpi/development/buildroot-2010.05/output/toolchain/uClibc-0.9.28.3/libc/misc/assert'
/home/mpi/development/buildroot-2010.05/output/staging/usr/bin/mipsel-unknown-linux-uclibc-gcc ?-Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing ?-mips1 -msoft-float -fno-stack-protector -fno-builtin -nostdinc -D_LIBC -I../../../include -I. ?-Os -funit-at-a-time ?-mno-split-addresses -isystem /home/mpi/development/buildroot-2010.05/output/staging/usr/lib/gcc/mipsel-unknown-linux-uclibc/4.3.4/include -DNDEBUG -fPIC -c __assert.c -o __assert.o
In file included from ../../../include/bits/uClibc_uintmaxtostr.h:41,
? ? ? ? ? ? ? ? ?from __assert.c:34:
../../../include/limits.h:124:26: error: limits.h: No such file or directory
make[4]: *** [__assert.o] Error 1
make[4]: Leaving directory `/home/mpi/development/buildroot-2010.05/output/toolchain/uClibc-0.9.28.3/libc/misc/assert'
make[3]: *** [_dir_assert] Error 2
make[3]: Leaving directory `/home/mpi/development/buildroot-2010.05/output/toolchain/uClibc-0.9.28.3/libc/misc'
make[2]: *** [_dir_misc] Error 2
make[2]: Leaving directory `/home/mpi/development/buildroot-2010.05/output/toolchain/uClibc-0.9.28.3/libc'
make[1]: *** [_dir_libc] Error 2
make[1]: Leaving directory `/home/mpi/development/buildroot-2010.05/output/toolchain/uClibc-0.9.28.3'
make: *** [/home/mpi/development/buildroot-2010.05/output/toolchain/uClibc-0.9.28.3/lib/libc.a] Error 2





----- Mail original -----
De?: Peter Korsgaard <jacmet@uclibc.org>
??: piquemal michel <michel_piquemal@yahoo.fr>
Cc?: Peter Korsgaard <jacmet@uclibc.org>; "buildroot at busybox.net" <buildroot@busybox.net>
Envoy? le : Samedi 15 juin 2013 23h35
Objet?: Re: Building with uClibc 0.9.28, Linux 2.6.36

>>>>> "piquemal" == piquemal michel <michel_piquemal@yahoo.fr> writes:

piquemal> hum, thanks!
piquemal> however what does
piquemal> depends on !BR2_avr32
piquemal> mean: could not find which option it is.

Yes, but as you're building for mips, that's not a problem.

-- 
Bye, Peter Korsgaard
