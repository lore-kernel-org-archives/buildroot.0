From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 09 Sep 2016 23:31:41 +0000
Subject: [Buildroot] [Bug 9221] New: [Package] Kodi
Message-ID: <bug-9221-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9221

            Bug ID: 9221
           Summary: [Package] Kodi
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lipkegu at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Kodi does not check the Python Config, buildroot has by default "Precompiled
only" but Kodi need "Uncompiled Python Scripts" this should also be an
dependency

i mean : "Kodi needs "Python .py and .pyc support" otherwise it crashes when
pressing buttons.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
