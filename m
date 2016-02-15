From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Feb 2016 11:55:25 +0000
Subject: [Buildroot] [Bug 8696] New: xdriver_xf86-input-mouse install header
 files in target directory
Message-ID: <bug-8696-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8696

            Bug ID: 8696
           Summary: xdriver_xf86-input-mouse install header files in
                    target directory
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: buildroot at netsolux.ch
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

xdriver_xf86-input-mouse package install evdev-properties.h and
xf86-mouse-properties.h in
output/target/data/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/xorg.

[root at devel linux]$ ls -lsa
/data/buildroot/output/target/data/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/xorg/
total 16
4 drwxr-xr-x 2 root root 4096 Feb 15 00:01 .
4 drwxr-xr-x 3 root root 4096 Feb 15 00:01 ..
4 -rw-r--r-- 1 root root 3585 Feb 15 00:01 evdev-properties.h
4 -rw-r--r-- 1 root root 1489 Feb 15 00:01 xf86-mouse-properties.h

-- 
You are receiving this mail because:
You are on the CC list for the bug.
