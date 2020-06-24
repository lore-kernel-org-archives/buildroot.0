From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Jun 2020 19:55:01 +0000
Subject: [Buildroot] [Bug 13031] New: nodejs: RangeError at new ArrayBuffer()
Message-ID: <bug-13031-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13031

            Bug ID: 13031
           Summary: nodejs: RangeError at new ArrayBuffer()
           Product: buildroot
           Version: 2020.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sveyret at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

There is a bug on NodeJS which seems to come from the cross-compilation x64 ->
arm. NodeJS fails on the target as soon as an ArrayBuffer is created somewhere.

Please see https://github.com/nodejs/node/issues/31370

-- 
You are receiving this mail because:
You are on the CC list for the bug.
