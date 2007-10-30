From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 30 Oct 2007 03:31:31 -0700
Subject: [Buildroot] [buildroot 0001561]: missing a $ in assignment for
	COND_ARCH_FPU_SUFFIX:=(ARCH_FPU_SUFFIX)
Message-ID: <93397e959d6309bbe3b070720e2861d6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             10-30-2007 02:26 PDT
Last Modified:              10-30-2007 03:31 PDT
====================================================================== 
Summary:                    missing a $ in assignment for
COND_ARCH_FPU_SUFFIX:=(ARCH_FPU_SUFFIX)
Description: 
on revision 20328 in file package/Makefile.in line 78
COND_ARCH_FPU_SUFFIX:=(ARCH_FPU_SUFFIX)
should be 
COND_ARCH_FPU_SUFFIX:=$(ARCH_FPU_SUFFIX)
====================================================================== 

---------------------------------------------------------------------- 
 Ulf Samuelsson - 10-30-07 03:31  
---------------------------------------------------------------------- 
Fixed in rev 20330 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-30-07 02:26  stephaneC      New Issue                                    
10-30-07 02:26  stephaneC      Status                   new => assigned     
10-30-07 02:26  stephaneC      Assigned To               => buildroot       
10-30-07 03:31  Ulf Samuelsson Status                   assigned => closed  
10-30-07 03:31  Ulf Samuelsson Note Added: 0002869                          
======================================================================
