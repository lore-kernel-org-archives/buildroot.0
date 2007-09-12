From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 12 Sep 2007 08:54:55 -0700
Subject: [Buildroot] [buildroot 0001499]: 0.9.29 fails to compile: sysdep.h:
	No such file or directory
Message-ID: <2d10dd83b264c36a748f9b2c13fbe62c@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1499 
====================================================================== 
Reported By:                bgs
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1499
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-12-2007 08:54 PDT
Last Modified:              09-12-2007 08:54 PDT
====================================================================== 
Summary:                    0.9.29 fails to compile: sysdep.h: No such file or
directory
Description: 
Compilation fails with the following error:

In file included from
./libpthread/linuxthreads/sysdeps/i386/i686/pt-machine.h:73,
                 from
./libpthread/linuxthreads/sysdeps/i386/pt-machine.h:24,
                 from ./libpthread/linuxthreads/sysdeps/i386/tls.h:23,
                 from ./include/bits/uClibc_errno.h:35,
                 from ./include/errno.h:62,
                 from ./include/bits/syscalls.h:14,
                 from ./include/sys/syscall.h:34,
                 from ./ldso/ldso/i386/dl-syscalls.h:3,
                 from ./ldso/include/dl-syscall.h:12,
                 from ./ldso/include/ldso.h:36,
                 from ldso/ldso/ldso.c:33:
./libpthread/linuxthreads/sysdeps/i386/i686/../useldt.h:25:20: error:
sysdep.h: No such file or directory
make[1]: *** [ldso/ldso/ldso.oS] Error 1

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-12-07 08:54  bgs            New Issue                                    
09-12-07 08:54  bgs            Status                   new => assigned     
09-12-07 08:54  bgs            Assigned To               => buildroot       
======================================================================
