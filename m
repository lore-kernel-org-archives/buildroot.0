From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Dec 2016 10:46:46 +0000
Subject: [Buildroot] [Bug 9526] New: Embedded NPM fails to start with "no
 such file or directory" error
Message-ID: <bug-9526-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

            Bug ID: 9526
           Summary: Embedded NPM fails to start with "no such file or
                    directory" error
           Product: buildroot
           Version: 2016.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: bilge at scriptfusion.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Please see this Travis build log for consistent reproduction of this issue:

https://travis-ci.org/Docker-nano/Node.js/builds/187419495#L378

-- 
You are receiving this mail because:
You are on the CC list for the bug.
