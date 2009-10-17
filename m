From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 17 Oct 2009 21:27:18 +0000 (UTC)
Subject: [Buildroot] [Bug 667] New: [PATCH] e2fsprogs
Message-ID: <bug-667-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=667

           Summary: [PATCH] e2fsprogs
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rvpaasen at t3i.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=703)
 --> (https://bugs.busybox.net/attachment.cgi?id=703)
e2fsprogs package

Hi,

I have updated the e2fsprogs package to the new makefile format. I added the
tools from the 1.41.9 release of e2fsprogs that could not yet be (de)selected
(freefrag, e2undo) to the menu in Config.in.

Patch is attached and to be aplied to the current git.

Richard.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
