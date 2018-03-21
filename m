From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Mar 2018 08:17:07 +0000
Subject: [Buildroot] [Bug 10886] New: openssl-1.0.2n fails to build
Message-ID: <bug-10886-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10886

            Bug ID: 10886
           Summary: openssl-1.0.2n fails to build
           Product: buildroot
           Version: 2018.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: seregajsv at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7551
  --> https://bugs.busybox.net/attachment.cgi?id=7551&action=edit
Fixed 0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch

When applying 0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
occurs error:

patching file Makefile.org
Hunk #1 FAILED at 527.
1 out of 1 hunk FAILED -- saving rejects to file Makefile.org.rej

I fixed this problem for myself. Please, see attachment.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
