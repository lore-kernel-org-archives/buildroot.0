From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Jul 2009 13:39:22 +0000 (UTC)
Subject: [Buildroot] [Bug 459] New: libgtk2 autoreconf
Message-ID: <bug-459-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=459

              Host: x86-64
            Target: SH4
           Summary: libgtk2 autoreconf
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

currently it's not possible to reconfigure the libgtk2 packge.
There is 2 problems :
 1) gtk-doc m4 macros are missing
 2) the tests directory which is disabled by the libgtk2-2.12.6-no-tests.patch
patch is not disabled anymore after reconfiguration.

Please find a patch that fixes both issues as attachment.

Regards,

Lionel


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
