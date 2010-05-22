From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 May 2010 06:42:47 +0000 (UTC)
Subject: [Buildroot] [Bug 1813] New: xkeyboard-config fails to build because
 of intltool problem
Message-ID: <bug-1813-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1813

           Summary: xkeyboard-config fails to build because of intltool
                    problem
           Product: buildroot
           Version: 2010.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: paul at pauljones.id.au
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


checking dependency style of
/home/peejay/mini2440-dev/buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-Os -pipe -Os  -mtune=arm920t -march=armv4t -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/peejay/mini2440-dev/buildroot/output/staging/usr/include
-I/home/peejay/mini2440-dev/buildroot/output/staging/include
--sysroot=/home/peejay/mini2440-dev/buildroot/output/staging/ -isysroot
/home/peejay/mini2440-dev/buildroot/output/staging... none
checking for intltool >= 0.30... ./configure.lineno: 3745: intltool-update: not
found
 found
configure: error: Your intltool is too old.  You need intltool 0.30 or later.
make: ***
[/home/peejay/mini2440-dev/buildroot/output/build/xkeyboard-config-1.8/.stamp_configured]
Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
