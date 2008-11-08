From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 8 Nov 2008 11:42:07 -0800
Subject: [Buildroot] [buildroot 0006034]: xserver_xorg-server-1.4.1 does not
	compile in r23297
Message-ID: <bd385c810207663fb2a8a06f929cfe7f@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6034 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6034
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-08-2008 11:23 PST
Last Modified:              11-08-2008 11:42 PST
====================================================================== 
Summary:                    xserver_xorg-server-1.4.1 does not compile in r23297
Description: 
Making all in vesa
make[4]: Entering directory
`/home/salvador/ugles/buildroot/build_i586/xserver_xorg-server-1.4.1/hw/kdrive/vesa'
/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/include
--sysroot=/home/salvador/ugles/buildroot/build_i586/staging_dir/ -isysroot
/home/salvador/ugles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I../../../include
-I../../../hw/kdrive/src -I../../../miext/damage -I../../../miext/shadow
-I../../../Xext -I../../../fb -I../../../mi -I../../../hw/kdrive/linux
-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -fno-strict-aliasing -D_BSD_SOURCE
-DHAS_FCHOWN -DHAS_STICKY_DIR_BIT
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/freetype2
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
  -I../../../include -I../../../include -I../../../Xext
-I../../../composite -I../../../damageext -I../../../xfixes -I../../../Xi
-I../../../mi -I../../../miext/shadow  -I../../../miext/damage
-I../../../render -I../../../randr -I../../../fb -DHAVE_KDRIVE_CONFIG_H   
 -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
-MT vesa.o -MD -MP -MF .deps/vesa.Tpo -c -o vesa.o vesa.c
vesa.c: In function ?vesaReportMode?:
vesa.c:111: warning: too many arguments for format
vesa.c: In function ?vesaComputeFramebufferMapping?:
vesa.c:916: warning: format ?%x? expects type ?unsigned int?, but argument
4 has type ?Pixel?
vesa.c:916: warning: format ?%x? expects type ?unsigned int?, but argument
5 has type ?Pixel?
vesa.c:916: warning: format ?%x? expects type ?unsigned int?, but argument
6 has type ?Pixel?
mv -f .deps/vesa.Tpo .deps/vesa.Po
/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/include
--sysroot=/home/salvador/ugles/buildroot/build_i586/staging_dir/ -isysroot
/home/salvador/ugles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I../../../include
-I../../../hw/kdrive/src -I../../../miext/damage -I../../../miext/shadow
-I../../../Xext -I../../../fb -I../../../mi -I../../../hw/kdrive/linux
-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -fno-strict-aliasing -D_BSD_SOURCE
-DHAS_FCHOWN -DHAS_STICKY_DIR_BIT
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/freetype2
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
  -I../../../include -I../../../include -I../../../Xext
-I../../../composite -I../../../damageext -I../../../xfixes -I../../../Xi
-I../../../mi -I../../../miext/shadow  -I../../../miext/damage
-I../../../render -I../../../randr -I../../../fb -DHAVE_KDRIVE_CONFIG_H   
 -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
-MT vbe.o -MD -MP -MF .deps/vbe.Tpo -c -o vbe.o vbe.c
vbe.c: In function ?VbeSetPalette?:
vbe.c:439: warning: pointer targets in assignment differ in signedness
vbe.c: In function ?VbeGetPalette?:
vbe.c:484: warning: pointer targets in assignment differ in signedness
vbe.c: In function ?VbeDoInterrupt10?:
vbe.c:668: warning: format ?%04X? expects type ?unsigned int?, but
argument 3 has type ?long int?
vbe.c: In function ?VbeDoInterruptE6?:
vbe.c:704: warning: format ?%04X? expects type ?unsigned int?, but
argument 3 has type ?long int?
mv -f .deps/vbe.Tpo .deps/vbe.Po
/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/include
--sysroot=/home/salvador/ugles/buildroot/build_i586/staging_dir/ -isysroot
/home/salvador/ugles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I../../../include
-I../../../hw/kdrive/src -I../../../miext/damage -I../../../miext/shadow
-I../../../Xext -I../../../fb -I../../../mi -I../../../hw/kdrive/linux
-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -fno-strict-aliasing -D_BSD_SOURCE
-DHAS_FCHOWN -DHAS_STICKY_DIR_BIT
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/freetype2
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
  -I../../../include -I../../../include -I../../../Xext
-I../../../composite -I../../../damageext -I../../../xfixes -I../../../Xi
-I../../../mi -I../../../miext/shadow  -I../../../miext/damage
-I../../../render -I../../../randr -I../../../fb -DHAVE_KDRIVE_CONFIG_H   
 -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
-MT vga.o -MD -MP -MF .deps/vga.Tpo -c -o vga.o vga.c
vga.c: In function ?VgaSetPalette?:
vga.c:149: warning: pointer targets in assignment differ in signedness
vga.c: In function ?VgaGetPalette?:
vga.c:192: warning: pointer targets in assignment differ in signedness
mv -f .deps/vga.Tpo .deps/vga.Po
/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/include
--sysroot=/home/salvador/ugles/buildroot/build_i586/staging_dir/ -isysroot
/home/salvador/ugles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I../../../include
-I../../../hw/kdrive/src -I../../../miext/damage -I../../../miext/shadow
-I../../../Xext -I../../../fb -I../../../mi -I../../../hw/kdrive/linux
-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -fno-strict-aliasing -D_BSD_SOURCE
-DHAS_FCHOWN -DHAS_STICKY_DIR_BIT
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/freetype2
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
  -I../../../include -I../../../include -I../../../Xext
-I../../../composite -I../../../damageext -I../../../xfixes -I../../../Xi
-I../../../mi -I../../../miext/shadow  -I../../../miext/damage
-I../../../render -I../../../randr -I../../../fb -DHAVE_KDRIVE_CONFIG_H   
 -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
-MT vm86.o -MD -MP -MF .deps/vm86.Tpo -c -o vm86.o vm86.c
vm86.c: In function ?Vm86DoInterrupt?:
vm86.c:213: warning: too few arguments for format
vm86.c:225: error: ?IF_MASK? undeclared (first use in this function)
vm86.c:225: error: (Each undeclared identifier is reported only once
vm86.c:225: error: for each function it appears in.)
vm86.c:225: error: ?IOPL_MASK? undeclared (first use in this function)
vm86.c: In function ?Vm86Debug?:
vm86.c:746: warning: format ?%04lX? expects type ?long unsigned int?, but
argument 2 has type ?int?
vm86.c:746: warning: format ?%04lX? expects type ?long unsigned int?, but
argument 3 has type ?int?
vm86.c:746: warning: format ?%04lX? expects type ?long unsigned int?, but
argument 4 has type ?int?
vm86.c:746: warning: format ?%04lX? expects type ?long unsigned int?, but
argument 5 has type ?int?
vm86.c:746: warning: format ?%04lX? expects type ?long unsigned int?, but
argument 6 has type ?int?
make[4]: *** [vm86.o] Error 1
make[4]: Leaving directory
`/home/salvador/ugles/buildroot/build_i586/xserver_xorg-server-1.4.1/hw/kdrive/vesa'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/salvador/ugles/buildroot/build_i586/xserver_xorg-server-1.4.1/hw/kdrive'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/salvador/ugles/buildroot/build_i586/xserver_xorg-server-1.4.1/hw'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/salvador/ugles/buildroot/build_i586/xserver_xorg-server-1.4.1'
make: ***
[/home/salvador/ugles/buildroot/build_i586/xserver_xorg-server-1.4.1/.stamp_built]
Error 2

====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 11-08-08 11:42  
---------------------------------------------------------------------- 
The same happen with version 1.4.2 (default in 23927)

Making all in vesa
make[4]: Entering directory
`/home/salvador/ugles/buildroot/build_i586/xserver_xorg-server-1.4.2/hw/kdrive/vesa'
/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/include
--sysroot=/home/salvador/ugles/buildroot/build_i586/staging_dir/ -isysroot
/home/salvador/ugles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I../../../include
-I../../../hw/kdrive/src -I../../../miext/damage -I../../../miext/shadow
-I../../../Xext -I../../../fb -I../../../mi -I../../../hw/kdrive/linux
-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -fno-strict-aliasing -D_BSD_SOURCE
-DHAS_FCHOWN -DHAS_STICKY_DIR_BIT
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/freetype2
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
  -I../../../include -I../../../include -I../../../Xext
-I../../../composite -I../../../damageext -I../../../xfixes -I../../../Xi
-I../../../mi -I../../../miext/shadow  -I../../../miext/damage
-I../../../render -I../../../randr -I../../../fb -DHAVE_KDRIVE_CONFIG_H   
 -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
-MT vesa.o -MD -MP -MF .deps/vesa.Tpo -c -o vesa.o vesa.c
vesa.c: In function ?vesaReportMode?:
vesa.c:111: warning: too many arguments for format
vesa.c: In function ?vesaComputeFramebufferMapping?:
vesa.c:916: warning: format ?%x? expects type ?unsigned int?, but argument
4 has type ?Pixel?
vesa.c:916: warning: format ?%x? expects type ?unsigned int?, but argument
5 has type ?Pixel?
vesa.c:916: warning: format ?%x? expects type ?unsigned int?, but argument
6 has type ?Pixel?
mv -f .deps/vesa.Tpo .deps/vesa.Po
/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/include
--sysroot=/home/salvador/ugles/buildroot/build_i586/staging_dir/ -isysroot
/home/salvador/ugles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I../../../include
-I../../../hw/kdrive/src -I../../../miext/damage -I../../../miext/shadow
-I../../../Xext -I../../../fb -I../../../mi -I../../../hw/kdrive/linux
-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -fno-strict-aliasing -D_BSD_SOURCE
-DHAS_FCHOWN -DHAS_STICKY_DIR_BIT
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/freetype2
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
  -I../../../include -I../../../include -I../../../Xext
-I../../../composite -I../../../damageext -I../../../xfixes -I../../../Xi
-I../../../mi -I../../../miext/shadow  -I../../../miext/damage
-I../../../render -I../../../randr -I../../../fb -DHAVE_KDRIVE_CONFIG_H   
 -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
-MT vbe.o -MD -MP -MF .deps/vbe.Tpo -c -o vbe.o vbe.c
vbe.c: In function ?VbeSetPalette?:
vbe.c:439: warning: pointer targets in assignment differ in signedness
vbe.c: In function ?VbeGetPalette?:
vbe.c:484: warning: pointer targets in assignment differ in signedness
vbe.c: In function ?VbeDoInterrupt10?:
vbe.c:668: warning: format ?%04X? expects type ?unsigned int?, but
argument 3 has type ?long int?
vbe.c: In function ?VbeDoInterruptE6?:
vbe.c:704: warning: format ?%04X? expects type ?unsigned int?, but
argument 3 has type ?long int?
mv -f .deps/vbe.Tpo .deps/vbe.Po
/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/include
--sysroot=/home/salvador/ugles/buildroot/build_i586/staging_dir/ -isysroot
/home/salvador/ugles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I../../../include
-I../../../hw/kdrive/src -I../../../miext/damage -I../../../miext/shadow
-I../../../Xext -I../../../fb -I../../../mi -I../../../hw/kdrive/linux
-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -fno-strict-aliasing -D_BSD_SOURCE
-DHAS_FCHOWN -DHAS_STICKY_DIR_BIT
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/freetype2
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
  -I../../../include -I../../../include -I../../../Xext
-I../../../composite -I../../../damageext -I../../../xfixes -I../../../Xi
-I../../../mi -I../../../miext/shadow  -I../../../miext/damage
-I../../../render -I../../../randr -I../../../fb -DHAVE_KDRIVE_CONFIG_H   
 -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
-MT vga.o -MD -MP -MF .deps/vga.Tpo -c -o vga.o vga.c
vga.c: In function ?VgaSetPalette?:
vga.c:149: warning: pointer targets in assignment differ in signedness
vga.c: In function ?VgaGetPalette?:
vga.c:192: warning: pointer targets in assignment differ in signedness
mv -f .deps/vga.Tpo .deps/vga.Po
/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/include
--sysroot=/home/salvador/ugles/buildroot/build_i586/staging_dir/ -isysroot
/home/salvador/ugles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I../../../include
-I../../../hw/kdrive/src -I../../../miext/damage -I../../../miext/shadow
-I../../../Xext -I../../../fb -I../../../mi -I../../../hw/kdrive/linux
-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -fno-strict-aliasing -D_BSD_SOURCE
-DHAS_FCHOWN -DHAS_STICKY_DIR_BIT
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/freetype2
-I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
  -I../../../include -I../../../include -I../../../Xext
-I../../../composite -I../../../damageext -I../../../xfixes -I../../../Xi
-I../../../mi -I../../../miext/shadow  -I../../../miext/damage
-I../../../render -I../../../randr -I../../../fb -DHAVE_KDRIVE_CONFIG_H   
 -I/home/salvador/ugles/buildroot/build_i586/staging_dir/usr/include/pixman-1
-MT vm86.o -MD -MP -MF .deps/vm86.Tpo -c -o vm86.o vm86.c
vm86.c: In function ?Vm86DoInterrupt?:
vm86.c:213: warning: too few arguments for format
vm86.c:225: error: ?IF_MASK? undeclared (first use in this function)
vm86.c:225: error: (Each undeclared identifier is reported only once
vm86.c:225: error: for each function it appears in.)
vm86.c:225: error: ?IOPL_MASK? undeclared (first use in this function)
vm86.c: In function ?Vm86Debug?:
vm86.c:746: warning: format ?%04lX? expects type ?long unsigned int?, but
argument 2 has type ?int?
vm86.c:746: warning: format ?%04lX? expects type ?long unsigned int?, but
argument 3 has type ?int?
vm86.c:746: warning: format ?%04lX? expects type ?long unsigned int?, but
argument 4 has type ?int?
vm86.c:746: warning: format ?%04lX? expects type ?long unsigned int?, but
argument 5 has type ?int?
vm86.c:746: warning: format ?%04lX? expects type ?long unsigned int?, but
argument 6 has type ?int?
make[4]: *** [vm86.o] Error 1
make[4]: Leaving directory
`/home/salvador/ugles/buildroot/build_i586/xserver_xorg-server-1.4.2/hw/kdrive/vesa'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/salvador/ugles/buildroot/build_i586/xserver_xorg-server-1.4.2/hw/kdrive'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/salvador/ugles/buildroot/build_i586/xserver_xorg-server-1.4.2/hw'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/salvador/ugles/buildroot/build_i586/xserver_xorg-server-1.4.2'
make: ***
[/home/salvador/ugles/buildroot/build_i586/xserver_xorg-server-1.4.2/.stamp_built]
Error 2 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-08-08 11:23  robang74       New Issue                                    
11-08-08 11:23  robang74       Status                   new => assigned     
11-08-08 11:23  robang74       Assigned To               => buildroot       
11-08-08 11:23  robang74       Issue Monitored: robang74                    
11-08-08 11:42  robang74       Note Added: 0015274                          
======================================================================
