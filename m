From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 05 Mar 2017 14:20:18 +0000
Subject: [Buildroot] [Bug 9711] New: Recent libCEC version bump seems to
 break kodi package
Message-ID: <bug-9711-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9711

            Bug ID: 9711
           Summary: Recent libCEC version bump seems to break kodi package
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: rizom91 at openaliasbox.org
                CC: buildroot at uclibc.org
  Target Milestone: ---

As requested on the GitHub page (see
https://github.com/buildroot/buildroot/commit/bf1c9828f2c7ef37a0af4da5532472fb7e03ba67),
I'm moving my issue/bug report to this bugtracker.

The last libCEC version bump (commit bf1c9828f2c7ef37a0af4da5532472fb7e03ba67)
seems to broke kodi-cec. Reverting this commit fixes the issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
