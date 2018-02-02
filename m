From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Feb 2018 11:54:47 +0000
Subject: [Buildroot] [Bug 10736] New: Recent versions of aufs-util package
 do not build
Message-ID: <bug-10736-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10736

            Bug ID: 10736
           Summary: Recent versions of aufs-util package do not build
           Product: buildroot
           Version: 2017.11.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: alexander.hildebrand at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Building aufs-util aufs4.9 currently does not build, because it does not find
#include <linux/aufs_type.h>.

This issue can be resolved by manually adding the include directory of
build/aufs4.9 to aufs-util.mk. However, I don't know how to fix this issue
correctly...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
