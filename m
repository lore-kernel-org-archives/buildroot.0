From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 15 Jun 2016 07:33:10 +0000
Subject: [Buildroot] [Bug 9001] New: Nodejs option not available
Message-ID: <bug-9001-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9001

            Bug ID: 9001
           Summary: Nodejs option not available
           Product: buildroot
           Version: 2016.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ian_ormshaw at waters.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6481
  --> https://bugs.busybox.net/attachment.cgi?id=6481&action=edit
nodejs option not available config file

I'm developing on fedora 24 (gcc 6)

In buildroot 2016.05 the comment

*** nodejs needs a toolchain w/ C++, dynamic library, threads, gcc >= 4.8,
wchar ***

is always displayed  

The test that is failing is BR2_HOST_GCC_AT_LEAST_4_8

-- 
You are receiving this mail because:
You are on the CC list for the bug.
