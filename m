From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 27 Jun 2011 11:18:35 +0000 (UTC)
Subject: [Buildroot] [Bug 3925] New: midori not getting compile
Message-ID: <bug-3925-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3925

           Summary: midori not getting compile
           Product: buildroot
           Version: 2011.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: azhar.karnalkar at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi team buildroot

I am trying to buildrootfilesystem with midori (lightweight window web browser)

but it fails while compiling 1 of its library

below is the log of the error:
make[3]: Entering directory
`/home/eclat/Downloads/buildroot-2011.02/output/build/icu-4.4.2/source/tools/makeconv'
/home/eclat/arm-2009q3//bin/arm-none-linux-gnueabi-g++
--sysroot=/home/eclat/Downloads/buildroot-2011.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot
-pipe -Os  -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -W -Wall -ansi
-pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long 
-L/home/eclat/Downloads/buildroot-2011.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/lib
-L/home/eclat/Downloads/buildroot-2011.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib
 -o ../../bin/makeconv makeconv.o ucnvstat.o genmbcs.o gencnvex.o -L../../lib
-licutu -L../../lib -licui18n -L../../lib -licuuc -L../../lib -L../../stubdata
-licudata -lpthread -ldl -lm  
/home/eclat/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/../../../../arm-none-linux-gnueabi/bin/ld:
../../bin/makeconv: hidden symbol `__sync_val_compare_and_swap_4' in
/home/eclat/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/libgcc.a(linux-atomic.o)
is referenced by DSO
/home/eclat/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/../../../../arm-none-linux-gnueabi/bin/ld:
final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status
make[3]: *** [../../bin/makeconv] Error 1
make[3]: Leaving directory
`/home/eclat/Downloads/buildroot-2011.02/output/build/icu-4.4.2/source/tools/makeconv'

Can u please send me some info on how to debug this error as i am stuck on it
from last 3 days
Thanks and regards,
Azhar

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
