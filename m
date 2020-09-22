From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 22 Sep 2020 02:42:04 +0000
Subject: [Buildroot] [Bug 13216] New: [Documentation] 2020.02.6 requires GNU
 find utils
Message-ID: <bug-13216-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13216

            Bug ID: 13216
           Summary: [Documentation] 2020.02.6 requires GNU find utils
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: waitman at waitman.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

The documentation states that GNU binutils are required, however binutils does
not include "find". If user has a "find" that is not from GNU find utils
package then the Makefile stops with error.

Documentation should specify that GNU find utils are required.

../buildroot-2020.02.6/output/build/host-e2fsprogs-1.45.6

find: unrecognized: -printf


GNU find utils are available at the following URL:

https://www.gnu.org/software/findutils/

(optionally update Makefile so that GNU find utils are not required)

Additionally there is no "2020.06.2" option (the long term support release) in
the version select box, in the bug report.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
