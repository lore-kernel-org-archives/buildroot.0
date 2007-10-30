From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 30 Oct 2007 02:26:41 -0700
Subject: [Buildroot] [buildroot 0001561]: missing a $ in assignment for
	COND_ARCH_FPU_SUFFIX:=(ARCH_FPU_SUFFIX)
Message-ID: <e6e3f7cb5b2af5f2abee51ac13e1d384@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1561 
====================================================================== 
Reported By:                stephaneC
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1561
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-30-2007 02:26 PDT
Last Modified:              10-30-2007 02:26 PDT
====================================================================== 
Summary:                    missing a $ in assignment for
COND_ARCH_FPU_SUFFIX:=(ARCH_FPU_SUFFIX)
Description: 
on revision 20328 in file package/Makefile.in line 78
COND_ARCH_FPU_SUFFIX:=(ARCH_FPU_SUFFIX)
should be 
COND_ARCH_FPU_SUFFIX:=$(ARCH_FPU_SUFFIX)
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-30-07 02:26  stephaneC      New Issue                                    
10-30-07 02:26  stephaneC      Status                   new => assigned     
10-30-07 02:26  stephaneC      Assigned To               => buildroot       
======================================================================
