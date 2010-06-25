From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Jun 2010 15:28:57 +0000 (UTC)
Subject: [Buildroot] [Bug 2125] New: libXfont build fail
Message-ID: <bug-2125-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2125

           Summary: libXfont build fail
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jsteckli at os.inf.tu-dresden.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2125
  --> https://bugs.busybox.net/attachment.cgi?id=2125
Remove relevant makefile parts.

libXfont tries to build its developer docs (although disabled) and fails. This
seems to be an upstream problem, as it also happens if I do a native build of
the library.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
