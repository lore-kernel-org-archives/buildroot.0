From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  5 Nov 2013 13:18:33 +0000 (UTC)
Subject: [Buildroot] [Bug 6662] New: internal compiler error: Segmentation
 fault during making buidRoot-AT91
Message-ID: <bug-6662-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6662

           Summary: internal compiler error: Segmentation fault during
                    making buidRoot-AT91
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: wutengss at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2-intermediate/./gcc/xgcc
-B/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2-intermediate/./gcc/
-B/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/bin/
-B/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/lib/
-isystem
/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/include
-isystem
/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sys-include
   -g -Os -O2  -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition  -isystem ./include   -fPIC
-fno-inline -g -DIN_LIBGCC2 -fbuilding-libgcc -fno-stack-protector   -fPIC
-fno-inline -I. -I. -I../.././gcc
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/.
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/../gcc
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/../include 
-DHAVE_CC_TLS  -o _powisf2.o -MT _powisf2.o -MD -MP -MF _powisf2.dep
-DL_powisf2 -c
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c
-fvisibility=hidden -DHIDE_EXPORTS
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2-intermediate/./gcc/xgcc
-B/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2-intermediate/./gcc/
-B/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/bin/
-B/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/lib/
-isystem
/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/include
-isystem
/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sys-include
   -g -Os -O2  -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition  -isystem ./include   -fPIC
-fno-inline -g -DIN_LIBGCC2 -fbuilding-libgcc -fno-stack-protector   -fPIC
-fno-inline -I. -I. -I../.././gcc
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/.
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/../gcc
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/../include 
-DHAVE_CC_TLS  -o _powidf2.o -MT _powidf2.o -MD -MP -MF _powidf2.dep
-DL_powidf2 -c
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c
-fvisibility=hidden -DHIDE_EXPORTS
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2-intermediate/./gcc/xgcc
-B/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2-intermediate/./gcc/
-B/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/bin/
-B/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/lib/
-isystem
/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/include
-isystem
/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sys-include
   -g -Os -O2  -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition  -isystem ./include   -fPIC
-fno-inline -g -DIN_LIBGCC2 -fbuilding-libgcc -fno-stack-protector   -fPIC
-fno-inline -I. -I. -I../.././gcc
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/.
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/../gcc
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/../include 
-DHAVE_CC_TLS  -o _powixf2.o -MT _powixf2.o -MD -MP -MF _powixf2.dep
-DL_powixf2 -c
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c
-fvisibility=hidden -DHIDE_EXPORTS
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2-intermediate/./gcc/xgcc
-B/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2-intermediate/./gcc/
-B/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/bin/
-B/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/lib/
-isystem
/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/include
-isystem
/home/teng/buildroot-at91/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sys-include
   -g -Os -O2  -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition  -isystem ./include   -fPIC
-fno-inline -g -DIN_LIBGCC2 -fbuilding-libgcc -fno-stack-protector   -fPIC
-fno-inline -I. -I. -I../.././gcc
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/.
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/../gcc
-I/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/../include 
-DHAVE_CC_TLS  -o _powitf2.o -MT _powitf2.o -MD -MP -MF _powitf2.dep
-DL_powitf2 -c
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c
-fvisibility=hidden -DHIDE_EXPORTS
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c: In
function
'__subvdi3':/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c:
In function
'__negvdi2':/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c:
In function
'__absvdi2':/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c:
In function '__addvdi3':
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c:111:1:
internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
make[2]: *** [_addvdi3.o] Error 1
make[2]: *** Waiting for unfinished jobs....

/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c:149:1:
internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
make[2]: *** [_subvdi3.o] Error 1

/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c:273:1:
internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
make[2]: *** [_absvdi2.o] Error 1

/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c:214:1:
internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
make[2]: *** [_negvdi2.o] Error 1
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c: In
function '__mulvsi3':
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c:162:1:
internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
make[2]: *** [_mulvsi3.o] Error 1
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c: In
function '__powidf2':
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c:1779:1:
internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
make[2]: *** [_powidf2.o] Error 1
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c: In
function '__mulvdi3':
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c:397:1:
internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
make[2]: *** [_mulvdi3.o] Error 1
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c: In
function '__popcountdi2':
/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c:849:1:
internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
make[2]: *** [_popcountdi2.o] Error 1
make[2]: Leaving directory
`/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2-intermediate/arm-buildroot-linux-uclibcgnueabi/libgcc'
make[1]: *** [all-target-libgcc] Error 2
make[1]: Leaving directory
`/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2-intermediate'
make: ***
[/home/teng/buildroot-at91/output/toolchain/gcc-4.7.2-intermediate/.compiled]
Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
