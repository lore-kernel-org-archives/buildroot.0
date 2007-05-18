From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 18 May 2007 15:51:42 -0700
Subject: [Buildroot] [buildroot 0001357]: EABI on ARM compiled buildroot
	doesn't work
Message-ID: <382b959b3a746ebc2588f95b6522affd@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1357 
====================================================================== 
Reported By:                marvin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1357
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-18-2007 14:56 PDT
Last Modified:              05-18-2007 15:51 PDT
====================================================================== 
Summary:                    EABI on ARM compiled buildroot doesn't work
Description: 
I compile latest buildroot with target ARM and EABI al without problems.
But when I boot to new root all programs crash with Illegal instruction. I
use default config only chose generic ARM and EABI.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 05-18-07 15:15  
---------------------------------------------------------------------- 
Without *any* information, this is not a valid bug-report. Will close
unless you provide details. 

---------------------------------------------------------------------- 
 marvin - 05-18-07 15:51  
---------------------------------------------------------------------- 
Please tell me which information you need I spend time to gogling to solve
this but nothing helps. Do you need config ? Or information about hw ? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-18-07 14:56  marvin         New Issue                                    
05-18-07 14:56  marvin         Status                   new => assigned     
05-18-07 14:56  marvin         Assigned To               => buildroot       
05-18-07 15:15  bernhardf      Note Added: 0002375                          
05-18-07 15:51  marvin         Note Added: 0002377                          
======================================================================
