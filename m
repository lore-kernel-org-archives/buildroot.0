From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Apr 2017 13:00:23 +0000
Subject: [Buildroot] [Bug 9806] New: libseccomp is not available when
	BR2_arm=y
Message-ID: <bug-9806-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9806

            Bug ID: 9806
           Summary: libseccomp is not available when BR2_arm=y
           Product: buildroot
           Version: 2017.02.1
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tino.rusch at webvariants.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

libseccomp has as dependency at least aarch64. This can be extended to also be
available when BR2_arm=y. Libseccomp supports this now (and also in 2.2.0 which
is currently referenced in buildroot).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
