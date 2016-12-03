From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 03 Dec 2016 16:17:38 +0000
Subject: [Buildroot] [Bug 9461] New: toolchain Linaro AArch64 2016.11
	compile error
Message-ID: <bug-9461-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9461

            Bug ID: 9461
           Summary: toolchain Linaro AArch64 2016.11 compile error
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: gmg.kostik at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I try build odroidc2_defconfig.
Select external toolchain Linaro AArch64 2016.11.

Bug out when compiling uboot:

../include/linux/compiler-gcc.h:114:30: fatal error: linux/compiler-gcc6.h: No
such file or directory


Then i use toolchain Linaro AArch64 2016.05 all ok.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
