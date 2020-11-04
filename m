From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 04 Nov 2020 17:42:48 +0000
Subject: [Buildroot] [Bug 13291] New: BR2_DL_DIR is ignored when creating or
 using a defconfig
Message-ID: <bug-13291-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13291

            Bug ID: 13291
           Summary: BR2_DL_DIR is ignored when creating or using a
                    defconfig
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lancethepants at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

BR2_DL_DIR is not being stored in defconfig with 'make savedefconfig'
It is also being ignored when present in a defconfig.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
