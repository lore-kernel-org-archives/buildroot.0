From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Sep 2018 08:40:18 +0000
Subject: [Buildroot] [Bug 11326] New: sysvinit fails to build in latest GIT
 master
Message-ID: <bug-11326-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11326

            Bug ID: 11326
           Summary: sysvinit fails to build in latest GIT master
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

Created attachment 7766
  --> https://bugs.busybox.net/attachment.cgi?id=7766&action=edit
Add missing system macro include

sysvinit is missing the required macro #include to build on newer glibc
versions.  OpenEmbedded has already patched this, buildroot should do the same.

Tested patch attached.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
