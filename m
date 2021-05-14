From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 May 2021 10:19:46 +0000
Subject: [Buildroot] [Bug 13806] New: Building host-localedef fails on
 fedora 34/gcc 11
Message-ID: <bug-13806-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13806

            Bug ID: 13806
           Summary: Building host-localedef  fails on fedora 34/gcc 11
           Product: buildroot
           Version: 2021.02
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ian_ormshaw at waters.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8946
  --> https://bugs.busybox.net/attachment.cgi?id=8946&action=edit
error from build output

When building under fedora 34 x86_64 with gcc (GCC) 11.1.1 20210428 (Red Hat
11.1.1-1)
compilation fails with the attached error.  I haven't seen this before so I
assume it is a gcc 11 specific issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
