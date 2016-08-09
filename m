From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 09 Aug 2016 08:01:53 +0000
Subject: [Buildroot] [Bug 9151] New: qt: fix build with ALSA >= 1.1.x
Message-ID: <bug-9151-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9151

            Bug ID: 9151
           Summary: qt: fix build with ALSA >= 1.1.x
           Product: buildroot
           Version: 2016.05
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: shc_work at mail.ru
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6596
  --> https://bugs.busybox.net/attachment.cgi?id=6596&action=edit
Patch

ALSA > 1.1.x are not determined correctly when configuring the library.
Patch, identical used for Qt5, solves this problem.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
