From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:23 -0800
Subject: [Buildroot] [buildroot 0000109]: ARM uClibc prompts for configure
	variables
Message-ID: <6b9c0584ef250d0539ab89fb6b74a9cc@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=109 
====================================================================== 
Reported By:                acmay
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   109
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-17-2005 17:05 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    ARM uClibc prompts for configure variables
Description: 
When building for ARM the config file for uClibc is missing some values and
it prompts the user for them during the build.

I did this patch to fix the problem but I don't know if there is a better
way.
====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 01-19-06 07:18  
---------------------------------------------------------------------- 
fixed with the addition of the arm variants patch as of 13422 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-17-05 17:05  acmay          New Issue                                    
02-17-05 17:05  acmay          File Added: arm-uc.patch                     
03-16-05 12:13  andersen       Status                   new => assigned     
03-16-05 12:13  andersen       Assigned To               => uClibc          
01-19-06 07:18  prpplague      Note Added: 0000955                          
01-19-06 07:18  prpplague      Status                   assigned => closed  
01-19-06 07:18  prpplague      Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
