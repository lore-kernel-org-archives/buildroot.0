From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Aug 2017 20:06:29 +0000
Subject: [Buildroot] [Bug 10281] New: lsblk does not compile for util-linux
Message-ID: <bug-10281-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10281

            Bug ID: 10281
           Summary: lsblk does not compile for util-linux
           Product: buildroot
           Version: 2017.05.1
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: adyke at harris.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

lsblk is not compiled with util-linux

Commit 031659024b3cf27bb68dc58d07519b563ef472a1 indicates the
BR2_PACKAGE_UTIL_LINUX_LSBLK option was removed when upgrading to util-linux
2.28.2 since that version always built lsblk. 
However, in when using buildroot 2017.05.2 (which uses util-linux 2.29.2) lsblk
is not built.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
