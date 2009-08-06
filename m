From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 Aug 2009 17:00:39 +0000 (UTC)
Subject: [Buildroot] [Bug 541] New: Removal of CVS directories in target
 filesystem broken
Message-ID: <bug-541-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=541

           Summary: Removal of CVS directories in target filesystem broken
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will.newton at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=577)
 --> (https://bugs.busybox.net/attachment.cgi?id=577)
Fix find command syntax for CVS directory removal

Commit 027aa1d2ec07402d9aa1df3825207f120acae497 stops CVS directories from
being removed in the target filesystem. The attached patch fixes the problem,
which is caused by the incorrect use of the find command.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
