From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Mar 2015 00:09:50 +0000 (UTC)
Subject: [Buildroot] [Bug 7956] New: glibc 2.20 and 2.21 fail to build for
 sh64-buildroot-linux-gnu
Message-ID: <bug-7956-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7956

              Host: x86_64
            Target: sh64-buildroot-linux-gnu
           Summary: glibc 2.20 and 2.21 fail to build for
                    sh64-buildroot-linux-gnu
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: uwe at hermann-uwe.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


This is with git HEAD as of today, glibc 2.20, gcc 4.9.x.

checking build system type... x86_64-unknown-linux-gnu
checking host system type... sh64-buildroot-linux-gnu
checking for sh64-buildroot-linux-gnu-gcc...
/home/jenkins_slave/buildroot-sh64-buildroot-linux-gnu/output/host/usr/bin/sh64-buildroot-linux-gnu-gcc
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether
/home/jenkins_slave/buildroot-sh64-buildroot-linux-gnu/output/host/usr/bin/sh64-buildroot-linux-gnu-gcc
accepts -g... yes
checking for gcc... gcc
checking whether we are using the GNU C++ compiler... no
checking whether
/home/jenkins_slave/buildroot-sh64-buildroot-linux-gnu/output/host/usr/bin/sh64-buildroot-linux-gnu-g++
accepts -g... no
checking for sh64-buildroot-linux-gnu-readelf...
/home/jenkins_slave/buildroot-sh64-buildroot-linux-gnu/output/host/usr/bin/sh64-buildroot-linux-gnu-readelf
checking for sysdeps preconfigure fragments... aarch64 alpha arm hppa i386 m68k
microblaze mips powerpc s390 sh sparc tile x86_64 
configure: running configure fragment for add-on libidn
checking for assembler and linker STT_GNU_IFUNC support... no
checking whether .text pseudo-op must be used... yes
checking sysdep dirs... configure: error: The sh64 is not supported.
package/pkg-generic.mk:172: recipe for target
'/home/jenkins_slave/buildroot-sh64-buildroot-linux-gnu/output/build/glibc-2.20/.stamp_configured'
failed
make: ***
[/home/jenkins_slave/buildroot-sh64-buildroot-linux-gnu/output/build/glibc-2.20/.stamp_configured]
Error 1



checking build system type... x86_64-unknown-linux-gnu
checking host system type... sh64-buildroot-linux-gnu
checking for sh64-buildroot-linux-gnu-gcc...
/home/jenkins_slave/buildroot-sh64-buildroot-linux-gnu/output/host/usr/bin/sh64-buildroot-linux-gnu-gcc
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether
/home/jenkins_slave/buildroot-sh64-buildroot-linux-gnu/output/host/usr/bin/sh64-buildroot-linux-gnu-gcc
accepts -g... yes
checking for gcc... gcc
checking whether we are using the GNU C++ compiler... no
checking whether
/home/jenkins_slave/buildroot-sh64-buildroot-linux-gnu/output/host/usr/bin/sh64-buildroot-linux-gnu-g++
accepts -g... no
checking for sh64-buildroot-linux-gnu-readelf...
/home/jenkins_slave/buildroot-sh64-buildroot-linux-gnu/output/host/usr/bin/sh64-buildroot-linux-gnu-readelf
checking for sysdeps preconfigure fragments... aarch64 alpha arm hppa i386 m68k
microblaze mips nios2 powerpc s390 sh sparc tile x86_64 
configure: running configure fragment for add-on libidn
checking for assembler and linker STT_GNU_IFUNC support... no
checking whether .text pseudo-op must be used... yes
checking sysdep dirs... configure: error: The sh64 is not supported.
package/pkg-generic.mk:172: recipe for target
'/home/jenkins_slave/buildroot-sh64-buildroot-linux-gnu/output/build/glibc-2.21/.stamp_configured'
failed
make: ***
[/home/jenkins_slave/buildroot-sh64-buildroot-linux-gnu/output/build/glibc-2.21/.stamp_configured]
Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
