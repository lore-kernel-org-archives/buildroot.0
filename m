From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 Feb 2013 17:34:32 +0000 (UTC)
Subject: [Buildroot] [Bug 5948] New: AT91 Bootstrap3 defconfig name change
 not detected (by make process)
Message-ID: <bug-5948-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5948

           Summary: AT91 Bootstrap3 defconfig name change not detected (by
                    make process)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: peter.stosz at mentat.hu
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When I set first time Bootloaders/AT91 Bootstrap 3:Defconfig name (for example
at91sam9260df), the process download and compile the requested binary. But when
I change the defonfig name (for example to at91sam9260nf), nothing to do.
After I purge manually the output/build/at91bootstrap3-3.2, the compilation
well done.

BR=2013.02-rc1
OS=deb6_32bit

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
