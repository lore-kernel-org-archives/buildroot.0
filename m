From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Aug 2017 07:49:51 +0000
Subject: [Buildroot] [Bug 10261] New: Grub2 fails to build for x86_64
Message-ID: <bug-10261-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10261

            Bug ID: 10261
           Summary: Grub2 fails to build for x86_64
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ian_ormshaw at waters.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Build system:

Fedora 25 x86_64

Target system AMD x86_64 system

Buildroot version 2017.08-rc3

Error messages:

checking for x86_64-gcc...
/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-gcc
checking for x86_64-objcopy... no
checking for objcopy... objcopy
configure: WARNING: using cross tools not prefixed with host triplet
checking for x86_64-strip... no
checking for strip... strip
checking for x86_64-nm... no
checking for nm... nm
checking for x86_64-ranlib... no
checking for ranlib... ranlib
checking which extra warnings work... 
checking if compiling with clang... no
checking for options to compile assembly... 
checking whether -freg-struct-return works... yes
checking for options to get soft-float... -msoft-float
checking whether -fno-dwarf2-cfi-asm works... yes
checking whether -mno-stack-arg-probe works... yes
checking whether -fno-asynchronous-unwind-tables works... yes
checking whether -fno-unwind-tables works... yes
checking for target linking format... unknown
configure: error: no suitable link format found
package/pkg-generic.mk:217: recipe for target
'/home/ian/projects/dev/builds/x86_64-5006295/buildroot/build/grub2-2.02/.stamp_configured'
failed
make[2]: ***
[/home/ian/projects/dev/builds/x86_64-5006295/buildroot/build/grub2-2.02/.stamp_configured]
Error 1
Makefile:16: recipe for target '_all' failed
make[1]: *** [_all] Error 2
make[1]: Leaving directory
'/home/ian/projects/dev/builds/x86_64-5006295/buildroot'
Makefile:105: recipe for target 'buildroot' failed
make: *** [buildroot] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
