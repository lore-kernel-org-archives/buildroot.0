From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Aug 2009 14:53:22 +0000 (UTC)
Subject: [Buildroot] [Bug 547] New: berkeleydb: Update config.{sub,
 guess} in configure step.
Message-ID: <bug-547-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=547

           Summary: berkeleydb: Update config.{sub,guess} in configure step.
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


Created an attachment (id=579)
 --> (https://bugs.busybox.net/attachment.cgi?id=579)
Update configure helper scripts for berkeley db

This patch updates the config.{sub,guess} scripts before configuring berkeley
db, which is required ons ome platforms.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
