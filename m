From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Mar 2010 08:36:25 +0000 (UTC)
Subject: [Buildroot] [Bug 1405] New: WebKit fails to build because
 pthread_getattr_np is not implemented in uClibc
Message-ID: <bug-1405-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1405

             Build: buildroot-git
           Summary: WebKit fails to build because pthread_getattr_np is not
                    implemented in uClibc
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: paul.jones at iwtech.com.au
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1369)
 --> (https://bugs.busybox.net/attachment.cgi?id=1369)
Patch WebKit because pthread_getattr_np is not implemented in uClibc

WebKit fails to build because pthread_getattr_np is not implemented in uClibc.

Attached patch fixes the problem.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
