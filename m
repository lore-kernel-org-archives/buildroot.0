From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 05 Mar 2021 11:15:19 +0000
Subject: [Buildroot] [Bug 13581] New: jpegsrc.v9d.tar.gz has changed hash
Message-ID: <bug-13581-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13581

            Bug ID: 13581
           Summary: jpegsrc.v9d.tar.gz has changed hash
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mshaforostov at airmusictech.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

jpegsrc.v9d.tar.gz has been silenstly replaced on the server, according to [1]
the only change is BOM removal from few Makefiles

The new hash is
6c434a3be59f8f62425b2e3c077e785c9ce30ee5874ea1c270e843f273ba71ee

[1] https://github.com/conan-io/conan-center-index/issues/4151

Is it possible to update it?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
