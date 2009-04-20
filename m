From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Apr 2009 12:04:30 +0000 (UTC)
Subject: [Buildroot] [Bug 293] New: update samba to version 3.3.3
Message-ID: <bug-293-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=293

           Summary: update samba to version 3.3.3
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P3
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: s.neumann at phase-zero.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=253)
 --> (https://bugs.busybox.net/attachment.cgi?id=253)
update samba to version 3.3.3

Samba is somewhat outdated in buildroot with version 3.2.7. The attached patch
changes the version to the latest stable release (version 3.3.3) and also takes
care of updating the patches accordingly.

Please consider this for inclusion in buildroot. I am working on further
changes to Samba, so getting this patch into SVN would help me a lot.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
