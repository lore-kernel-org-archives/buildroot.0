From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 3 Mar 2007 21:05:50 -0800
Subject: [Buildroot] [buildroot 0001256]: build fails for buildroot selected
	for i386/i386 pthread.c compile error
Message-ID: <05216ccfbc0949f027855b46141c05bb@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1256 
====================================================================== 
Reported By:                douglas_goodall
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1256
Category:                   Architecture Specific
Reproducibility:            have not tried
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-03-2007 21:05 PST
Last Modified:              03-03-2007 21:05 PST
====================================================================== 
Summary:                    build fails for buildroot selected for i386/i386
pthread.c compile error
Description: 
  CC libpthread/linuxthreads.old/pthread.oS
  STRIP -x -R .note -R .comment
libpthread/linuxthreads.old/libpthread_so.a
  AR cr libpthread/linuxthreads.old/libpthread_so.a
  LD libpthread-0.9.29.so
libpthread/linuxthreads.old/libpthread_so.a(pthread.oS): In function
`__pthread_initialize_minimal':
pthread.c:(.text+0x13f): undefined reference to `_errno'
pthread.c:(.text+0x148): undefined reference to `_h_errno'
make[1]: *** [lib/libpthread.so] Error 1
make[1]: Leaving directory
`/home/doug/buildroot/toolchain_build_i386/uClibc'
make: *** [/home/doug/buildroot/toolchain_build_i386/uClibc/lib/libc.a]
Error 2
doug at ubuntu-i386:~/buildroot$


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-03-07 21:05  douglas_goodallNew Issue                                    
03-03-07 21:05  douglas_goodallStatus                   new => assigned     
03-03-07 21:05  douglas_goodallAssigned To               => buildroot       
======================================================================
