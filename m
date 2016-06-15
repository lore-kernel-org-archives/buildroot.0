From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 15 Jun 2016 07:51:09 +0000
Subject: [Buildroot] [Bug 9006] New: gcc with c++ support v4 and v5 fail to
 compile on fedora 24 (gcc v6)
Message-ID: <bug-9006-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9006

            Bug ID: 9006
           Summary: gcc with c++ support v4 and v5 fail to compile on
                    fedora 24 (gcc v6)
           Product: buildroot
           Version: 2016.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ian_ormshaw at waters.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6491
  --> https://bugs.busybox.net/attachment.cgi?id=6491&action=edit
failing gcc config

On fedora 24 (gcc v6) I cannot build the gcc 4 or 5 toolchains with c++ support

-- 
You are receiving this mail because:
You are on the CC list for the bug.
