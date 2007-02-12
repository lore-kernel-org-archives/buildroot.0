From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:31 -0800
Subject: [Buildroot] [buildroot 0001199]: CVS not inserted in config and
	broken. Patch attached.
Message-ID: <cf3c3c04a26d3b279e58156a6c34e3d4@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1199 
====================================================================== 
Reported By:                stoecker
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1199
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-05-2007 23:29 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    CVS not inserted in config and broken. Patch
attached.
Description: 
The building of cvs is broken and disabled.

Attached is a patch fixing this.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 02-06-07 03:23  
---------------------------------------------------------------------- 
Fixed in r17787. Thanks for pointing this out. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-05-07 23:29  stoecker       New Issue                                    
02-05-07 23:29  stoecker       Status                   new => assigned     
02-05-07 23:29  stoecker       Assigned To               => uClibc          
02-05-07 23:29  stoecker       File Added: cvs.diff                         
02-06-07 03:23  bernhardf      Status                   assigned => closed  
02-06-07 03:23  bernhardf      Note Added: 0002125                          
02-06-07 03:23  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
