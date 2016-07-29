From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 29 Jul 2016 23:04:51 +0000
Subject: [Buildroot] [Bug 9111] New: glibc 2.23: libmvec.so not copied
Message-ID: <bug-9111-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9111

            Bug ID: 9111
           Summary: glibc 2.23: libmvec.so not copied
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: eljedi at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6561
  --> https://bugs.busybox.net/attachment.cgi?id=6561&action=edit
Patch enable glibc installer to copy libmvec.so

Current github version of buildroot does not copy libmvec.so from glibc 2.23 to
target directory.

I'm attaching a simple patch to fix it

-- 
You are receiving this mail because:
You are on the CC list for the bug.
