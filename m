From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  9 Jun 2009 14:51:14 +0000 (UTC)
Subject: [Buildroot] [Bug 385] New: neon: Fix pkgconfig dependency.
Message-ID: <bug-385-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=385

           Summary: neon: Fix pkgconfig dependency.
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


Created an attachment (id=385)
 --> (https://bugs.busybox.net/attachment.cgi?id=385)
Fix neon dependency on pkgconfig

neon should depend on host-pkgconfig rather than pkgconfig.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
