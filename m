From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 07 Apr 2021 06:48:44 +0000
Subject: [Buildroot] [Bug 13731] New: Readline Patch is missing Author
 Information
Message-ID: <bug-13731-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13731

            Bug ID: 13731
           Summary: Readline Patch is missing Author Information
           Product: buildroot
           Version: 2021.02
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: contact at sesu8642.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Most patches contain headers which include information about the author (e.g.
"From: ..." or "Signed-off-by:"). We use this information to give credit to the
patch authors.
This patch is missing such information:
https://git.busybox.net/buildroot/tree/package/readline/0000-curses-link.patch

I suggest adding the information to the patch so that credit can be given
appopriately.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
