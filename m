From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Thu, 26 Nov 2009 10:51:31 +0100
Subject: [Buildroot] Gdb-target 6.7.1 - build problem.
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67014B0378@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

Just tried the 200911rc1 .. And build gdb-target-6.7.1 fails...
'termcap'

Didn't find the reason yet :-(  [ I'm looking into it, but seems not be
trivial. ]

{ while 'googe-ling' for more info came across gdb-look-alike problem..
and there was mentioned that ncursses needed to be installed, which is
in my case }


Note: 
1) TARGET : ARM (AT91sam9260 & at91sam9g20)
2) gdb-6.8 builds for arm but is not working (this is the reason for
6.7.1) 



Greetz,
Noel.



checking for sys/stat.h... touch stamp-lib
make[5]: Leaving directory
`/buildhome/200911rc1/buildroot/output/build/gdb-6.7.1-target/opcodes'
make[4]: Leaving directory
`/buildhome/200911rc1/buildroot/output/build/gdb-6.7.1-target/opcodes'
make[3]: Leaving directory
`/buildhome/200911rc1/buildroot/output/build/gdb-6.7.1-target/opcodes'
yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking libunwind.h usability... no
checking libunwind.h presence... no
checking for libunwind.h... no
checking libunwind-ia64.h usability... no
checking libunwind-ia64.h presence... no
checking for libunwind-ia64.h... no
checking for monstartup... no
checking for _mcleanup... no
checking for _etext... yes
checking for gawk... gawk
checking for a BSD-compatible install... /usr/bin/install -c
checking whether ln -s works... yes
checking for arm-linux-uclibc-ranlib...
/buildhome/200911rc1/buildroot/output/build/staging_dir/usr/bin/arm-linu
x-uclibc-ranlib
checking for bison... bison -y
checking for arm-linux-uclibc-ar...
/buildhome/200911rc1/buildroot/output/build/staging_dir/usr/bin/arm-linu
x-uclibc-ar
checking for arm-linux-uclibc-dlltool... arm-linux-uclibc-dlltool
checking for arm-linux-uclibc-windres... arm-linux-uclibc-windres
checking for arm-linux-uclibc-mig... no
checking for mig... no
checking for main in -lm... yes
checking for wctype... yes
checking for library containing gethostbyname... none required
checking for library containing socketpair... none required
checking for library containing waddstr... no
checking for library containing tgetent... no
configure: error: no termcap library found
make[2]: *** [configure-gdb] Error 1
make[2]: Leaving directory
`/buildhome/200911rc1/buildroot/output/build/gdb-6.7.1-target'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/buildhome/200911rc1/buildroot/output/build/gdb-6.7.1-target'
make: ***
[/buildhome/200911rc1/buildroot/output/build/gdb-6.7.1-target/gdb/gdb]
Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091126/93cb597e/attachment.htm>
