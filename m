From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 29 Mar 2010 15:55:09 +0000 (UTC)
Subject: [Buildroot] [Bug 1447] New: Package installation on target with
 debug symbols is broken
Message-ID: <bug-1447-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1447

           Summary: Package installation on target with debug symbols is
                    broken
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: All
            Status: NEW
          Keywords: patch
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: paulius.zaleckas at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1411)
 --> (https://bugs.busybox.net/attachment.cgi?id=1411)
Fix autotools instalation with symbols

Please see summary for problem description and I have attached patch fixing
this problem.
This patch was send to mailing list few times, but got no attention from
maintainer :(


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
