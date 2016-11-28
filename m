From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 28 Nov 2016 22:49:48 +0000
Subject: [Buildroot] [Bug 9456] New: mkusers script bash errors
Message-ID: <bug-9456-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9456

            Bug ID: 9456
           Summary: mkusers script bash errors
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: georgebrmz at oss3d.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

This happens with the latest git as of 2016/11/28:

/buildroot/support/scripts/mkusers: line 417: [: -ge: unary operator expected
/buildroot/support/scripts/mkusers: line 426: [: -eq: unary operator expected

-- 
You are receiving this mail because:
You are on the CC list for the bug.
