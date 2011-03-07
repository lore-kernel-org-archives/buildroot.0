From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Mar 2011 15:06:17 +0000 (UTC)
Subject: [Buildroot] [Bug 3379] New: New Package:  bonnie++
Message-ID: <bug-3379-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3379

           Summary: New Package:  bonnie++
           Product: buildroot
           Version: 2011.02
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mort at bork.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3067
  --> https://bugs.busybox.net/attachment.cgi?id=3067
patch file

Bonnie++ is a useful benchmark program for testing filesystem performance.

This patch adds the bonnie package.  It was posted to the mailing list in late
January 2011 and I have enhanced the patch to address feedback from Thomas
Petazzoni (spacing issues, unnecessary bits in the .mk file) and Thomas
Petazzoni (C++ dependency)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
