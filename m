From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Apr 2009 14:53:32 +0000 (UTC)
Subject: [Buildroot] [Bug 295] New: gamin installs python support even if
 python is disabled
Message-ID: <bug-295-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=295

           Summary: gamin installs python support even if python is disabled
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: s.neumann at phase-zero.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=255)
 --> (https://bugs.busybox.net/attachment.cgi?id=255)
conditionally disable python support

The gamin package installs files for Python support even if Python is not
enabled in buildroot. The attached patch fixes this.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
