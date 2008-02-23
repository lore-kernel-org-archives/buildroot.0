From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 23 Feb 2008 14:56:29 -0800
Subject: [Buildroot] [buildroot 0002214]: fails to build toolchain with NPTL
	selected for powerpc target
Message-ID: <bd067a0ff025af27d01163cb9ba25fd1@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been UPDATED. 
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
Last Modified:              02-23-2008 14:56 PST
====================================================================== 
Summary:                    fails to build toolchain with NPTL selected for
powerpc target
Description: 
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:27: error:
sysdep-cancel.h: No such file or directory

This is reproducible for powerpc target and NPTL support option.
Switching to another thread library implementation workarounds the issue.


====================================================================== 

---------------------------------------------------------------------- 
 sjhill - 02-23-08 14:55  
---------------------------------------------------------------------- 
uClibc NPTL is not available for the PPC architecture yet. It will be a few
months before that is available. 

---------------------------------------------------------------------- 
 sjhill - 02-23-08 14:56  
---------------------------------------------------------------------- 
This is not a buildroot issue. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-18-08 01:14  fabo           New Issue                                    
02-18-08 01:14  fabo           Status                   new => assigned     
02-18-08 01:14  fabo           Assigned To               => buildroot       
02-18-08 01:15  fabo           Issue Monitored: fabo                        
02-23-08 14:55  sjhill         Note Added: 0005274                          
02-23-08 14:56  sjhill         Note Added: 0005284                          
======================================================================
