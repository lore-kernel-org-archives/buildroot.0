From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 08 Apr 2019 16:12:35 +0000
Subject: [Buildroot] [Bug 11761] New: Building custom kernel 5.1-rc3 or
 later breaks on tools/objtool
Message-ID: <bug-11761-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11761

            Bug ID: 11761
           Summary: Building custom kernel 5.1-rc3 or later breaks on
                    tools/objtool
           Product: buildroot
           Version: 2018.11.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: janusz.krzysztofik at intel.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The issue is related to kernel commit 056d28d135bca0b1d0908990338e00e9dadaf057
("objtool: Query pkg-config for libelf location").  Reverting that change
resolves the issue for me.  Maybe it's too early for a bug report but that must
be resolved on buildroot side sooner or later, I believe.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
