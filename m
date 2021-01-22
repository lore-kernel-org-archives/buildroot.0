From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 22 Jan 2021 05:15:41 +0000
Subject: [Buildroot] [Bug 13476] New: Building ti-gfx package with custom
 linux does not work
Message-ID: <bug-13476-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13476

            Bug ID: 13476
           Summary: Building ti-gfx package with custom linux  does not
                    work
           Product: buildroot
           Version: 2020.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: pholden at nklabs.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8731
  --> https://bugs.busybox.net/attachment.cgi?id=8731&action=edit
Output from the build.

The package doesn't seem to honor LINUX_DIR, even though it is in the .mk file.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
