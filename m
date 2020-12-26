From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 26 Dec 2020 11:36:46 +0000
Subject: [Buildroot] [Bug 13416] New: dhcpcd start warning message: no such
 user dhcpcd
Message-ID: <bug-13416-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13416

            Bug ID: 13416
           Summary: dhcpcd start warning message: no such user dhcpcd
           Product: buildroot
           Version: 2020.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: alfredo.pons at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Pass --disable-privsep to configure script to eliminate dhcpcd start warning
message: no such user dhcpcd.

Or create dhcpcd user automatically.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
