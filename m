From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:43 -0800
Subject: [Buildroot] [buildroot 0000476]: buildroot patch to build linux
	kernel for target/device/Via/epia-mii
Message-ID: <ff0e858bfdef8778784b7c45a0685cde@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=476 
====================================================================== 
Reported By:                gnat
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   476
Category:                   Other
Reproducibility:            N/A
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-06-2005 22:55 PDT
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    buildroot patch to build linux kernel for
target/device/Via/epia-mii
Description: 
some update somewhere made the Via/Makefile.in file no longer build the
kernel when TARGET+= is after the include file. The following patch fixes
this.
====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 01-20-06 12:52  
---------------------------------------------------------------------- 
fixed as of 13458 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-06-05 22:55  gnat           New Issue                                    
10-06-05 22:55  gnat           Status                   new => assigned     
10-06-05 22:55  gnat           Assigned To               => uClibc          
01-20-06 12:52  prpplague      Note Added: 0000965                          
01-20-06 12:52  prpplague      Status                   assigned => resolved
01-20-06 12:52  prpplague      Resolution               open => fixed       
03-08-06 16:56  vapier         Status                   resolved => closed  
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
