From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Nov 2011 20:58:44 +0000 (UTC)
Subject: [Buildroot] [Bug 4484] New: libstdc++ has _GLIBCXX_HAVE_FENV_H
 undefined but uclibc appears to have a fenv.h
Message-ID: <bug-4484-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4484

           Summary: libstdc++ has _GLIBCXX_HAVE_FENV_H undefined but
                    uclibc appears to have a fenv.h
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: holger at freyther.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


bits/c++config.h does not define GLUBCXX_HAVE_FENV but it appears that uclibc
has basic support for it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
