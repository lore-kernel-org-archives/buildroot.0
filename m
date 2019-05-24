From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 24 May 2019 18:48:11 +0000
Subject: [Buildroot] [Bug 11911] New: systemd v240 memory leak in
 systemd-journald (buildroot 2019.02 LTS affected)
Message-ID: <bug-11911-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11911

            Bug ID: 11911
           Summary: systemd v240 memory leak in systemd-journald
                    (buildroot 2019.02 LTS affected)
           Product: buildroot
           Version: 2019.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jonah at sense.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

There has been a fix to a large memory leak in systemd-journald v240.  I
believe that the buildroot LTS versions is affected.  Should the patch provided
in the bug report be applied to the LTS branch?

Bug report: https://github.com/systemd/systemd/issues/11502
Accepted patch: https://github.com/systemd/systemd/pull/11527

Alternatively, this fix has been incorporated into systemd v241, which has been
incorporated into buildroot's master branch already.  So another solution would
be to move buildroot LTS to use systemd v241.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
