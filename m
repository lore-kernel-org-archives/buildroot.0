From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Feb 2009 07:47:35 +0000 (UTC)
Subject: [Buildroot] [Bug 89] New: changing the default string for GNU
 target suffix does not work
Message-ID: <bug-89-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=89

              Host: Linux PC
            Target: PowerPC and ARM
           Summary: changing the default string for GNU target suffix does
                    not work
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: vania.joloboff at tsinghua.edu.cn
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I am using latest buildroot version 2009-02-rc3.
I am trying to generate the toolchain for ARM, PPC and MIPS
In the configuration menu, in the Build Options submenu there is an option for
GNU target suffix. The default value is "linux-uclibc"

If this string is changed to another value for example "elf-uclibc" the build
process fails with an error, for both ARM (generic) and PowerPC (generic) at
least.

I have only set this variable and the install directory to be
/usr/local/cross/{target-arch}/ and I am using make O=path/to/build


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
