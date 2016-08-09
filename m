From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 09 Aug 2016 08:08:58 +0000
Subject: [Buildroot] [Bug 9156] New: qt: Fix missing runtime Qt3Support
	dependency
Message-ID: <bug-9156-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9156

            Bug ID: 9156
           Summary: qt: Fix missing runtime Qt3Support dependency
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

Created attachment 6601
  --> https://bugs.busybox.net/attachment.cgi?id=6601&action=edit
Patch

Qt3Support module has a runtime dependency on QtSql.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
