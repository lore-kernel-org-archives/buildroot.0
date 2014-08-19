From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 Aug 2014 15:30:29 +0000 (UTC)
Subject: [Buildroot] [Bug 7328] New: Git dl of versions in x/y broken
Message-ID: <bug-7328-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7328

           Summary: Git dl of versions in x/y broken
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: vincent.stehle at freescale.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Latest buildroot (1) will not download git versions in x/y properly. Instead,
it will try to download x_y.

This was working fine with an old commit (2).

After bisecting, it seems that commit 54456cc6982598fa45e7c97609e83fabec7c1695
broke it.

Best regards,

V.

(1) latest commit f67e7ba06f5f00dc9153ad364932092692458704
(2) old commit 249464674485ed1fa18a2d0dd5500c84198490b9

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
