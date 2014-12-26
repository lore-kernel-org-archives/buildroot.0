From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Dec 2014 19:33:32 +0000 (UTC)
Subject: [Buildroot] [Bug 7760] New: botan: wrong prefix in botan-1.10.pc
Message-ID: <bug-7760-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7760

           Summary: botan: wrong prefix in botan-1.10.pc
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ruben at rubenkerkhof.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


botan-1.10.pc contains:

prefix=/usr/local
exec_prefix=${prefix}
libdir=${prefix}/lib
includedir=${prefix}/include/botan-1.10

but the headers are installed in /usr/include, not /usr/local/include.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
