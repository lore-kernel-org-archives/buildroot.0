From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:25 -0800
Subject: [Buildroot] [buildroot 0001052]: MMU: Build fails for MIPS-1 target,
	vfork.c, `fork' undeclared here
Message-ID: <8856ed89aad9ba5005945f33c07fec49@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1052 
====================================================================== 
Reported By:                dash77
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1052
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-25-2006 11:16 PDT
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    MMU: Build fails for MIPS-1 target, vfork.c, `fork'
undeclared here
Description: 
  CC libc/sysdeps/linux/common/uselib.os
  CC libc/sysdeps/linux/common/ustat.os
  CC libc/sysdeps/linux/common/utime.os
  CC libc/sysdeps/linux/common/utimes.os
  CC libc/sysdeps/linux/common/vfork.os
libc/sysdeps/linux/common/vfork.c:13: error: `fork' undeclared here (not
in a function)
libc/sysdeps/linux/common/vfork.c:13: warning: type defaults to `int' in
declaration of `fork'
libc/sysdeps/linux/common/vfork.c: In function `__vfork':
libc/sysdeps/linux/common/vfork.c:18: error: called object is not a
function
make[2]: *** [libc/sysdeps/linux/common/vfork.os] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory
`/home/dash/code/vhdl/buildroot/buildroot/toolchain_build_mips_nofpu/uClibc'
make: ***
[/home/dash/code/vhdl/buildroot/buildroot/toolchain_build_mips_nofpu/uClibc/lib/libc.a]
Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-25-06 11:16  dash77         New Issue                                    
09-25-06 11:16  dash77         Status                   new => assigned     
09-25-06 11:16  dash77         Assigned To               => uClibc          
02-04-07 09:10  bernhardf      Summary                  Build fails for MIPS-1
target, vfork.c, `fork' undeclared here => MMU: Build fails for MIPS-1 target,
vfork.c, `fork' undeclared here
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
