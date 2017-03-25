From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 25 Mar 2017 08:54:36 +0000
Subject: [Buildroot] [Bug 9776] New: libubox build failed
Message-ID: <bug-9776-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9776

            Bug ID: 9776
           Summary: libubox build failed
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: linhuikui at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

libubox: installs files in
/home/lhk/workspace/smdk2440/host/usr/arm-buildroot-linux-gnueabi/sysroot//home/lhk/workspace/smdk2440
package/pkg-generic.mk:255: recipe for target
'/home/lhk/workspace/smdk2440/build/libubox-290c64ef5b5c3e75be851594f269d6a9568e64e5/.stamp_staging_installed'
failed

above is the logs from linux console

-- 
You are receiving this mail because:
You are on the CC list for the bug.
