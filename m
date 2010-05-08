From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  8 May 2010 07:01:48 +0000 (UTC)
Subject: [Buildroot] [Bug 1729] New: alsamixergui fails to build
Message-ID: <bug-1729-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1729

           Summary: alsamixergui fails to build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: paul.jones at iwtech.com.au
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


alsamixergui fails to build - see below.

media/stuff/buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-g++
-Os -pipe -Os  -mtune=arm920t -march=armv4t -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/media/stuff/buildroot/output/staging/usr/include
-I/media/stuff/buildroot/output/staging/include
--sysroot=/media/stuff/buildroot/output/staging/ -isysroot
/media/stuff/buildroot/output/staging  -Os -pipe -Os  -mtune=arm920t
-march=armv4t -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/media/stuff/buildroot/output/staging/usr/include
-I/media/stuff/buildroot/output/staging/include
--sysroot=/media/stuff/buildroot/output/staging/ -isysroot
/media/stuff/buildroot/output/staging 
-L/media/stuff/buildroot/output/staging/lib
-L/media/stuff/buildroot/output/staging/usr/lib
--sysroot=/media/stuff/buildroot/output/staging/ -o alsamixergui
Fl_Menu_Button.o Fl_AM.o alsamixer.o -lasound -lm -ldl -lpthread -lfltk 
-lasound -lm -ldl -lpthread -lasound -lm -ldl -lpthread -lfltk
/media/stuff/buildroot/output/staging/usr/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.4/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld:
cannot find -lfltk
collect2: ld returned 1 exit status
make[3]: *** [alsamixergui] Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
