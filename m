From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 13 Dec 2009 01:45:03 +0000 (UTC)
Subject: [Buildroot] [Bug 799] New: e2fsprogs small fix
Message-ID: <bug-799-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=799

           Summary: e2fsprogs small fix
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rvpaasen at t3i.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=827)
 --> (https://bugs.busybox.net/attachment.cgi?id=827)
e2fsprogs patch

lsattr/chattr and e2label/e2undo are mixed up in Config.in. This patch fixes
that. It applies to the current git repository.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
