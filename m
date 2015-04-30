From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Apr 2015 11:05:20 +0000 (UTC)
Subject: [Buildroot] [Bug 8066] New: nodejs crashes when built with gcc 4.9
Message-ID: <bug-8066-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8066

              Host: Xeon
            Target: x86_64 i7
           Summary: nodejs crashes when built with gcc 4.9
           Product: buildroot
           Version: 2015.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ian_ormshaw at waters.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 6016
  --> https://bugs.busybox.net/attachment.cgi?id=6016
Config file

nodejs crashed whenever it is run on an i7 system when compiled with gcc 4.9.
Using the exact same configuration but with gcc 4.8 works correctly.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
