From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Aug 2010 15:28:13 +0000 (UTC)
Subject: [Buildroot] [Bug 2353] New: [lua] fix build with 2010.08-rc1
Message-ID: <bug-2353-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2353

           Summary: [lua] fix build with 2010.08-rc1
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: francois.perrad at gadz.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2305
  --> https://bugs.busybox.net/attachment.cgi?id=2305
fix

with the attached patch, MYCFLAGS is really used,
so the support of readline and shared lib (with dlopen) works.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
