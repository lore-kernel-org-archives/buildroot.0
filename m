From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Aug 2009 16:09:45 +0000 (UTC)
Subject: [Buildroot] [Bug 549] New: enchant: Fix dependencies.
Message-ID: <bug-549-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=549

           Summary: enchant: Fix dependencies.
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will.newton at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=581)
 --> (https://bugs.busybox.net/attachment.cgi?id=581)
Fix enchant package dependencies

The enchant package dependencies were not correctly specified. This patch adds
all appropriate dependencies to the config and makefile.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
