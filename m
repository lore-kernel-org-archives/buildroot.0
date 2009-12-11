From: Nicolae T <microvis@cox.net>
Date: Thu, 10 Dec 2009 16:03:55 -0800
Subject: [Buildroot] u-boot compile error
Message-ID: <1260489835.17342.6.camel@RoadRunner>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all, 

We're getting following compile errors at u-boot build time, for which
we have no clue.
There must be something we do in setup that leads to that, but why
failing with compile error? Set up rather straightforward with  BR built
cross-compile chain.
Anyhow, this is wrong and I think it should be looked into.  
Thanks.


make[2]: Entering directory
`/home/nicolae/buildroot7Dec/output/build/u-boot-2009.08/lib_arm'
/home/nicolae/buildroot7Dec/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc  -g  -Os   -fno-strict-aliasing -fno-common -ffixed-r8 -msoft-float   -D__KERNEL__ -DTEXT_BASE=0x80e80000 -I/home/nicolae/buildroot7Dec/output/build/u-boot-2009.08/include -fno-builtin -ffreestanding -nostdinc -isystem /home/nicolae/buildroot7Dec/output/staging/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.4.2/include -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=aapcs-linux -mno-thumb-interwork -march=armv5 -Wall -Wstrict-prototypes -fno-stack-protector   -o board.o board.c -c
board.c:127: error: inline function ?coloured_LED_init? cannot be
declared weak
board.c:129: error: inline function ?red_LED_on? cannot be declared weak
board.c:131: error: inline function ?red_LED_off? cannot be declared
weak
board.c:133: error: inline function ?green_LED_on? cannot be declared
weak
board.c:135: error: inline function ?green_LED_off? cannot be declared
weak
board.c:137: error: inline function ?yellow_LED_on? cannot be declared
weak
board.c:139: error: inline function ?yellow_LED_off? cannot be declared
weak
board.c:141: error: inline function ?blue_LED_on? cannot be declared
weak
board.c:143: error: inline function ?blue_LED_off? cannot be declared
weak
make[2]: *** [board.o] Error 1
make[2]: Leaving directory
`/home/nicolae/buildroot7Dec/output/build/u-boot-2009.08/lib_arm'
make[1]: *** [lib_arm/libarm.a] Error 2
make[1]: Leaving directory
`/home/nicolae/buildroot7Dec/output/build/u-boot-2009.08'
make: ***
[/home/nicolae/buildroot7Dec/output/build/u-boot-2009.08/u-boot.bin]
Error 2

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091210/75a8aca6/attachment.htm>
