From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Jun 2019 12:00:56 +0000
Subject: [Buildroot] [Bug 11986] New: Document TARGET_ variables
Message-ID: <bug-11986-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11986

            Bug ID: 11986
           Summary: Document TARGET_ variables
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: xonqnoppp at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

It is really difficult to know if, when creating a custom package, we should
use TARGET_MAKE_ENV and/or TARGET_CONFIGURE_OPTS (and maybe other hidden
variables I am not aware of...). It would help to document them. Moreover, it
is in some lines of code example, but not mention in documentation itself...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
