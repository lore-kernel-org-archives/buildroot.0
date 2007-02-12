From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:26 -0800
Subject: [Buildroot] [buildroot 0000532]: adds ARM variant support and
	little/big endian support to config
Message-ID: <edf8d8b92db7fdd41158414c4e51849f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=532 
====================================================================== 
Reported By:                prpplague
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   532
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-04-2005 12:07 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    adds ARM variant support and little/big endian
support to config
Description: 
this patch adds options to specify the arm variant and little endian
configurations.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 11-04-05 12:14  
---------------------------------------------------------------------- 
adding an option for selection endian doesnt make any sense, that's the
entire point of making people select 'arm' or 'armeb' 

---------------------------------------------------------------------- 
 prpplague - 11-04-05 12:20  
---------------------------------------------------------------------- 
changed the arm_generic to generic_arm to match naming inside uClibc 

---------------------------------------------------------------------- 
 prpplague - 11-04-05 12:42  
---------------------------------------------------------------------- 
per vapier i've changed the little/big endian support to be selected via
the arm/armeb arch selection. i've also made the endianesse setting in
uClibc not arm specific and across all archs 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-04-05 12:07  prpplague      New Issue                                    
11-04-05 12:07  prpplague      Status                   new => assigned     
11-04-05 12:07  prpplague      Assigned To               => uClibc          
11-04-05 12:07  prpplague      File Added: patch-buildroot-subarm               
    
11-04-05 12:14  vapier         Note Added: 0000661                          
11-04-05 12:19  prpplague      File Added: patch-buildroot-subarm-v2            
       
11-04-05 12:20  prpplague      Note Added: 0000662                          
11-04-05 12:41  prpplague      File Added: patch-buildroot-subarm-v3            
       
11-04-05 12:42  prpplague      Note Added: 0000663                          
01-19-06 07:04  prpplague      Status                   assigned => closed  
01-19-06 07:04  prpplague      Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
