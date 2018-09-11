From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Sep 2018 09:45:05 +0000
Subject: [Buildroot] [Bug 11336] New: nfs-utils fails to build in latest GIT
 master
Message-ID: <bug-11336-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11336

            Bug ID: 11336
           Summary: nfs-utils fails to build in latest GIT master
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tpearson at raptorengineering.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7771
  --> https://bugs.busybox.net/attachment.cgi?id=7771&action=edit
Add missing system macro includes

nfs-utils is missing the required macro #include to build on newer glibc
versions.

Tested patch attached.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
