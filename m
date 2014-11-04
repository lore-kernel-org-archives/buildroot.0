From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  4 Nov 2014 11:29:01 +0000 (UTC)
Subject: [Buildroot] [Bug 7592] New: Buildroot GCC: -lto requires plugin
 support in ranlib
Message-ID: <bug-7592-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7592

           Summary: Buildroot GCC: -lto requires plugin support in ranlib
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: syntheticpp at gmx.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


To circumvent linker errors when lto is enabled I use  
arm-linux-gcc-ranlib and arm-linux-gcc-ar
but arm-linux-gcc-ranlib stops with this error:

sorry - this program has been built without plugin support


Config:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABIHF=y
BR2_ARM_FPU_VFPV3=y
BR2_DEPRECATED=y
BR2_OPTIMIZE_3=y
BR2_TOOLCHAIN_BUILDROOT_EGLIBC=y
BR2_EGLIBC_VERSION_2_19=y
BR2_BINUTILS_VERSION_2_24=y
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
