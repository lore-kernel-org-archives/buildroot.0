From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 Feb 2014 13:01:13 +0000 (UTC)
Subject: [Buildroot] [Bug 6860] New: Qt5: add qt5tools
Message-ID: <bug-6860-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6860

           Summary: Qt5: add qt5tools
           Product: buildroot
           Version: 2014.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: syntheticpp at gmx.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


qttools is needed when translation files must be processed on the host (they
are tools like uic or moc, but now in qttools).

libQt5Help.so and libQt5UiTools.a are build for the target.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
