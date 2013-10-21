From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 21 Oct 2013 09:22:13 +0000 (UTC)
Subject: [Buildroot] [Bug 6578] New: udisks package broken
Message-ID: <bug-6578-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6578

           Summary: udisks package broken
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: berenscott at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Attempting to add udisks causes gudev configure error:

configure: error: Package requirements (gudev-1.0 >= 147) were not met:

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
