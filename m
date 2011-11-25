From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Nov 2011 07:00:23 +0000 (UTC)
Subject: [Buildroot] [Bug 4538] New: main() not exited normally then using
	pthreads
Message-ID: <bug-4538-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4538

           Summary: main() not exited normally then using pthreads
           Product: buildroot
           Version: 2011.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: sunheretic13 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3782
  --> https://bugs.busybox.net/attachment.cgi?id=3782
Source Code demonstrated a bug

Architecture: x86.

When I build system with buildroot-2011.08 with uclibc-0.9.32 (old stable
threads)simple program not working properly.

main function not exited normally. Program not stopped, until I not press
Ctrl-C.

But if I put _exit() at the end of main(), the program exited normally???

Attach: simple program source code.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
