From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 May 2016 20:54:17 +0000
Subject: [Buildroot] [Bug 8931] New: segment fault when compile argp-help.c
 using aarch64-buildroot-linux-gnu-gcc
Message-ID: <bug-8931-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8931

            Bug ID: 8931
           Summary: segment fault when compile argp-help.c using
                    aarch64-buildroot-linux-gnu-gcc
           Product: buildroot
           Version: unspecified
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: orient_zhu at hotmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

make[3]: Entering directory
`/root/buildroot-2016.05-rc1/output/build/glibc-2.22/argp'
/root/buildroot-2016.05-rc1/output/host/usr/bin/aarch64-buildroot-linux-gnu-gcc
argp-help.c -c -std=gnu99 -fgnu89-inline  -O2 -Wall -Werror -Wno-error=undef
-Wundef -Wwrite-strings -fmerge-all-constants -frounding-math
-Wstrict-prototypes   -fexceptions -fexceptions  -ftls-model=initial-exec     
-I../include -I/root/buildroot-2016.05-rc1/output/build/glibc-2.22/build/argp 
-I/root/buildroot-2016.05-rc1/output/build/glibc-2.22/build 
-I../sysdeps/unix/sysv/linux/aarch64  -I../sysdeps/aarch64/nptl 
-I../sysdeps/unix/sysv/linux/generic  -I../sysdeps/unix/sysv/linux/wordsize-64 
-I../sysdeps/unix/sysv/linux/include -I../sysdeps/unix/sysv/linux 
-I../sysdeps/nptl  -I../sysdeps/pthread  -I../sysdeps/gnu 
-I../sysdeps/unix/inet  -I../sysdeps/unix/sysv  -I../sysdeps/unix 
-I../sysdeps/posix  -I../sysdeps/aarch64/fpu  -I../sysdeps/aarch64 
-I../sysdeps/wordsize-64  -I../sysdeps/ieee754/ldbl-128 
-I../sysdeps/ieee754/dbl-64/wordsize-64  -I../sysdeps/ieee754/dbl-64 
-I../sysdeps/ieee754/flt-32  -I../sysdeps/aarch64/soft-fp  -I../sysdeps/ieee754
 -I../sysdeps/generic  -I.. -I../libio -I. -nostdinc -isystem
/root/buildroot-2016.05-rc1/output/host/usr/lib/gcc/aarch64-buildroot-linux-gnu/4.9.3/include
-isystem
/root/buildroot-2016.05-rc1/output/host/usr/lib/gcc/aarch64-buildroot-linux-gnu/4.9.3/include-fixed
-isystem
/root/buildroot-2016.05-rc1/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include
 -D_LIBC_REENTRANT -include
/root/buildroot-2016.05-rc1/output/build/glibc-2.22/build/libc-modules.h
-DMODULE_NAME=libc -include ../include/libc-symbols.h       -o
/root/buildroot-2016.05-rc1/output/build/glibc-2.22/build/argp/argp-help.o -MD
-MP -MF
/root/buildroot-2016.05-rc1/output/build/glibc-2.22/build/argp/argp-help.o.dt
-MT /root/buildroot-2016.05-rc1/output/build/glibc-2.22/build/argp/argp-help.o
argp-help.c: In function '_help':
argp-help.c:1684:1: internal compiler error: Segmentation fault
 }
 ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
