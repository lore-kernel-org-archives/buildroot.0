From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  8 Jun 2009 08:55:07 +0000 (UTC)
Subject: [Buildroot] [Bug 379] New: update DirectFB to version 1.4.0
Message-ID: <bug-379-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=379

           Summary: update DirectFB to version 1.4.0
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P4
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: s.neumann at raumfeld.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=379)
 --> (https://bugs.busybox.net/attachment.cgi?id=379)
update DirectFB to version 1.4.0

A new stable version of DirectFB has been released upstream,
http://directfb.org/index.php?path=Main%2FNews&entry=2009-06-04-1.niels

Attached patch updates the DirectFB package and introduces a BR2 configuration
option for the RGB16 dithering feature that is new in DirectFB 1.4.0.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
