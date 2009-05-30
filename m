From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 30 May 2009 20:42:29 +0000 (UTC)
Subject: [Buildroot] [Bug 363] New: uClibc build fails in 2009.05-rc3
Message-ID: <bug-363-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=363

              Host: x86
            Target: mips
           Summary: uClibc build fails in 2009.05-rc3
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: eike at sf-mail.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=369)
 --> (https://bugs.busybox.net/attachment.cgi?id=369)
Configuration used

I tested 2009.05-rc3 on my openSuSE 11.1 (x86) and it fails with this error:

make[1]: Entering directory
`/home/eike/repos/buildroot-2009.05-rc3/toolchain_build_mips/uClibc-0.9.30.1'
  CC libpthread/linuxthreads/sysdeps/pthread/errno-loc.oS
In file included from libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:
./libpthread/linuxthreads/sysdeps/unix/sysv/linux/mips/sysdep-cancel.h:20:20:
error: sysdep.h: No such file or directory
make[1]: *** [libpthread/linuxthreads/sysdeps/pthread/errno-loc.oS] Fehler 1
make[1]: Leaving directory
`/home/eike/repos/buildroot-2009.05-rc3/toolchain_build_mips/uClibc-0.9.30.1'
make: ***
[/home/eike/repos/buildroot-2009.05-rc3/build_mips/staging_dir/usr/lib/libc.a]
Fehler 2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
