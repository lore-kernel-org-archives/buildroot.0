From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  2 Feb 2009 20:07:43 +0000 (UTC)
Subject: [Buildroot] [Bug 85] New: liblockfile fails to install due to
 missing directories
Message-ID: <bug-85-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=85

              Host: pc-linux
            Target: arm-linux-gnueabi (gcc 4.2.2)
             Build: 2009.02-rc3
           Summary: liblockfile fails to install due to missing directories
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: hunter.cobbs at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


install -m 644 lockfile.h maillock.h
/home/hcobbs/dev/src/buildroot-2009.02-rc3/ucm_build_arm/staging_dir/usr/local/include
install: target
`/home/hcobbs/dev/src/buildroot-2009.02-rc3/ucm_build_arm/staging_dir/usr/local/include'
is not a directory
make[1]: *** [install_common] Error 1

---------------------------------

also occurs for man1/man3


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
