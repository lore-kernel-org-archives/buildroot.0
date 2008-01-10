From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 9 Jan 2008 22:05:13 -0800
Subject: [Buildroot] [buildroot 0001919]: i can't complier the xorg used the
	buildroot
Message-ID: <c7015a1221375456432bd7e0fd685b84@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1919 
====================================================================== 
Reported By:                msj0520
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1919
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-09-2008 22:05 PST
Last Modified:              01-09-2008 22:05 PST
====================================================================== 
Summary:                    i can't complier the xorg used the buildroot
Description: 
when the buildroot build the xorg automatic, it always appear the same
error:

make[5]: Entering directory
`/opt/buildroot/build_i386/xc/programs/dpsinfo'
/opt/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc -Os
-ansi -pedantic -Wall -Wpointer-arith -Wundef     -I../..
-I../../exports/include   -Dlinux -D__i386__ -D_POSIX_SOURCE              
              -D_BSD_SOURCE -D_GNU_SOURCE -DX_LOCALE  -DFUNCPROTO=15
-DNARROWPROTO       -c -o iwraps.o iwraps.c
/opt/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc -Os
-ansi -pedantic -Wall -Wpointer-arith -Wundef     -I../..
-I../../exports/include   -Dlinux -D__i386__ -D_POSIX_SOURCE              
              -D_BSD_SOURCE -D_GNU_SOURCE -DX_LOCALE  -DFUNCPROTO=15
-DNARROWPROTO       -c -o dpsinfo.o dpsinfo.c
rm -f dpsinfo
/opt/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc -o
dpsinfo -Os -ansi -pedantic -Wall -Wpointer-arith -Wundef    
-L../../exports/lib   iwraps.o dpsinfo.o -ldps -lXt -lSM -lICE -lX11
-L/opt/buildroot/build_i386/staging_dir/i386-linux-uclibc/lib     
/opt/buildroot/build_i386/staging_dir/usr/bin/../lib/gcc/i386-linux-uclibc/4.2.1/../../../../i386-linux-uclibc/bin/ld:
warning: libXext.so.6, needed by ../../exports/lib/libdps.so, not found
(try using -rpath or -rpath-link)
../../exports/lib/libdps.so: undefined reference to `bcopy'
collect2: ld returned 1 exit status
make[5]: *** [dpsinfo]
&http://busybox.net/bugs/view.php?id=38169;&http://busybox.net/bugs/view.php?id=35823;
1
make[5]: Leaving directory
`/opt/buildroot/build_i386/xc/programs/dpsinfo'
make[4]: *** [all]
&http://busybox.net/bugs/view.php?id=38169;&http://busybox.net/bugs/view.php?id=35823;
2
make[4]: Leaving directory `/opt/buildroot/build_i386/xc/programs'
make[3]: *** [all]
&http://busybox.net/bugs/view.php?id=38169;&http://busybox.net/bugs/view.php?id=35823;
2
make[3]: Leaving directory `/opt/buildroot/build_i386/xc'
make[2]: *** [World]
&http://busybox.net/bugs/view.php?id=38169;&http://busybox.net/bugs/view.php?id=35823;
2
make[2]: Leaving directory `/opt/buildroot/build_i386/xc'
make[1]: *** [World]
&http://busybox.net/bugs/view.php?id=38169;&http://busybox.net/bugs/view.php?id=35823;
2
make[1]: Leaving directory `/opt/buildroot/build_i386/xc'

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-09-08 22:05  msj0520        New Issue                                    
01-09-08 22:05  msj0520        Status                   new => assigned     
01-09-08 22:05  msj0520        Assigned To               => buildroot       
======================================================================
