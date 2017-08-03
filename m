From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Aug 2017 09:23:48 +0000
Subject: [Buildroot] [Bug 10146] New: [PATCH] package/skeleton-common fix
 recursive variable
Message-ID: <bug-10146-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10146

            Bug ID: 10146
           Summary: [PATCH] package/skeleton-common fix recursive variable
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: chemobejk at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7141
  --> https://bugs.busybox.net/attachment.cgi?id=7141&action=edit
patch for skeleton-common.mk

This fixes a recursive variable definition introduced by the refactoring in
commit 120307520f69f801bf05df1d2fd3433c6d498551. Simply rename the hook to
remove the recursion.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
