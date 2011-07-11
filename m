From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 11 Jul 2011 06:57:47 +0000 (UTC)
Subject: [Buildroot] [Bug 3961] New: Nfs-utils: Remove SUSv3-function index
Message-ID: <bug-3961-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3961

           Summary: Nfs-utils: Remove SUSv3-function index
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: All
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fpasch at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3469
  --> https://bugs.busybox.net/attachment.cgi?id=3469
nfs-utils-1.2.3-susv3-legacy.patch

nfs-utils uses index()-function. this patch replaces this function.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
