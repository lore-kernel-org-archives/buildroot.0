From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 03 Dec 2018 23:44:48 +0000
Subject: [Buildroot] [Bug 11546] New: open-vm-tools with glibc 2.28
Message-ID: <bug-11546-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11546

            Bug ID: 11546
           Summary: open-vm-tools with glibc 2.28
           Product: buildroot
           Version: 2018.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: pvizeli at syshack.ch
                CC: buildroot at uclibc.org
  Target Milestone: ---

open-vm-tools could not be building anymore with glibc 2.28. The bug is fixing
in the upstream, and a version bump solves the issue.

Patch:
https://github.com/home-assistant/hassos/blob/fix-glibc/buildroot-patches/0012-openvmtools-bump-version-to-10.3.5.patch

-- 
You are receiving this mail because:
You are on the CC list for the bug.
