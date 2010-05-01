From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  1 May 2010 11:31:21 +0000 (UTC)
Subject: [Buildroot] [Bug 1675] New: GMP Error during buildroot make process
Message-ID: <bug-1675-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1675

           Summary: GMP Error during buildroot make process
           Product: buildroot
           Version: 2010.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: skbobade at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

I am trying to build the Linux Kernel 2.6 for i386 core 2.

I gave make command after configuration and during the process of gmp following
error came:


configure: WARNING: you should use --build, --host, --target
configure: WARNING: you should use --build, --host, --target
configure: error: --target is not appropriate for GMP
Use --build=CPU-VENDOR-OS if you need to specify your CPU and/or system
explicitly.  Use --host if cross-compiling (see "Installing GMP" in the
manual for more on this).
make: ***
[/home/Sameer/buildroot-2010.02/output/toolchain/gmp-4.2.4-host/.configured]
Error 1




Please tell me how to work around...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
