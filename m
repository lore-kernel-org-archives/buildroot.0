From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Jun 2009 15:18:27 +0000 (UTC)
Subject: [Buildroot] [Bug 423] New: cairo: Allow DirectFB backend to be
	built.
Message-ID: <bug-423-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=423

           Summary: cairo: Allow DirectFB backend to be built.
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will.newton at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=425)
 --> (https://bugs.busybox.net/attachment.cgi?id=425)
Allow cairo DirectFB backend to be configured.

This patch allows the DirectFB backend of cairo to be configured. depends
rather than select is used in the Config.in to avoid a recursive dependency
issue.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
