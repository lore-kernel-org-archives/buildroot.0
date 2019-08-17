From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 17 Aug 2019 18:42:39 +0000
Subject: [Buildroot] [Bug 12116] New: console prompt does not appear after
 login
Message-ID: <bug-12116-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12116

            Bug ID: 12116
           Summary: console prompt does not appear after login
           Product: buildroot
           Version: 2018.08.4
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: daniel.lezcano at linaro.org
                CC: buildroot at uclibc.org
  Target Milestone: ---

Welcome to Buildroot
buildroot login: root
Jan  1 05:13:49 login[37]: root login on 'console'

And stuck there.

buildroot-2018.05.3 works fine

-- 
You are receiving this mail because:
You are on the CC list for the bug.
