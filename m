From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:09 -0800
Subject: [Buildroot] [buildroot 0000051]: C++ without LFS support
Message-ID: <d33f0c34d5850457404d1faeb05c0967@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=51 
====================================================================== 
Reported By:                acmay
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   51
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-20-2005 10:09 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    C++ without LFS support
Description: 
When trying to build the libstdc++-v3 in the GCC final step it fails when
trying to use some of the LFS functions when they are not supported.
====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 01-23-06 11:00  
---------------------------------------------------------------------- 
enable LFS and it will work 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-20-05 10:09  acmay          New Issue                                    
01-20-05 10:09  acmay          File Added: uc-lfs.patch                     
03-16-05 12:14  andersen       Status                   new => assigned     
03-16-05 12:14  andersen       Assigned To               => uClibc          
08-08-05 01:52  mdeschamps     Issue Monitored: mdeschamps                    
08-11-05 07:32  mdeschamps     Issue End Monitor: mdeschamps                    
01-23-06 11:00  prpplague      Note Added: 0000985                          
01-23-06 11:00  prpplague      Status                   assigned => closed  
01-23-06 11:00  prpplague      Resolution               open => won't fix   
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
