From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Jul 2009 19:08:44 +0000 (UTC)
Subject: [Buildroot] [Bug 455] New: Fontconfig problem problem when
	building/installing
Message-ID: <bug-455-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=455

              Host: x86-64
            Target: SH4
           Summary: Fontconfig problem problem when building/installing
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: lionel.landwerlin at openwide.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

when building/installing fontconfig, you might find a problem with make trying
to call $(STAGING_DIR)/bin/sh. Of course it won't work.

Please find a fix as attachment.

Regards,

Lionel


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
