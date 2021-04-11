From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Apr 2021 21:35:37 +0000
Subject: [Buildroot] [Bug 13741] New: genext2fs does not allow to set perms
 of root node
Message-ID: <bug-13741-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13741

            Bug ID: 13741
           Summary: genext2fs does not allow to set perms of root node
           Product: buildroot
           Version: 2021.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: stsp2 at yandex.ru
                CC: buildroot at uclibc.org
  Target Milestone: ---

genext2fs included in buildroot,
misses this patch:
https://github.com/bestouff/genext2fs/pull/14/commits/8e4b9ae6f051454953a80b8e64443bcea6c9cc46

Without this patch you can't set
the proper permissions for the root
node, which makes genext2fs quite
useless in scenarios that need a
non-default root node perms.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
