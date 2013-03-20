From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 20 Mar 2013 13:58:34 +0000 (UTC)
Subject: [Buildroot] [Bug 6128] New: [patch] Fix S01logging pidfile handling
Message-ID: <bug-6128-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6128

           Summary: [patch] Fix S01logging pidfile handling
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: arved at arved.at
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


There are two issues with S01logging

1. The initscript relies on the daemon creating a Pidfile, but the relevant
option has been disabled in the busybox-1.20.x-config. 
2. The name contains a typo syslogd vs. syslog.

This is fixed with the attached patch.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
