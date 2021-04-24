From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 24 Apr 2021 15:13:50 +0000
Subject: [Buildroot] [Bug 13771] New: package htop has undeclared dependency
 on host python
Message-ID: <bug-13771-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13771

            Bug ID: 13771
           Summary: package htop has undeclared dependency on host python
           Product: buildroot
           Version: 2021.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: anders.f.bjorklund at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

>>> htop 2.2.0 Building

/usr/bin/env: ?python?: No such file or directory

-- 
You are receiving this mail because:
You are on the CC list for the bug.
