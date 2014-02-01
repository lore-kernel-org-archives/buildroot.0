From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  1 Feb 2014 15:26:14 +0000 (UTC)
Subject: [Buildroot] [Bug 6848] New: Qt5: no text shown in simple QWidget /
 frame-buffer setup
Message-ID: <bug-6848-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6848

           Summary: Qt5: no text shown in simple QWidget / frame-buffer
                    setup
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


Created attachment 5198
  --> https://bugs.busybox.net/attachment.cgi?id=5198
Qt5 on Cortex-A8 with QWidgets in frame-buffer

Reproduce: build attached defconfig/.config and start the calculator example:

/usr/lib/qt/examples/widgets/widgets/calculator/calculator -platform linuxfb

-> no numbers are visible.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
