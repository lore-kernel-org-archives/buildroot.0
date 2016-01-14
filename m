From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Jan 2016 21:57:57 +0000
Subject: [Buildroot] [Bug 8606] New: Problem compiling on Arch Linux
Message-ID: <bug-8606-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8606

            Bug ID: 8606
           Summary: Problem compiling on Arch Linux
           Product: buildroot
           Version: 2015.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: l.andro.cs at gmail.com
                CC: buildroot at uclibc.org

Hello,

  This is not technically a bug with buildroot, but with libiconv in Arch
Linux, but the only "workaround" that I found so far has to be done with the
"configure" phase of building anything that use libiconv on Arch Linux.
  I need to pass "--with-libiconv" option to the configure script of uCLib, or
any other that use the HOST (Arch Linux, in this case) libiconv, so that the
configure can setup the compiler to find it.
  So, how can I pass this option in buildroot?

Thanks.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
