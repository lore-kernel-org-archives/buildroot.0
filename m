From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Dec 2014 14:59:27 +0000 (UTC)
Subject: [Buildroot] [Bug 7754] New: make: ***
 [/..../buildroot-2014.11/output/build/host-gcc-initial-4.8.3/.stamp_built]
 Error 2
Message-ID: <bug-7754-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7754

           Summary: make: ***
                    [/..../buildroot-2014.11/output/build/host-gcc-initial
                    -4.8.3/.stamp_built] Error 2
           Product: buildroot
           Version: 2014.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: defseg at mail.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


make gemu_mips_malta_defconfig (or make gemu_x86_defconfig)
make

..
..
make: ***
[/..../buildroot-2014.11/output/build/host-gcc-initial-4.8.3/.stamp_built]
Error 2



PS: I checked only on gemu_mips_malta_defconfig & gemu_x86_defconfig

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
