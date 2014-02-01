From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  1 Feb 2014 00:46:32 +0000 (UTC)
Subject: [Buildroot] [Bug 6830] New: Qt5: no fonts are installed
Message-ID: <bug-6830-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6830

           Summary: Qt5: no fonts are installed
           Product: buildroot
           Version: 2014.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: syntheticpp at gmx.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Qt5 was build with linuxfb only and widgets, fontconfig enabled, but
/output/target/usr/lib/font is empty.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
