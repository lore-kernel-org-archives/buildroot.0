From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 17 Dec 2007 22:02:51 -0800
Subject: [Buildroot] [buildroot 0001799]: Build for MIPs 32 processors fails
Message-ID: <de559aa0a2c1795d4f3f0f498329a264@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1799 
====================================================================== 
Reported By:                skibud2
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1799
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-17-2007 22:02 PST
Last Modified:              12-17-2007 22:02 PST
====================================================================== 
Summary:                    Build for MIPs 32 processors fails
Description: 
Building for MIP32 processors fails with the following error:

/home/mike/Desktop/buildroot/toolchain_build_mips/gcc-4.2.1-initial/./gcc/xgcc
-B/home/mike/Desktop/buildroot/toolchain_build_mips/gcc-4.2.1-initial/./gcc/
-B/home/mike/Desktop/buildroot/build_mips/staging_dir/usr/mips-linux-uclibc/bin/
-B/home/mike/Desktop/buildroot/build_mips/staging_dir/usr/mips-linux-uclibc/lib/
-isystem
/home/mike/Desktop/buildroot/build_mips/staging_dir/usr/mips-linux-uclibc/include
-isystem
/home/mike/Desktop/buildroot/build_mips/staging_dir/usr/mips-linux-uclibc/sys-include
-O2 -g -Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem
./include  -I. -I.
-I/home/mike/Desktop/buildroot/toolchain_build_mips/gcc-4.2.1/gcc
-I/home/mike/Desktop/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/.
-I/home/mike/Desktop/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/../include
-I/home/mike/Desktop/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/../libcpp/include
-I/home/mike/Desktop/buildroot/toolchain_build_mips/gmp/include
-I/home/mike/Desktop/buildroot/toolchain_build_mips/mpfr/include
-I/home/mike/Desktop/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/../libdecnumber
-I../libdecnumber  -g0 -finhibit-size-directive -fno-inline-functions
-fno-exceptions -fno-zero-initialized-in-bss -fno-toplevel-reorder   \
          -c
/home/mike/Desktop/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/crtstuff.c
-DCRT_BEGIN \
          -o crtbegin.o
/home/mike/Desktop/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/crtstuff.c:1:
error: unsupported combination: -mabicalls -mabi=eabi
make[2]: *** [crtbegin.o] Error 1
make[2]: Leaving directory
`/home/mike/Desktop/buildroot/toolchain_build_mips/gcc-4.2.1-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/home/mike/Desktop/buildroot/toolchain_build_mips/gcc-4.2.1-initial'
make: ***
[/home/mike/Desktop/buildroot/toolchain_build_mips/gcc-4.2.1-initial/.compiled]
Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-17-07 22:02  skibud2        New Issue                                    
12-17-07 22:02  skibud2        Status                   new => assigned     
12-17-07 22:02  skibud2        Assigned To               => buildroot       
======================================================================
