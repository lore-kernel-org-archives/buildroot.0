From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  2 Feb 2010 18:15:11 +0000 (UTC)
Subject: [Buildroot] [Bug 1027] New: Busybox flqsh commands conflict with
 those from mtd-utils
Message-ID: <bug-1027-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1027

           Summary: Busybox flqsh commands conflict with those from mtd-
                    utils
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: buildroot at istwok.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The new busybox-1.16.x.config enables some flash related commands that can
conflict with the same commands in the mtd-utils package.  If both are enabled,
the busybox binary gets overwritten by the mtd-utils binary during the build.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
