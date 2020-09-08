From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 08 Sep 2020 11:49:59 +0000
Subject: [Buildroot] [Bug 13186] New: nvidia driver fail to build with 5.6
 kernel
Message-ID: <bug-13186-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13186

            Bug ID: 13186
           Summary: nvidia driver fail to build with 5.6 kernel
           Product: buildroot
           Version: 2020.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ian_ormshaw at waters.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

nvidia driver fail to build with 5.6 kernel.

The nvidia driver included are 390.67 it would appear from:
https://www.nvidia.com/Download/driverResults.aspx/159360/en-us version 440.82
is required for the 5.6 kernel.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
