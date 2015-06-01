From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  1 Jun 2015 20:58:12 +0000 (UTC)
Subject: [Buildroot] [Bug 8151] New: x86-64 make fails with ncurses 5.9
Message-ID: <bug-8151-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8151

           Summary: x86-64 make fails with ncurses 5.9
           Product: buildroot
           Version: 2015.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: patholdn at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


patti at patti-h50:~/buildroot-2015.05-rc3$ make
/usr/local/bin/make -j1  HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++"
silentoldconfig
make[1]: Entering directory '/home/patti/buildroot-2015.05-rc3'
BR2_DEFCONFIG=''
KCONFIG_AUTOCONFIG=/home/patti/buildroot-2015.05-rc3/output/build/buildroot-config/auto.conf
KCONFIG_AUTOHEADER=/home/patti/buildroot-2015.05-rc3/output/build/buildroot-config/autoconf.h
KCONFIG_TRISTATE=/home/patti/buildroot-2015.05-rc3/output/build/buildroot-config/tristate.config
BR2_CONFIG=/home/patti/buildroot-2015.05-rc3/.config
BR2_EXTERNAL=support/dummy-external SKIP_LEGACY=
/home/patti/buildroot-2015.05-rc3/output/build/buildroot-config/conf
--silentoldconfig Config.in
make[1]: Leaving directory '/home/patti/buildroot-2015.05-rc3'
>>> ncurses 5.9 Building
/usr/local/bin/make -j1 -C
/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9
DESTDIR=/home/patti/buildroot-2015.05-rc3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot
sources
make[1]: Entering directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9'
cd include && /usr/local/bin/make
DESTDIR="/home/patti/buildroot-2015.05-rc3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot"
sources
make[2]: Entering directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/include'
make[2]: Nothing to be done for 'sources'.
make[2]: Leaving directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/include'
cd ncurses && /usr/local/bin/make
DESTDIR="/home/patti/buildroot-2015.05-rc3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot"
sources
make[2]: Entering directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/ncurses'
make[2]: Nothing to be done for 'sources'.
make[2]: Leaving directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/ncurses'
cd panel && /usr/local/bin/make
DESTDIR="/home/patti/buildroot-2015.05-rc3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot"
sources
make[2]: Entering directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/panel'
make[2]: Nothing to be done for 'sources'.
make[2]: Leaving directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/panel'
cd menu && /usr/local/bin/make
DESTDIR="/home/patti/buildroot-2015.05-rc3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot"
sources
make[2]: Entering directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/menu'
make[2]: Nothing to be done for 'sources'.
make[2]: Leaving directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/menu'
cd form && /usr/local/bin/make
DESTDIR="/home/patti/buildroot-2015.05-rc3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot"
sources
make[2]: Entering directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/form'
make[2]: Nothing to be done for 'sources'.
make[2]: Leaving directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/form'
cd misc && /usr/local/bin/make
DESTDIR="/home/patti/buildroot-2015.05-rc3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot"
sources
make[2]: Entering directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/misc'
/bin/sh ./gen-pkgconfig
touch pc-files
make[2]: Leaving directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/misc'
make[1]: Leaving directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9'
rm -rf /home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/misc/pc-files
/usr/local/bin/make -j4 -C
/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9
DESTDIR=/home/patti/buildroot-2015.05-rc3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot
make[1]: Entering directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9'
cd include && /usr/local/bin/make
DESTDIR="/home/patti/buildroot-2015.05-rc3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot"
all
make[2]: Entering directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/include'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/include'
cd ncurses && /usr/local/bin/make
DESTDIR="/home/patti/buildroot-2015.05-rc3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot"
all
make[2]: Entering directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/ncurses'
/home/patti/buildroot-2015.05-rc3/output/host/usr/bin/x86_64-unknown-linux-gnu-gcc
-DHAVE_CONFIG_H -I../ncurses -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DNDEBUG -I. -I../include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  
--param max-inline-insns-single=1200 -fPIC -c ../ncurses/lib_gen.c -o
../obj_s/lib_gen.o
/home/patti/buildroot-2015.05-rc3/output/host/usr/bin/x86_64-unknown-linux-gnu-gcc
-DHAVE_CONFIG_H -I../ncurses -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DNDEBUG -I. -I../include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  
--param max-inline-insns-single=1200 -fPIC -c ../ncurses/./base/lib_immedok.c
-o ../obj_s/lib_immedok.o
/home/patti/buildroot-2015.05-rc3/output/host/usr/bin/x86_64-unknown-linux-gnu-gcc
-DHAVE_CONFIG_H -I../ncurses -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DNDEBUG -I. -I../include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  
--param max-inline-insns-single=1200 -fPIC -c ../ncurses/./base/lib_inchstr.c
-o ../obj_s/lib_inchstr.o
/home/patti/buildroot-2015.05-rc3/output/host/usr/bin/x86_64-unknown-linux-gnu-gcc
-DHAVE_CONFIG_H -I../ncurses -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DNDEBUG -I. -I../include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  
--param max-inline-insns-single=1200 -fPIC -c ../ncurses/./base/lib_initscr.c
-o ../obj_s/lib_initscr.o
In file included from ../ncurses/curses.priv.h:283:0,
                 from ../ncurses/lib_gen.c:19:
_363.c:835:15: error: expected ')' before 'int'
../include/curses.h:1594:56: note: in definition of macro 'mouse_trafo'
 #define mouse_trafo(y,x,to_screen) wmouse_trafo(stdscr,y,x,to_screen)
                                                        ^
Makefile:790: recipe for target '../obj_s/lib_gen.o' failed
make[2]: *** [../obj_s/lib_gen.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/ncurses'
Makefile:109: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9'
package/pkg-generic.mk:156: recipe for target
'/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/.stamp_built'
failed
make: ***
[/home/patti/buildroot-2015.05-rc3/output/build/ncurses-5.9/.stamp_built] Error
2
patti at patti-h50:~/buildroot-2015.05-rc3$ make menuconfig
configuration written to /home/patti/buildroot-2015.05-rc3/.config

*** End of the configuration.
*** Execute 'make' to start the build or try 'make help'.

patti at patti-h50:~/buildroot-2015.05-rc3$

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
