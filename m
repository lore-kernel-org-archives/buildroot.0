From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 12 Apr 2007 07:19:43 -0700
Subject: [Buildroot] [buildroot 0001310]: __progname = 0
Message-ID: <bb905c841a5878e54acfa3aeccec33c1@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1310 
====================================================================== 
Reported By:                letshriramin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1310
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-12-2007 07:19 PDT
Last Modified:              04-12-2007 07:19 PDT
====================================================================== 
Summary:                    __progname = 0
Description: 
When main is started __progname = 0 which causes sshd/ssh like programs
which use _progname to core dump
Tested for powerpc architecture - gcc3.4.6 & gcc4.1.2
It may be due to the aliasing __progname & uclibc_progname with uclibc
version 0.9.29
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-12-07 07:19  letshriramin   New Issue                                    
04-12-07 07:19  letshriramin   Status                   new => assigned     
04-12-07 07:19  letshriramin   Assigned To               => buildroot       
======================================================================
