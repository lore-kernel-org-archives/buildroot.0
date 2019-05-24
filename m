From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 24 May 2019 08:31:36 +0000
Subject: [Buildroot] [Bug 11906] New: the new version of mesa3d cannot
 support etnaviv when compiled with --enable-autotools
Message-ID: <bug-11906-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11906

            Bug ID: 11906
           Summary: the new version of mesa3d cannot support etnaviv when
                    compiled with --enable-autotools
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: hfekih at cannon.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

when --enable-autotools is used the kmsro driver does not support etnaviv.
so I think mesa3d should be compiled with the meson build system

-- 
You are receiving this mail because:
You are on the CC list for the bug.
