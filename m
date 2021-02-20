From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 20 Feb 2021 16:56:43 +0000
Subject: [Buildroot] [Bug 13546] New: ld in binutils 2.36-3 does supports
 neither -no-pie nor --no-pie
Message-ID: <bug-13546-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13546

            Bug ID: 13546
           Summary: ld in binutils 2.36-3 does supports neither -no-pie
                    nor --no-pie
           Product: buildroot
           Version: 2020.11.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jarkko.sakkinen at iki.fi
                CC: buildroot at uclibc.org
  Target Milestone: ---

ld in binutils 2.36-3 does supports neither -no-pie nor --no-pie


Workaround: in output/build/host-qemu-5.2.0/build/config-host.mak:
LDFLAGS_NOPIE=""

See also

-- 
You are receiving this mail because:
You are on the CC list for the bug.
