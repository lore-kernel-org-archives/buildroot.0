From: aniruddha <aniruddha.navur@tokheimkaizen.com>
Date: Fri, 13 Apr 2007 09:55:35 +0530
Subject: [Buildroot] C++ support in uclibc toolchain for arm.
Message-ID: <1176438335.3670.9.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

Following error is thrown when I make a C++ program using uclibc
toolchain(gcc- 3.2.2,uclibc-0.9.21,binutils- 2.13.21)

ERROR Description:

make[1]: Entering directory
`/home/karim/control-project/daq-module/sysappl/C++'
g++    -c -o test1.o test1.cpp
/home/karim/control-project/daq-module/tools/arm-uClibc/bin/arm-uclibc-gcc -c --static -o test1 test1.o
arm-linux-gcc: test1.o: linker input file unused because linking not
done
cp -f test1 /home/testbin
cp: cannot stat `test1': No such file or directory
make[1]: *** [test1] Error 1
make[1]: Leaving directory
`/home/karim/control-project/daq-module/sysappl/C++'
make: *** [all] Error 2

As seen above, (.O) file is created but its executable is not. It is a
linking error. Please does anyone have a way around this bug?

regards,
Aniruddha Navur.
