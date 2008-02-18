From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 18 Feb 2008 01:14:44 -0800
Subject: [Buildroot] [buildroot 0002214]: fails to build toolchain with NPTL
	selected for powerpc target
Message-ID: <3f4f96e889e856bf1a282809bdbd1632@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2214 
====================================================================== 
Reported By:                fabo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2214
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-18-2008 01:14 PST
Last Modified:              02-18-2008 01:14 PST
====================================================================== 
Summary:                    fails to build toolchain with NPTL selected for
powerpc target
Description: 
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:27: error:
sysdep-cancel.h: No such file or directory

This is reproducible for powerpc target and NPTL support option.
Switching to another thread library implementation workarounds the issue.


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-18-08 01:14  fabo           New Issue                                    
02-18-08 01:14  fabo           Status                   new => assigned     
02-18-08 01:14  fabo           Assigned To               => buildroot       
======================================================================
