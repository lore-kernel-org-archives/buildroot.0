From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 26 Jul 2011 15:15:11 +0000 (UTC)
Subject: [Buildroot] [Bug 3997] New: bump libroxml to v2.1.0
Message-ID: <bug-3997-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3997

           Summary: bump libroxml to v2.1.0
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://www.libroxml.net
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tristan.lelong at blunderer.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3499
  --> https://bugs.busybox.net/attachment.cgi?id=3499
bump to v2.1.0

This patch update libroxml to version 2.1.0

this version integrate:
- previous buildroot patch to ignore doxygen if not requested
- fixes on process-instruction-node parsing
- fixes on valid XML document creation
- fix on roxml_get_chld behavious
- add some API function to access process-instruction and comment nodes
- update of documentation

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
