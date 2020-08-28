From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 28 Aug 2020 10:17:34 +0000
Subject: [Buildroot] [Bug 13171] New: make qt5base error
Message-ID: <bug-13171-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13171

            Bug ID: 13171
           Summary: make qt5base error
           Product: buildroot
           Version: 2020.02
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: 540915622 at qq.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Using buildroot 2020.2 version will have the error in the picture, when I use
2019.02 there is no such problem. Through research, it is found that only line
802 of the \output\build\qt5base-5.12.2\configure file needs to be modified to
(cd "$outpath/qmake"; $MAKE) || exit 2 can also be compiled and passed

-- 
You are receiving this mail because:
You are on the CC list for the bug.
