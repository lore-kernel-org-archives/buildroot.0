From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 22 Apr 2008 08:51:47 -0700
Subject: [Buildroot] [buildroot 0003064]: strace build on MIPS - w. kernel
	2.6.15
Message-ID: <5d682f294967fff366f1086d1410b882@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3064 
====================================================================== 
Reported By:                glavepp
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3064
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-22-2008 08:51 PDT
Last Modified:              04-22-2008 08:51 PDT
====================================================================== 
Summary:                    strace build on MIPS - w. kernel 2.6.15
Description: 
I'm building "strace" on mips, using directly the kernel headers from the
2.6.15 kernel (I don't know if this is a good practice...).
In this case, I cannot build, because of a different declaration of the
"struct sigcontext".
The attached patch solves the problem.


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-22-08 08:51  glavepp        New Issue                                    
04-22-08 08:51  glavepp        Status                   new => assigned     
04-22-08 08:51  glavepp        Assigned To               => buildroot       
04-22-08 08:51  glavepp        File Added: strace-mips-sigcontext-kernel26.patch
                   
======================================================================
