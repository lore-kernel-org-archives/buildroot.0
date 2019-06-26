From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Jun 2019 12:50:21 +0000
Subject: [Buildroot] [Bug 11991] New: [numpy] segfault when compiling for
 RPi3 64bits
Message-ID: <bug-11991-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11991

            Bug ID: 11991
           Summary: [numpy] segfault when compiling for RPi3 64bits
           Product: buildroot
           Version: 2019.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: xonqnoppp at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8126
  --> https://bugs.busybox.net/attachment.cgi?id=8126&action=edit
log of numpy compilation

When building for RaspberryPi 3 with 64bits from buildroot-2019.05 I get the
attached error. It did not happen with 32bits.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
