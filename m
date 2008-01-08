From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 8 Jan 2008 08:37:33 -0800
Subject: [Buildroot] [buildroot 0001904]: can't build  pciutils for mipsel
Message-ID: <b72b830d88c5ebee23f7546003610555@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1904 
====================================================================== 
Reported By:                alec_v
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1904
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-08-2008 08:37 PST
Last Modified:              01-08-2008 08:37 PST
====================================================================== 
Summary:                    can't build  pciutils for mipsel
Description: 
Impossible to build   pciutils   for mipsel architecture

Error: sys/io.h: No such file or directory


...
...
Applying pciutils.patch using plaintext:
patching file lib/configure
Hunk http://busybox.net/bugs/view.php?id=1 succeeded at 12 with fuzz 2.
touch
/home/alec/mips/buildroot-20080104/build_mipsel/pciutils-2.2.6/.unpacked
/usr/bin/make MAKE="/usr/bin/make -j1"
CC=/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
OPT="-Os -pipe 
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/include
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/include
-mtune=mips32 -mabi=32" -C
/home/alec/mips/buildroot-20080104/build_mipsel/pciutils-2.2.6 \
        SHAREDIR="/usr/share/misc" \
        PREFIX=/usr
make[1]: Entering directory
`/home/alec/mips/buildroot-20080104/build_mipsel/pciutils-2.2.6'
cd lib && ./configure "/usr/share/misc" "2.2.6" "" "" ""
Configuring libpci for your system... i386--linux 2.6.9-5.ELsmp
Looking for access methods... sysfs proc i386-ports dump
Checking for zlib support... yes (auto-detected)
make[1]: Leaving directory
`/home/alec/mips/buildroot-20080104/build_mipsel/pciutils-2.2.6'
make[1]: Entering directory
`/home/alec/mips/buildroot-20080104/build_mipsel/pciutils-2.2.6'
/usr/bin/make -j1 -C lib all
make[2]: Entering directory
`/home/alec/mips/buildroot-20080104/build_mipsel/pciutils-2.2.6/lib'
/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
-Os -pipe 
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/include
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/include
-mtune=mips32 -mabi=32 -Wall -W -Wno-parentheses -Wstrict-prototypes
-Wmissing-prototypes   -c -o access.o access.c
/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
-Os -pipe 
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/include
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/include
-mtune=mips32 -mabi=32 -Wall -W -Wno-parentheses -Wstrict-prototypes
-Wmissing-prototypes   -c -o generic.o generic.c
/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
-Os -pipe 
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/include
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/include
-mtune=mips32 -mabi=32 -Wall -W -Wno-parentheses -Wstrict-prototypes
-Wmissing-prototypes   -c -o dump.o dump.c
/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
-Os -pipe 
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/include
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/include
-mtune=mips32 -mabi=32 -Wall -W -Wno-parentheses -Wstrict-prototypes
-Wmissing-prototypes   -c -o names.o names.c
/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
-Os -pipe 
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/include
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/include
-mtune=mips32 -mabi=32 -Wall -W -Wno-parentheses -Wstrict-prototypes
-Wmissing-prototypes   -c -o filter.o filter.c
/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
-Os -pipe 
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/include
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/include
-mtune=mips32 -mabi=32 -Wall -W -Wno-parentheses -Wstrict-prototypes
-Wmissing-prototypes   -c -o sysfs.o sysfs.c
/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
-Os -pipe 
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/include
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/include
-mtune=mips32 -mabi=32 -Wall -W -Wno-parentheses -Wstrict-prototypes
-Wmissing-prototypes   -c -o proc.o proc.c
/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc
-Os -pipe 
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/usr/include
-I/home/alec/mips/buildroot-20080104/build_mipsel/staging_dir/include
-mtune=mips32 -mabi=32 -Wall -W -Wno-parentheses -Wstrict-prototypes
-Wmissing-prototypes   -c -o i386-ports.o i386-ports.c
In file included from i386-ports.c:16:
i386-io-linux.h:10:20: sys/io.h: No such file or directory
In file included from i386-ports.c:16:
i386-io-linux.h: In function `intel_setup_io':
i386-io-linux.h:18: warning: implicit declaration of function `iopl'
i386-ports.c: In function `conf1_detect':
i386-ports.c:103: warning: implicit declaration of function `outb'
i386-ports.c:104: warning: implicit declaration of function `inl'
i386-ports.c:105: warning: implicit declaration of function `outl'
i386-ports.c:106: warning: comparison between signed and unsigned
i386-ports.c: In function `conf1_read':
i386-ports.c:127: warning: implicit declaration of function `inb'
i386-ports.c:130: warning: implicit declaration of function `inw'
i386-ports.c: In function `conf1_write':
i386-ports.c:157: warning: implicit declaration of function `outw'
make[2]: *** [i386-ports.o] Error 1
make[2]: Leaving directory
`/home/alec/mips/buildroot-20080104/build_mipsel/pciutils-2.2.6/lib'
make[1]: *** [lib/libpci.a] Error 2
make[1]: Leaving directory
`/home/alec/mips/buildroot-20080104/build_mipsel/pciutils-2.2.6'
make: ***
[/home/alec/mips/buildroot-20080104/build_mipsel/pciutils-2.2.6/.compiled]
Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-08-08 08:37  alec_v         New Issue                                    
01-08-08 08:37  alec_v         Status                   new => assigned     
01-08-08 08:37  alec_v         Assigned To               => buildroot       
======================================================================
