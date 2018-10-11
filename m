From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Oct 2018 09:55:44 +0000
Subject: [Buildroot] [Bug 11391] New: Valgind availability on ARM
Message-ID: <bug-11391-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11391

            Bug ID: 11391
           Summary: Valgind availability on ARM
           Product: buildroot
           Version: 2018.02.4
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jpcartal at free.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

Valgrind package is not selectable for ARMv8 platform in version 2018.02.4,
which seems normal since the packaged Valgrind version is 3.12.0.

However, in version 2018.05.x the valgrind version has been updated to 3.13.0
and Config.in was modified to add BR2_aarch64, however my understanding is that
Valgrind does also support ARMv8 in 32 bits mode (see
https://bugs.kde.org/show_bug.cgi?id=372185), and in this case it can not be
selected.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
