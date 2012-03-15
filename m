From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Mar 2012 14:58:39 +0000 (UTC)
Subject: [Buildroot] [Bug 4928] New: internal compiler error in varasm.c
Message-ID: <bug-4928-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4928

           Summary: internal compiler error in varasm.c
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: erland at lewin.nu
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Building buildroot 2012.02 form arm / arm7tdmi, EABI, buildroot toolchain,
Linux 2.6.24, uClibc 0.9.33.x, binutils 2.22, gcc 4.6.x, elf2flt enabled,
enable large files.

Error building uClibC: 

libc/misc/internals/errno.c:8:1: internal compiler error: in do_assemble_alias,
at varasm.c:5444
Please submit a full bug report,
with preprocessed source if appropriate.

Host is 64 bit Ubuntu 10.10 I think.

I can repeat error by doing make clean and then make again.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
