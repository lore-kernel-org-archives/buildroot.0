From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Feb 2021 07:37:48 +0000
Subject: [Buildroot] [Bug 13551] New: 2021.02.rc2: Unicode not work on qt
 5.15.2
Message-ID: <bug-13551-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13551

            Bug ID: 13551
           Summary: 2021.02.rc2: Unicode not work on qt 5.15.2
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: alfredo.pons at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

qInfo() << "\u25C0";

Unicodes not work.

I attach my config.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
