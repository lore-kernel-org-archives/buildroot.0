From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Mar 2013 20:34:50 +0000 (UTC)
Subject: [Buildroot] [Bug 6122] New: iconv.h missing for charconv.c build
Message-ID: <bug-6122-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6122

           Summary: iconv.h missing for charconv.c build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mike at mquinn.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Looks like it's building dosfstools...
This is buildroot-2013.02, and I let buildroot build the toolchain, so it's not
an external toolchain issue.....

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
