From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 20 Apr 2008 08:35:56 -0700
Subject: [Buildroot] [buildroot 0002984]: [error] building a `generic_arm`
	toolchain
Message-ID: <d336ffb93ccf70395aaf8be6edec1a98@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2984 
====================================================================== 
Reported By:                maluta
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2984
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-20-2008 08:35 PDT
Last Modified:              04-20-2008 08:35 PDT
====================================================================== 
Summary:                    [error] building a `generic_arm`  toolchain
Description: 
make[1]: Entering directory
`/home/maluta/builroot/buildroot/toolchain_build_arm/uClibc-0.9.29'
make[2]: `conf' is up to date.
make[3]: `conf' is up to date.
  CC libpthread/linuxthreads/sysdeps/pthread/errno-loc.os
In file included from ./libpthread/linuxthreads/sysdeps/arm/tls.h:26,
                 from ./include/bits/uClibc_errno.h:14,
                 from ./include/errno.h:62,
                 from
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:21:
./libpthread/linuxthreads/sysdeps/arm/pt-machine.h:39: warning: C99 inline
functions are not supported; using GNU89
./libpthread/linuxthreads/sysdeps/arm/pt-machine.h:39: warning: to disable
this warning use -fgnu89-inline or the gnu_inline function attribute
In file included from
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:22:
./libpthread/linuxthreads/internals.h:538: warning: C99 inline functions
are not supported; using GNU89
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:27: error:
sysdep-cancel.h: No such file or directory
make[1]: *** [libpthread/linuxthreads/sysdeps/pthread/errno-loc.os] Error
1
make[1]: Leaving directory
`/home/maluta/builroot/buildroot/toolchain_build_arm/uClibc-0.9.29'
make: ***
[/home/maluta/builroot/buildroot/toolchain_build_arm/uClibc-0.9.29/lib/libc.a]
Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-20-08 08:35  maluta         New Issue                                    
04-20-08 08:35  maluta         Status                   new => assigned     
04-20-08 08:35  maluta         Assigned To               => buildroot       
04-20-08 08:35  maluta         File Added: config                           
======================================================================
