From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 24 Jul 2012 05:46:17 +0000 (UTC)
Subject: [Buildroot] [Bug 5390] New: System banner - change to empty doesn't
 remove /etc/issue
Message-ID: <bug-5390-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5390

           Summary: System banner - change to empty doesn't remove
                    /etc/issue
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: net147 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


After building a root filesystem, changing the system banner to nothing and
then doing make doesn't remove /etc/issue from the root filesystem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
